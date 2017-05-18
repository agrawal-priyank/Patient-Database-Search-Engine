package com.parsd.patientengine;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.parsd.patientengine.dao.ConnectionDao;

@Controller
public class DeleteController {

	@RequestMapping(value = "/deletedoctor**", method = RequestMethod.POST)
	public void onDeleteDoctor(HttpServletRequest request,HttpServletResponse response, Model model) {
		
		
		String doctorId = request.getParameter("doctorId");
		String doctorUpin = request.getParameter("doctorUpin");
		
		System.out.println("onDeleteDoctor - doctorId : "+doctorId+" doctorUpin : "+doctorUpin);
		
		Connection connection = ConnectionDao.getConnection();
		int row = -1;
		if(doctorId != null)
			row = ConnectionDao.deleteDoctor(connection, Integer.parseInt(doctorId));
		
		try {
			response.getWriter().write(row > 0?"success":"failed");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
