package com.parsd.patientengine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parsd.patientengine.dao.ConnectionDao;
import com.parsd.patientengine.pojo.Patient;
import com.parsd.patientengine.pojo.PatientEvent;

@Controller
public class VisitSearchResultController {
	
	private static final Logger logger = LoggerFactory.getLogger(PatientSearchResultController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/visit", method = RequestMethod.GET)
	public String onSubmitAction(HttpServletRequest request, Model model) {
		ArrayList<PatientEvent> eventList = new ArrayList<PatientEvent>();

		System.out.println("***********In Patient Visit Controller*******");
		try {
			
			Connection connection = ConnectionDao.getConnection();

			String param = request.getParameter("identifier");
			if (param.equalsIgnoreCase("visitsearch")) {
				String date = request.getParameter("dateOfVisit");
				String type = request.getParameter("typeofPatient");
				
								
				String query = "select * from patient p left join patient_event pe on pe.patient_UPI = p.patient_UPI"
						+ " inner join doctor d on d.doctor_id = pe.doctor_id ";
				
				ResultSet rs = ConnectionDao.executeVisitQuery(connection, query ,date, type);
								
				while (rs.next()) {
					// Add other attributes
					
					System.out.println("Value "+rs.getString(1));
					PatientEvent event = new PatientEvent();
					
					//event.setId(rs.getString(1));
					event.getPatient().setPatientUpi(rs.getString(1));
					event.getPatient().setPatientFname(rs.getString(2));
					event.getPatient().setPatientLname(rs.getString(3));
					event.getDoctor().setDoctorId((Integer.parseInt(rs.getString(18))));
					event.getDoctor().setDoctorFname(rs.getString(23));
					event.getDoctor().setDoctorLname(rs.getString(24));
					event.setEventDesc(rs.getString(19));
					event.setPatientType(rs.getString(20));
					eventList.add(event);	
										
				}
				model.addAttribute("eventList", eventList);
			}
			if (param.equalsIgnoreCase("visit")) {

			}

			if (param.equalsIgnoreCase("visit")) {
				String name = request.getParameter("");
			}
			// System.out.println("inserted id "+id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "visitresult";
	}


}
