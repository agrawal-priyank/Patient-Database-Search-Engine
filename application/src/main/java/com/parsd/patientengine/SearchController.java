package com.parsd.patientengine;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parsd.patientengine.dao.ConnectionDao;

@Controller
public class SearchController {

	@RequestMapping(value = "/doctor", method = RequestMethod.GET)
	public String onSubmitAction(HttpServletRequest request, Model model) {
		try {
				Connection connection = ConnectionDao.getConnection();
				String name = request.getParameter("doctorName");
				String split[] = StringUtils.split(name);
				String speciality = request.getParameter("typeofDoctor");
				model.addAttribute("doctorList", ConnectionDao.getDoctor(connection,split, speciality));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "doctorResut";
	}
	
	@RequestMapping(value = "/bedassigned", method = RequestMethod.GET)
	public String getBedAssignedPatient(HttpServletRequest request, Model model) {
		try {
				Connection connection = ConnectionDao.getConnection();
				String number = request.getParameter("bednumber");
				String roomType = request.getParameter("typeofRoom");
				model.addAttribute("bedList", ConnectionDao.getBedAssigned(connection,(number != null && number.length() > 0 )? Integer.parseInt(number): null, roomType));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "bedassigned";
	}
}
