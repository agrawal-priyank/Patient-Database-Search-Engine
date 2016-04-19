
/*Query to select from Patient event table*/
SELECT patient_event.event_date,
    patient_event.patient_UPI,
    patient_event.doctor_id,
    patient_event.event_desc,
    patient_event.patient_type
FROM patient.dbo.patient_event;


/*Query to Insert information to Patient event table*/
INSERT INTO patient.dbo.patient_event
					(event_date,
					patient_UPI,
					doctor_id,
					event_desc,
					patient_type)
			VALUES
					(<{event_date: }>,
					<{patient_UPI: }>,
					<{doctor_id: }>,
					<{event_desc: }>,
					<{patient_type: }>);

/*Query to update information to Patient event table*/
UPDATE patient.dbo.patient_event
								SET
								event_date = <{event_date: }>,
								patient_UPI = <{patient_UPI: }>,
								doctor_id = <{doctor_id: }>,
								event_desc = <{event_desc: }>,
								patient_type = <{patient_type: }>
WHERE event_date = <{expr}> AND patient_UPI = <{expr}> AND doctor_id = <{expr}>;


/*Query to delete information to Patient event table*/
DELETE FROM patient.dbo.patient_event
				WHERE <{where_expression}>;




