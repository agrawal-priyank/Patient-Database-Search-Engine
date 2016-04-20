package com.parsd.patientengine;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
		System.out.println(p1);
		return "patientadded";
	}
}
