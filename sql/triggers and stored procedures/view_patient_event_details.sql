CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patient`.`patient_event_view` AS 
select `p`.`patient_UPI` AS `Patient_UPI`,
concat(`p`.`patient_fname`,' ',`p`.`patient_lname`) AS `Patient Name`,
`p`.`gender` AS `Gender`,
`p`.`patient_pcp_name` AS `Primary Care Physician`,
`pe`.`doctor_id` AS `Doctor_Id`,
`pe`.`event_date` AS `Event_date`,
concat(`d`.`doctor_fname`,' ',`d`.`doctor_lname`) AS `Doctor Name`,
`pe`.`event_desc` AS `Event Description`,
`pe`.`patient_type` AS `Patient Type` from ((`patient`.`patient` `p` 
left join `patient`.`patient_event` `pe` on((`pe`.`patient_UPI` = `p`.`patient_UPI`))) 
join `patient`.`doctor` `d` on((`d`.`doctor_id` = `pe`.`doctor_id`)));
