/*DROP PROCEDURE sp_patient_bedAssignment;*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_patient_bedAssignment`(In patient_UPI char(6))
BEGIN
Select 
		distinct
		p.patient_UPI,
	    concat(p.patient_fname,' ',p.patient_lname) As 'Patient Name',
        p.gender As 'Gender',
        d.doctor_id As 'Patient ID',
        concat(d.doctor_fname,' ',d.doctor_lname) AS 'Doctor Name' ,
        pe.event_date  As 'Event ID',
        pe.patient_type As 'Patient_Type',
        pbd.ward_type As 'Ward Type',
        pbd.bed_assignment_id As 'Bed Id',
        pbd.date_from As 'Admitted From',
        pbd.date_till As  'Admitted Till'       
			from patient p 
			inner join patient_event pe on pe.patient_UPI  = p.patient_UPI
			inner join doctor d on d.doctor_Id = pe.doctor_id
			left join bed_assignment pbd on pbd.patient_UPI = p.patient_UPI
Where p.patient_UPI = patient_UPI;       

END$$
DELIMITER ;

/*CALL sp_patient_bedAssignment('')*/