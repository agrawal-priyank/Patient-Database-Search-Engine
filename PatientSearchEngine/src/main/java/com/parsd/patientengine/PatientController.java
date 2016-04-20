package com.parsd.patientengine;

import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.parsd.patientengine.dao.ConnectionDao;
import com.parsd.patientengine.dao.PatientDao;
import com.parsd.patientengine.pojo.Patient;

@Controller
public class PatientController {

	
	@RequestMapping(value="/addpatient")
	public String addpatient(Model model){
		Patient patient = new Patient();
		model.addAttribute("patient", patient);
		return "addpatient";
	}
	

	@RequestMapping(value="/patientadded")
	public String patientAdded(@ModelAttribute("patient") Patient patient,BindingResult result,Model model){
		Patient p1 = patient;
		//PatientDao patientDao = new PatientDao();
		try {
			//patientDao.create(patient);
			Connection connection = ConnectionDao.getConnection();
			String id = ConnectionDao.insertPatient(connection, patient);
			System.out.println("inserted id "+id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "patientadded";
	}
	
	@InitBinder
	protected void initBinder(ServletRequestDataBinder binder){
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/YYY");
		CustomDateEditor editor = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, editor);
	}
}
