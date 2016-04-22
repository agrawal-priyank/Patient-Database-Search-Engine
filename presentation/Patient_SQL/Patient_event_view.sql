SELECT `patient_event_view`.`Patient_UPI`,
    `patient_event_view`.`Patient Name`,
    `patient_event_view`.`Gender`,
    `patient_event_view`.`Primary Care Physician`,
    `patient_event_view`.`Doctor_Id`,
    `patient_event_view`.`Event_date`,
    `patient_event_view`.`Doctor Name`,
    `patient_event_view`.`Event Description`,
    `patient_event_view`.`Patient Type`
FROM `patient`.`patient_event_view`;
