/*/*DROP PROCEDURE `patient`.`sp_patient_event_details`;*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_patient_event_details`(IN patient_UPI char(6) , IN patient_type varchar(20))
BEGIN
	select 
		p.patient_UPI As 'Patient_UPI',
        concat(p.patient_fname,' ', p.patient_lname) As 'Patient Name',
        p.gender As 'Gender',
        p.patient_pcp_name As 'Primary Care Physician',
        pe.doctor_id As 'Doctor_Id',
        pe.event_date As 'Event_date',
        concat(d.doctor_fname,' ', d.doctor_lname) As 'Doctor Name',        
        pe.event_desc As 'Event Description',
        pe.patient_type As 'Patient Type'
               from patient p 
				left join patient_event pe 
						on pe.patient_UPI = p.patient_UPI 
				Inner join doctor d on d.doctor_id = pe.doctor_id
	where pe.patient_type = patient_type
		 and p.patient_UPI = patient_UPI;

END$$
DELIMITER ;

/*CALL `patient`.`sp_patient_event_details`(<{IN patient_UPI char(6)}>, <{IN patient_type varchar(20)}>);*/
/*CALL `patient`.`sp_patient_event_details`('089b1a','Out-Patient');*/