/*DROP PROCEDURE `patient`.`sp_patient_visit_type`;*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_patient_visit_type`(In patient_UPI char(6), In patient_type varchar(20), In event_date DATE)
BEGIN
	select * from patient p 
				left join patient_event pe 
						on pe.patient_UPI = p.patient_UPI 
	where p.patient_UPI = patient_UPI
	and pe.patient_type = patient_type
    and pe.event_date = Date(event_date);
END$$
DELIMITER ;

/* call  `sp_patient_visit_type`('089b1a', 'Out-Patient', '2001-11-12')*/