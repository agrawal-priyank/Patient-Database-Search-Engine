/*DROP PROCEDURE `sp_patient_personal_details`*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_patient_personal_details`(In patient_UPI char(6))
BEGIN
Select p.patient_UPI AS 'Patient_UPI',
	   concat(p.patient_fname,' ',p.patient_lname) As 'Patient Name',
       p.gender AS 'Gender',
       p.patient_dob 'Date of Birth',
       p.emergency_contact_name AS 'Emergency Contact Name',
       p.emergency_contact_number AS 'Emergency Contact Number',
       p.emergency_contact_relationship AS 'Emergency Contact Relationship',
       ph.primary_agent_name AS 'Primary Agent Name',
       ph.primary_privileges AS 'Primary Agent Privileges',
       pfh.member_name AS 'Family Member Name',
       pfh.member_patient_relationship AS 'Relationship',
       pfh.medical_conditions  As 'Medical Condition',
       psh.smoking_habit As 'Smoking Habit',
       psh.alcohol_habit AS 'Alcohol Habit',
       concat(pa.street,' ',pa.city,' ',pa.state,' ',pa.country) As 'Patient Address'
        from patient p 
			left join health_care_proxy ph on ph.patient_UPI = p.patient_UPI
            left join family_history pfh on pfh.patient_UPI = p.patient_UPI
            left join social_habits psh on psh.patient_UPI = p.patient_UPI
			left join address pa on pa.patient_UPI = p.patient_UPI
where p.patient_UPI = patient_UPI;

END$$
DELIMITER ;

/* CALL sp_patient_personal_details('089b1a'); */