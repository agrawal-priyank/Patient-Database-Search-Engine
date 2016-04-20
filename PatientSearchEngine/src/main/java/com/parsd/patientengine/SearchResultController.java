package com.parsd.patientengine;

import java.sql.Connection;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parsd.patientengine.dao.ConnectionDao;
import com.parsd.patientengine.pojo.Patient;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchResultController {

	private static final Logger logger = LoggerFactory.getLogger(SearchResultController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String onSubmitAction(HttpServletRequest request, Model model) {
		ArrayList<Patient> patientList = new ArrayList<Patient>();
		
		System.out.println("***********In Search Result Controller*******");
		try {
			// patientDao.create(patient);
			Connection connection = ConnectionDao.getConnection();

			String param = request.getParameter("identifier");
			if (param.equalsIgnoreCase("patientsearch")) {
				String name = request.getParameter("patientName");
				String split[] = StringUtils.split(name);
				String location = request.getParameter("location");
				String query = "Select * from patient";// where patient_fname=?
														// or patient_lname=?
				ResultSet rs = ConnectionDao.executeQueryString(connection, query, split,location);

				while (rs.next()) {
					// Add other attributes
					Patient patient = new Patient();
					patient.setPatientUpi(rs.getString(1));
					patient.setPatientFname(rs.getString(2));
					patient.setPatientLname(rs.getString(3));
					patient.setPatientDob(new Date(rs.getDate(4).getTime()));
					//patient.setGender(Character.valueOf(rs.getString(5)));
					patientList.add(patient);
				}
				model.addAttribute("patientList", patientList);
			}
			if (param.equalsIgnoreCase("visit")) {
				
			}
			// System.out.println("inserted id "+id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "searchresult";
	}

}
