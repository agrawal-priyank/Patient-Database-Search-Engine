
/*Query to update doctor details*/
UPDATE patient.dbo.doctor
SET
doctor_id = <{doctor_id: }>,
doctor_UPIN = <{doctor_UPIN: }>,
doctor_fname = <{doctor_fname: }>,
doctor_lname = <{doctor_lname: }>,
doctor_mname = <{doctor_mname: }>,
doctor_specialization = <{doctor_specialization: }>
WHERE doctor_id = <{expr}>;



/*Query to delete doctor details*/
DELETE FROM patient.dbo.doctor
WHERE <{where_expression}>;



/*Query to Insert doctor details*/
INSERT INTO patient.dbo.doctor
(doctor_id,
doctor_UPIN,
doctor_fname,
doctor_lname,
doctor_mname,
doctor_specialization)
VALUES
(<{doctor_id: }>,
<{doctor_UPIN: }>,
<{doctor_fname: }>,
<{doctor_lname: }>,
<{doctor_mname: }>,
<{doctor_specialization: }>);




/*Query to Select doctor details*/
SELECT doctor.doctor_id,
    doctor.doctor_UPIN,
    doctor.doctor_fname,
    doctor.doctor_lname,
    doctor.doctor_mname,
    doctor.doctor_specialization
FROM patient.dbo.doctor;
