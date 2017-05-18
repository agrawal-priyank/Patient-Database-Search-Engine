package com.parsd.patientengine.dao;

import org.hibernate.HibernateException;

import com.parsd.patientengine.pojo.Patient;

public class PatientDao extends DAO {

    public PatientDao(){
    	
    }
	
	 public void create(Patient patient)
	            throws Exception {
	        try {
	            begin();
	            System.out.println("create");
	            getSession().save(patient);
	            commit();
	        } catch (HibernateException e) {
	            rollback();
	            //throw new AdException("Could not create user " + username, e);
	            throw new Exception("Exception while creating user: " + e.getMessage());
	        }
	    }
}
