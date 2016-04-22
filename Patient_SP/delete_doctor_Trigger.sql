DROP TRIGGER IF EXISTS delete_doctor; 

Use patient;
DELIMITER $$

CREATE TRIGGER `delete_doctor`
BEFORE DELETE ON `doctor`
FOR EACH ROW
BEGIN
  DELETE FROM bed_assignment  WHERE OLD.doctor_id = doctor_id ;
  DELETE FROM patient_event  WHERE OLD.doctor_id = doctor_id ;  
  DELETE FROM vital_signs  WHERE OLD.doctor_id = doctor_id ;
  DELETE FROM lab_test_history  WHERE OLD.doctor_id = doctor_id ;
  DELETE FROM lab_test_images  WHERE OLD.doctor_id = doctor_id ;  
  DELETE FROM prescription  WHERE OLD.doctor_id = doctor_id ;
  DELETE FROM treatment  WHERE OLD.doctor_id = doctor_id ;
  DELETE FROM patient_surgery_details  WHERE OLD.doctor_id = doctor_id ;
 END $$
 
 Delete from doctor where doctor_id = '116078'