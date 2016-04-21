package com.parsd.patientengine;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parsd.patientengine.dao.ConnectionDao;

@Controller
public class UpdateController {

	@RequestMapping(value = "/updateDoctor", method = RequestMethod.POST)
	public void onUpdateDoctor(HttpServletRequest request,HttpServletResponse response, Model model) {
		
		String doctorId = request.getParameter("doctorId");
		String doctorUpin = request.getParameter("doctorUpin");
		String doctorFname= request.getParameter("doctorFname");
		String doctorLname = request.getParameter("doctorLname");
		String doctorMname= request.getParameter("doctorMname");
		String doctorSpecialization = request.getParameter("doctorSpecialization");
		
		Connection connection = ConnectionDao.getConnection();
		int cnt = -1;
		if(doctorId != null)
			cnt = ConnectionDao.updateDoctor(connection, Integer.parseInt(doctorId), doctorUpin, doctorFname, doctorLname, doctorMname, doctorSpecialization);
		
		
	}
}
