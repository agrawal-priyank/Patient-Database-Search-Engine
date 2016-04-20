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
import java.util.Random;
import java.util.UUID;

import com.parsd.patientengine.pojo.Patient;

import java.sql.PreparedStatement;

public class ConnectionDao {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/patient";// mysql://newton.neu.edu:3306/usersdb","student","p@sswOrd"
	static final String USER = "root";
	static final String PASS = "root";
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

	public static ResultSet executeQueryString(Connection conn, String query, String[] params,String location) {
		try {
			PreparedStatement pstmt = null;
			if (params.length == 1) {
				query += " where patient_fname=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, params[0]);
			} else if (params.length == 2) {
				query += " where patient_fname=? and patient_lname=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, params[0]);
				pstmt.setString(2, params[1]);

			} else if (params.length == 0) {
				pstmt = conn.prepareStatement(query);
			}
			return pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

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
		String varname1 = "" + "INSERT INTO patient.patient(patient_fname, " + "					patient_lname, "
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
			last_inserted_id = UUID.randomUUID().toString().replace(",", "").substring(0, 5);
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

	public static void main(String[] args) {
		// Connection con = getConnection();
		getConnection();
	}
}
