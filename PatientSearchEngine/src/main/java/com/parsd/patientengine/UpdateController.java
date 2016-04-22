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

	@RequestMapping(value = "/updatePatient**", method = RequestMethod.GET)
	public void onUpdateDoctor(HttpServletRequest request,HttpServletResponse response, Model model) {
		
		String patientId = request.getParameter("patientId");
		String maritalStatus = request.getParameter("maritalStatus");
		String ecn= request.getParameter("ecn");
		
		Connection connection = ConnectionDao.getConnection();
		int cnt = -1;
		if(patientId != null)
			cnt = ConnectionDao.updatePatient(connection, patientId, maritalStatus, ecn);
		
		
	}
}
