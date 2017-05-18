
/* Select Query to retreive Patient details*/
SELECT patient.patient_UPI,
    patient.patient_fname,
    patient.patient_lname,
    patient.patient_dob,
    patient.gender,
    patient.disability_status,
    patient.cell_phone,
    patient.emergency_contact_name,
    patient.emergency_contact_number,
    patient.emergency_contact_relationship,
    patient.patient_mname,
    patient.blood_group,
    patient.home_phone,
    patient.marital_status,
    patient.patient_pcp_name
FROM patient.dbo.patient;


/* Insert Query to add Patient details*/
INSERT INTO patient.dbo.patient
					(patient_UPI,
					patient_fname,
					patient_lname,
					patient_dob,
					gender,
					disability_status,
					cell_phone,
					emergency_contact_name,
					emergency_contact_number,
					emergency_contact_relationship,
					patient_mname,
					blood_group,
					home_phone,
					marital_status,
					patient_pcp_name)
			VALUES
					(<{patient_UPI: }>,
					<{patient_fname: }>,
					<{patient_lname: }>,
					<{patient_dob: }>,
					<{gender: }>,
					<{disability_status: }>,
					<{cell_phone: }>,
					<{emergency_contact_name: }>,
					<{emergency_contact_number: }>,
					<{emergency_contact_relationship: }>,
					<{patient_mname: }>,
					<{blood_group: }>,
					<{home_phone: }>,
					<{marital_status: }>,
					<{patient_pcp_name: }>);
					
/* Delete Query to delete Patient details*/
DELETE FROM patient.dbo.patient
				WHERE <{where_expression}>;


/* Update Query to update Patient details*/

UPDATE patient.dbo.patient
							SET
							patient_UPI = <{patient_UPI: }>,
							patient_fname = <{patient_fname: }>,
							patient_lname = <{patient_lname: }>,
							patient_dob = <{patient_dob: }>,
							gender = <{gender: }>,
							disability_status = <{disability_status: }>,
							cell_phone = <{cell_phone: }>,
							emergency_contact_name = <{emergency_contact_name: }>,
							emergency_contact_number = <{emergency_contact_number: }>,
							emergency_contact_relationship = <{emergency_contact_relationship: }>,
							patient_mname = <{patient_mname: }>,
							blood_group = <{blood_group: }>,
							home_phone = <{home_phone: }>,
							marital_status = <{marital_status: }>,
							patient_pcp_name = <{patient_pcp_name: }>
WHERE patient_UPI = <{expr}>;
