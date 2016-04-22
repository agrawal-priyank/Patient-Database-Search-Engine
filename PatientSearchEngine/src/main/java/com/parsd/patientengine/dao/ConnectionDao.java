package com.parsd.patientengine.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.UUID;

import com.parsd.patientengine.pojo.BedAssignment;
import com.parsd.patientengine.pojo.Doctor;
import com.parsd.patientengine.pojo.Patient;

import java.sql.PreparedStatement;

public class ConnectionDao {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/patient";// mysql://newton.neu.edu:3306/usersdb","student","p@sswOrd"
	static final String USER = "root";
	static final String PASS = "1234";
	private static ConnectionDao connectionDao;

	private ConnectionDao() {

	}

	public static ConnectionDao getConnectionDao() {
		if (connectionDao == null)
			connectionDao = new ConnectionDao();
		return connectionDao;
	}

	public static Connection getConnection() {
		Connection connection = null;
		// STEP 2: Register JDBC driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// STEP 3: Open a connection
		System.out.println("Connecting to database...");
		try {
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("Success!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public static ResultSet executeQueryString(Connection conn, String query, String[] split,String location) {
		
		PreparedStatement pstmt = null;
		Map<Integer, String> paramters = new HashMap<Integer, String>();
		try {
			
			if(split != null && split.length > 0){
				query += " where p.patient_fname = ?";
				paramters.put(paramters.size() + 1, split[0]);
			}
			
			if(split != null && split.length > 1){
				if(paramters.size() > 0)
					query += " and p.patient_lname = ?";
				else
					query += " where p.patient_lname = ?";
				paramters.put(paramters.size() + 1, split[1]);
			}
			
			if(location != null && location.length() > 0 && !location.equalsIgnoreCase("Any")){
				if(paramters.size() > 0)
					query += " and a.state = ?";
				else
					query += " where a.state = ?";
				paramters.put(paramters.size() + 1, location);
			}
			System.out.println("executeQueryString "+query);
			pstmt = conn.prepareStatement(query);
			
			if(paramters.size() > 0){
				for (Entry<Integer, String> entry  : paramters.entrySet()) {
				    System.out.println(entry.getKey() + " - " + entry.getValue());
				    pstmt.setString(entry.getKey(), entry.getValue());
				}

			}
			ResultSet resultSet = pstmt.executeQuery();
			
			return resultSet;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public static ResultSet executeVisitQuery(Connection conn, String query, String date , String type) {
		
		Map<Integer, Object> paramters = new HashMap<Integer, Object>();
		
		try {
			PreparedStatement pstmt = null;
			
			if(date != null && date.length() > 0){
				query += " where pe.event_date = ?";
				paramters.put(paramters.size() + 1, date);
			}
			
			if(type != null && type.length() > 1 && !type.equalsIgnoreCase("Any")){
				if(paramters.size() > 0)
					query += " and  pe.patient_type = ?";
				else
					query += " where  pe.patient_type = ?";
				paramters.put(paramters.size() + 1,type);
			}
			
			pstmt = conn.prepareStatement(query);
			if(paramters.size() > 0){
				for (Entry<Integer, Object> entry  : paramters.entrySet()) {
				    System.out.println(entry.getKey() + " - " + entry.getValue());
				    if(entry.getValue() instanceof Integer){
				    	pstmt.setInt(entry.getKey(), (Integer)entry.getValue());
				    }else{
				    	 pstmt.setString(entry.getKey(), (String)entry.getValue());
				    }
				   
				}

			}
			ResultSet resultSet = pstmt.executeQuery();
			return resultSet;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public static List<Doctor> getDoctor(Connection conn, String[] split, String specialiaty){
		
		List<Doctor> doctors = new ArrayList<Doctor>();
		Map<Integer, String> paramters = new HashMap<Integer, String>();
		try {
			PreparedStatement pstmt = null;
			String query = "select * from patient.doctor d ";
			if(split != null && split.length > 0){
				query += "where d.doctor_fname = ?";
				paramters.put(paramters.size() + 1, split[0]);
			}
			
			if(split != null && split.length > 1){
				if(paramters.size() > 0)
					query += " and d.doctor_lname = ?";
				else
					query += "where d.doctor_lname = ?";
				paramters.put(paramters.size() + 1, split[1]);
			}
			
			if(specialiaty != null && specialiaty.length() > 0 && !specialiaty.equalsIgnoreCase("All")){
				if(paramters.size() > 0)
					query += " and d.doctor_specialization = ?";
				else
					query += "where d.doctor_specialization = ?";
				paramters.put(paramters.size() + 1, specialiaty);
			}
			System.out.println("getDoctor "+query);
			pstmt = conn.prepareStatement(query);
			
			if(paramters.size() > 0){
				for (Entry<Integer, String> entry  : paramters.entrySet()) {
				    System.out.println(entry.getKey() + " - " + entry.getValue());
				    pstmt.setString(entry.getKey(), entry.getValue());
				}

			}
			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				
				Doctor doctor = new Doctor();
				doctor.setDoctorId(resultSet.getInt(1));
				doctor.setDoctorUpin(resultSet.getString(2));
				doctor.setDoctorFname(resultSet.getString(3));
				doctor.setDoctorLname(resultSet.getString(4));
				doctor.setDoctorMname(resultSet.getString(5));
				doctor.setDoctorSpecialization(resultSet.getString(6));
				doctors.add(doctor);
			}
			return doctors;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return doctors;
	}
	
	public static List<BedAssignment> getBedAssigned(Connection conn, Integer bedNumber, String roomType){
		
		List<BedAssignment> bedAssignments = new ArrayList<BedAssignment>();
		Map<Integer, Object> paramters = new HashMap<Integer, Object>();
		try {
			PreparedStatement pstmt = null;
			String query = "Select * from patient p inner join bed_assignment pbd on pbd.patient_UPI = p.patient_UPI ";
			if(bedNumber != null){
				query += "where pbd.bed_assignment_id = ?";
				paramters.put(paramters.size() + 1, bedNumber);
			}
			
			if(roomType != null && roomType.length() > 0){
				if(paramters.size() > 0)
					query += " or ward_type = ?";
				else
					query += "where pbd.ward_type = ?";
				paramters.put(paramters.size() + 1, roomType);
			}
			System.out.println("getBedAssigned "+query);
			pstmt = conn.prepareStatement(query);
			
			if(paramters.size() > 0){
				for (Entry<Integer, Object> entry  : paramters.entrySet()) {
				    System.out.println(entry.getKey() + " - " + entry.getValue());
				    if(entry.getValue() instanceof Integer){
				    	pstmt.setInt(entry.getKey(), (Integer)entry.getValue());
				    }else{
				    	 pstmt.setString(entry.getKey(), (String)entry.getValue());
				    }
				   
				}

			}
			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				
				BedAssignment bedAssignment = new BedAssignment();
				bedAssignment.setBedAssignmentId(resultSet.getInt(16));
				bedAssignment.setWardType(resultSet.getString(19));
				bedAssignment.setDateFrom(resultSet.getDate(17));
				bedAssignment.setDateTill(resultSet.getDate(18));
				bedAssignment.getPatientEvent().getPatient().setPatientFname(resultSet.getString(2));
				bedAssignment.getPatientEvent().getPatient().setPatientLname(resultSet.getString(3));
			    bedAssignments.add(bedAssignment);
			}
			return bedAssignments;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bedAssignments;
	}

	public static int executeUpdateQuery(Connection conn, String insertQuery, String isbn, String title, String author,
			float price) {
		int cnt = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(insertQuery);
			pstmt.setString(1, isbn);
			pstmt.setString(2, title);
			pstmt.setString(3, author);
			pstmt.setFloat(4, price);
			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;

	}

	public static String insertPatient(Connection conn, Patient patient) {
		String last_inserted_id = null;
		String varname1 = "" + "INSERT INTO patient(patient_fname, " + "					patient_lname, "
				+ "					patient_dob, " + "					gender, "
				+ "					disability_status, " + "					cell_phone, "
				+ "					emergency_contact_name, " + "					emergency_contact_number, "
				+ "					emergency_contact_relationship, " + "					patient_mname, "
				+ "					blood_group, " + "					home_phone, "
				+ "					marital_status, " + "					patient_pcp_name,patient_UPI) "
				+ "			VALUES (" + "					?, " + "					?, " + "					?, "
				+ "					?, " + "					?, " + "					?, "
				+ "					?, " + "					?, " + "					?, "
				+ "					?, " + "					?, " + "					?, "
				+ "					?, " + "					?, ?)";

		System.out.println("insertPatient " + varname1);

		try {
			PreparedStatement pstmt = conn.prepareStatement(varname1);
			pstmt.setString(1, patient.getPatientFname());
			pstmt.setString(2, patient.getPatientLname());
			pstmt.setDate(3, new java.sql.Date(patient.getPatientDob().getTime()));
			pstmt.setString(4, Character.toString(patient.getGender()));
			pstmt.setString(5, Character.toString(patient.getDisabilityStatus()));
			pstmt.setString(6, patient.getCellPhone());
			pstmt.setString(7, patient.getEmergencyContactName());
			pstmt.setString(8, patient.getEmergencyContactNumber());
			pstmt.setString(9, patient.getEmergencyContactRelationship());
			pstmt.setString(10, patient.getPatientMname());
			pstmt.setString(11, patient.getBloodGroup());
			pstmt.setString(12, patient.getHomePhone());
			pstmt.setString(13, patient.getMaritalStatus());
			pstmt.setString(14, patient.getPatientPcpName());
			last_inserted_id = UUID.randomUUID().toString().replace(",", "").substring(0, 6);
			pstmt.setString(15, last_inserted_id);
			int id = pstmt.executeUpdate();
			if (id > 0) {
				patient.setPatientUpi(last_inserted_id);
				insertAddress(conn, patient);
				insertFamily(conn, patient);
				insertHealthCareProxy(conn, patient);
				insertSocialHabits(conn, patient);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return last_inserted_id;
	}

	public static int insertAddress(Connection conn, Patient patient) {
		String varname1 = "INSERT INTO address (patient_UPI,address_id,street,city,state,zipcode,country) VALUES (?,?,?,?,?,?,?)";
		int row = -1;
		try {
			PreparedStatement pstmt = conn.prepareStatement(varname1);
			String addressId = UUID.randomUUID().toString().replace(",", "").substring(0, 5);
			pstmt.setString(1, patient.getPatientUpi());
			pstmt.setString(2, addressId);
			pstmt.setString(3, patient.getAddresses().get(0).getStreet());
			pstmt.setString(4, patient.getAddresses().get(0).getCity());
			pstmt.setString(5, patient.getAddresses().get(0).getState());
			pstmt.setString(6, patient.getAddresses().get(0).getZipcode());
			pstmt.setString(7, patient.getAddresses().get(0).getCountry());
			row = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return row;
	}

	public static int insertFamily(Connection conn, Patient patient) {
		String varname1 = "INSERT INTO family_history (patient_UPI,member_name,member_patient_relationship,age,alive,medical_conditions,death_cause, death_age ) VALUES (?,?,?,?,?,?,?,?)";
		int row = -1;
		try {
			PreparedStatement pstmt = conn.prepareStatement(varname1);

			pstmt.setString(1, patient.getPatientUpi());
			pstmt.setString(2, patient.getFamilyHistory().getMemberName());
			pstmt.setString(3, patient.getFamilyHistory().getMemberPatientRelationship());
			pstmt.setInt(4, patient.getFamilyHistory().getAge());
			pstmt.setString(5, Character.toString(patient.getFamilyHistory().getAlive()));
			pstmt.setString(6, patient.getFamilyHistory().getMedicalConditions());
			pstmt.setString(7, patient.getFamilyHistory().getDeathCause());
			pstmt.setInt(8, patient.getFamilyHistory().getDeathAge());

			row = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return row;
	}

	public static int insertHealthCareProxy(Connection conn, Patient patient) {
		String varname1 = "INSERT INTO health_care_proxy (patient_UPI," + "primary_agent_name,"
				+ "primary_phone_number,primary_privileges," + "primary_start_date,primary_end_date,"
				+ "secondary_agent_name,secondary_phone_number," + "secondary_privileges,secondary_start_date,"
				+ "secondary_end_date) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		int row = -1;
		try {
			PreparedStatement pstmt = conn.prepareStatement(varname1);

			pstmt.setString(1, patient.getPatientUpi());
			pstmt.setString(2, patient.getHealthCareProxy().getPrimaryAgentName());
			pstmt.setString(3, patient.getHealthCareProxy().getPrimaryPhoneNumber());
			pstmt.setString(4, patient.getHealthCareProxy().getPrimaryPrivileges());
			pstmt.setDate(5, new java.sql.Date(patient.getHealthCareProxy().getPrimaryStartDate().getTime()));
			pstmt.setDate(6, new java.sql.Date(patient.getHealthCareProxy().getPrimaryEndDate().getTime()));
			pstmt.setString(7, patient.getHealthCareProxy().getSecondaryAgentName());
			pstmt.setString(8, patient.getHealthCareProxy().getSecondaryPhoneNumber());
			pstmt.setString(9, patient.getHealthCareProxy().getSecondaryPrivileges());
			pstmt.setDate(10, new java.sql.Date(patient.getHealthCareProxy().getSecondaryStartDate().getTime()));
			pstmt.setDate(11, new java.sql.Date(patient.getHealthCareProxy().getSecondaryEndDate().getTime()));

			row = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return row;
	}

	public static int insertSocialHabits(Connection conn, Patient patient) {
		String varname1 = "INSERT INTO social_habits (patient_UPI,smoking_habit,"
				+ "smoking_years,alcohol_habit,alcohol_years,recreational_drugs) VALUES (?,?,?,?,?,?)";
		int row = -1;
		try {
			PreparedStatement pstmt = conn.prepareStatement(varname1);

			pstmt.setString(1, patient.getPatientUpi());
			pstmt.setString(2, Character.toString(patient.getSocialHabits().getSmokingHabit()));
			pstmt.setInt(3, patient.getSocialHabits().getSmokingYears());
			pstmt.setString(4, Character.toString(patient.getSocialHabits().getAlcoholHabit()));
			pstmt.setInt(5, patient.getSocialHabits().getAlcoholYears());
			pstmt.setString(6, Character.toString(patient.getSocialHabits().getRecreationalDrugs()));

			row = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return row;
	}
	
	public static int deleteDoctor(Connection conn, int doctorId){
		
		String varName1 = "DELETE FROM patient.doctor WHERE doctor_id=?;";
		int row = -1;
		try {
			PreparedStatement pstmt = conn.prepareStatement(varName1);
			pstmt.setInt(1, doctorId);
			row = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return row;
	}
	
	public static int updateDoctor(Connection conn,Integer doctorId, String doctorUpin, String doctorFname, String doctorLname, String doctorMname, String doctorSpecialization ) {
		int cnt = 0;
		Map<Integer, Object> paramters = new HashMap<Integer, Object>();
		
		String query = "UPDATE patient.doctor d ";
			try {
				PreparedStatement pstmt = null;
				if(doctorUpin != null){
					query += "Set d.doctor_UPIN = ?";
					paramters.put(paramters.size() + 1, doctorUpin);
				}
				
				if(doctorFname != null && doctorFname.length() > 0){
					if(paramters.size() > 0)
						query += " , d.doctor_fname = ?";
					else
						query += "Set d.doctor_fname = ?";
					paramters.put(paramters.size() + 1, doctorFname);
				}
				
				
				if(doctorLname != null && doctorLname.length() > 0){
					if(paramters.size() > 0)
						query += " , d.doctor_lname = ?";
					else
						query += "Set d.doctor_lname = ?";
					paramters.put(paramters.size() + 1, doctorLname);
				}
				
				if(doctorMname != null && doctorMname.length() > 0){
					if(paramters.size() > 0)
						query += " , d.doctor_mname = ?";
					else
						query += "Set d.doctor_mname = ?";
					paramters.put(paramters.size() + 1, doctorMname);
				}
				
				if(doctorSpecialization != null && doctorSpecialization.length() > 0){
					if(paramters.size() > 0)
						query += " , d.doctor_specialization = ?";
					else
						query += "Set d.doctor_specialization = ?";
					paramters.put(paramters.size() + 1, doctorSpecialization);
				}
				
				query += " where doctor_id = ?";
				paramters.put(paramters.size() + 1, doctorId);
				
				System.out.println("updateDoctor "+query);
				pstmt = conn.prepareStatement(query);
				
				if(paramters.size() > 0){
					for (Entry<Integer, Object> entry  : paramters.entrySet()) {
					    System.out.println(entry.getKey() + " - " + entry.getValue());
					    if(entry.getValue() instanceof Integer){
					    	pstmt.setInt(entry.getKey(), (Integer)entry.getValue());
					    }else{
					    	 pstmt.setString(entry.getKey(), (String)entry.getValue());
					    }
					   
					}

				}
				cnt = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		return cnt;

	}
	
	
	public static int updatePatient(Connection conn,String patient_UPI, String maritialStatus, String ecn) {
		int cnt = 0;
		Map<Integer, Object> paramters = new HashMap<Integer, Object>();
		
		String query = "UPDATE patient.patient p ";
			try {
				PreparedStatement pstmt = null;
				if(maritialStatus != null){
					query += "Set p.marital_status = ?";
					paramters.put(paramters.size() + 1, maritialStatus);
				}
				
				if(ecn != null && ecn.length() > 0){
					if(paramters.size() > 0)
						query += " , p.emergency_contact_name = ?";
					else
						query += "Set p.emergency_contact_name = ?";
					paramters.put(paramters.size() + 1, ecn);
				}
				
				query += " where p.patient_UPI = ?";
				paramters.put(paramters.size() + 1, patient_UPI);
				
				System.out.println("updatePatient "+query);
				pstmt = conn.prepareStatement(query);
				
				if(paramters.size() > 0){
					for (Entry<Integer, Object> entry  : paramters.entrySet()) {
					    System.out.println(entry.getKey() + " - " + entry.getValue());
					    if(entry.getValue() instanceof Integer){
					    	pstmt.setInt(entry.getKey(), (Integer)entry.getValue());
					    }else{
					    	 pstmt.setString(entry.getKey(), (String)entry.getValue());
					    }
					   
					}

				}
				cnt = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		return cnt;

	}


	public static void main(String[] args) {
		// Connection con = getConnection();
		getConnection();
	}
}
