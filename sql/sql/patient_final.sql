/*
Created: 3/30/2016
Modified: 4/18/2016
Model: Microsoft SQL Server 2014
Database: MS SQL Server 2014
*/


-- Create tables section -------------------------------------------------

-- Table patient

CREATE TABLE [patient]
(
 [patient_UPI] Char(6) NOT NULL,
 [patient_fname] Varchar(20) NOT NULL,
 [patient_lname] Varchar(20) NOT NULL,
 [patient_dob] Date NOT NULL,
 [gender] Char(1) NOT NULL,
 [disability_status] Char(1) NOT NULL,
 [cell_phone] Char(10) NOT NULL,
 [emergency_contact_name] Varchar(40) NOT NULL,
 [emergency_contact_number] Char(10) NOT NULL,
 [emergency_contact_relationship] Varchar(20) NOT NULL,
 [patient_mname] Varchar(20) NULL,
 [blood_group] Char(3) NULL,
 [home_phone] Char(10) NULL,
 [marital_status] Varchar(10) NULL,
 [patient_pcp_name] Varchar(40) NULL
)
go

-- Add keys for table patient

ALTER TABLE [patient] ADD CONSTRAINT [Key1] PRIMARY KEY ([patient_UPI])
go

-- Table allergy_lk

CREATE TABLE [allergy_lk]
(
 [allergy_id] Int NOT NULL,
 [allergy_name] Varchar(30) NOT NULL,
 [allergy_type] Varchar(20) NOT NULL
)
go

-- Add keys for table allergy_lk

ALTER TABLE [allergy_lk] ADD CONSTRAINT [Key10] PRIMARY KEY ([allergy_id])
go

-- Table disease_lk

CREATE TABLE [disease_lk]
(
 [disease_ICD_10] Char(7) NOT NULL,
 [disease_desc] Varchar(255) NOT NULL
)
go

-- Add keys for table disease_lk

ALTER TABLE [disease_lk] ADD CONSTRAINT [Key10] PRIMARY KEY ([disease_ICD_10])
go

-- Table family_history

CREATE TABLE [family_history]
(
 [patient_UPI] Char(6) NOT NULL,
 [member_name] Varchar(40) NOT NULL,
 [member_patient_relationship] Varchar(10) NOT NULL,
 [age] Int NOT NULL,
 [alive] Char(1) NOT NULL,
 [medical_conditions] Varchar(50) NOT NULL,
 [death_cause] Varchar(50) NULL,
 [death_age] Int NULL
)
go

-- Add keys for table family_history

ALTER TABLE [family_history] ADD CONSTRAINT [Key6] PRIMARY KEY ([patient_UPI])
go

-- Table immunization_details_lk

CREATE TABLE [immunization_details_lk]
(
 [immunization_id] Int NOT NULL,
 [immunization_name] Varchar(30) NOT NULL,
 [immunization_type] Varchar(20) NOT NULL,
 [suggested_age] Varchar(10) NOT NULL,
 [immunization_agent] Varchar(50) NOT NULL
)
go

-- Add keys for table immunization_details_lk

ALTER TABLE [immunization_details_lk] ADD CONSTRAINT [Key10] PRIMARY KEY ([immunization_id])
go

-- Table surgery

CREATE TABLE [surgery]
(
 [surgery_id] Int NOT NULL,
 [surgery_type] Varchar(30) NOT NULL
)
go

-- Add keys for table surgery

ALTER TABLE [surgery] ADD CONSTRAINT [Key10] PRIMARY KEY ([surgery_id])
go

-- Table emergency_contact

CREATE TABLE [emergency_contact]
(
 [patient_UPI] Char(6) NOT NULL,
 [primary_contact_name] Varchar(40) NOT NULL,
 [primary_patient_relationship] Varchar(10) NOT NULL,
 [primary_phone_number] Char(12) NOT NULL,
 [secondary_contact_name] Varchar(40) NULL,
 [secondary_patient_relationship] Varchar(10) NULL,
 [secondary_phone_number] Char(12) NULL
)
go

-- Add keys for table emergency_contact

ALTER TABLE [emergency_contact] ADD CONSTRAINT [Key18] PRIMARY KEY ([patient_UPI])
go

-- Table health_care_proxy

CREATE TABLE [health_care_proxy]
(
 [patient_UPI] Char(6) NOT NULL,
 [primary_agent_name] Varchar(40) NOT NULL,
 [primary_phone_number] Char(10) NOT NULL,
 [primary_privileges] Varchar(20) NOT NULL,
 [primary_start_date] Date NULL,
 [primary_end_date] Date NULL,
 [secondary_agent_name] Varchar(40) NULL,
 [secondary_phone_number] Char(10) NULL,
 [secondary_privileges] Varchar(20) NULL,
 [secondary_start_date] Date NULL,
 [secondary_end_date] Date NULL
)
go

-- Add keys for table health_care_proxy

ALTER TABLE [health_care_proxy] ADD CONSTRAINT [Key18] PRIMARY KEY ([patient_UPI])
go

-- Table address

CREATE TABLE [address]
(
 [address_id] Char(6) NOT NULL,
 [street] Varchar(20) NOT NULL,
 [city] Varchar(20) NOT NULL,
 [state] Char(2) NOT NULL,
 [zipcode] Char(5) NOT NULL,
 [country] Char(2) NOT NULL,
 [patient_UPI] Char(6) NULL
)
go

-- Create indexes for table address

CREATE INDEX [IX_Rel_pat_address] ON [address] ([patient_UPI])
go

-- Add keys for table address

ALTER TABLE [address] ADD CONSTRAINT [Key19] PRIMARY KEY ([address_id])
go

-- Table social_habits

CREATE TABLE [social_habits]
(
 [patient_UPI] Char(6) NOT NULL,
 [smoking_habit] Char(1) NULL,
 [smoking_years] Int NULL,
 [alcohol_habit] Char(1) NULL,
 [alcohol_years] Int NULL,
 [recreational_drugs] Char(1) NULL
)
go

-- Add keys for table social_habits

ALTER TABLE [social_habits] ADD CONSTRAINT [Key5] PRIMARY KEY ([patient_UPI])
go

-- Table disability_lk

CREATE TABLE [disability_lk]
(
 [disability_id] Int NOT NULL,
 [disability_name] Varchar(30) NOT NULL,
 [disability_type] Varchar(20) NOT NULL
)
go

-- Add keys for table disability_lk

ALTER TABLE [disability_lk] ADD CONSTRAINT [Key10] PRIMARY KEY ([disability_id])
go

-- Table vital_signs

CREATE TABLE [vital_signs]
(
 [patient_UPI] Char(6) NOT NULL,
 [doctor_id] Int NOT NULL,
 [event_date] Date NOT NULL,
 [body_temperaure] Decimal(5,2) NOT NULL,
 [pulse_rate] Decimal(3,0) NOT NULL,
 [respiration_rate] Decimal(3,0) NOT NULL,
 [blood_pressure_diastolic] Decimal(3,0) NOT NULL,
 [blood_pressure_systolic] Decimal(3,0) NOT NULL,
 [weight] Decimal(5,2) NOT NULL
)
go

-- Add keys for table vital_signs

ALTER TABLE [vital_signs] ADD CONSTRAINT [Key9] PRIMARY KEY ([patient_UPI],[doctor_id],[event_date])
go

-- Table doctor

CREATE TABLE [doctor]
(
 [doctor_id] Int NOT NULL,
 [doctor_UPIN] Char(6) NOT NULL,
 [doctor_fname] Varchar(20) NOT NULL,
 [doctor_lname] Varchar(20) NOT NULL,
 [doctor_mname] Varchar(20) NULL,
 [doctor_specialization] Varchar(20) NOT NULL
)
go

-- Add keys for table doctor

ALTER TABLE [doctor] ADD CONSTRAINT [Key12] PRIMARY KEY ([doctor_id])
go

-- Table medication_lk

CREATE TABLE [medication_lk]
(
 [drug_NDC] Int NOT NULL,
 [drug_name] Varchar(30) NOT NULL,
 [drug_form] Varchar(20) NOT NULL,
 [drug_strength] Int NOT NULL
)
go

-- Add keys for table medication_lk

ALTER TABLE [medication_lk] ADD CONSTRAINT [Key10] PRIMARY KEY ([drug_NDC])
go

-- Table prescription

CREATE TABLE [prescription]
(
 [prescription_id] Int NOT NULL,
 [event_date] Date NOT NULL,
 [patient_UPI] Char(6) NOT NULL,
 [doctor_id] Int NOT NULL,
 [drug_NDC] Int NOT NULL,
 [drug_dosage] Varchar(20) NOT NULL,
 [doctor_notes] Varchar(255) NULL
)
go

-- Add keys for table prescription

ALTER TABLE [prescription] ADD CONSTRAINT [Key10] PRIMARY KEY ([prescription_id],[patient_UPI],[doctor_id],[drug_NDC],[event_date])
go

-- Table patient_allergy

CREATE TABLE [patient_allergy]
(
 [allergy_id] Int NOT NULL,
 [patient_UPI] Char(6) NOT NULL,
 [allergy_status] Varchar(10) NOT NULL,
 [allergy_severity] Char(1) NOT NULL,
 [allergy_reaction] Varchar(50) NOT NULL,
 [allergy_identification_date] Date NOT NULL
)
go

-- Add keys for table patient_allergy

ALTER TABLE [patient_allergy] ADD CONSTRAINT [Key20] PRIMARY KEY ([patient_UPI],[allergy_id])
go

-- Table patient_disease_summary

CREATE TABLE [patient_disease_summary]
(
 [patient_UPI] Char(6) NOT NULL,
 [disease_ICD_10] Char(7) NOT NULL,
 [disease_status] Char(1) NOT NULL,
 [observation_date] Datetime NOT NULL,
 [symptoms] Varchar(50) NOT NULL
)
go

-- Add keys for table patient_disease_summary

ALTER TABLE [patient_disease_summary] ADD CONSTRAINT [Key21] PRIMARY KEY ([patient_UPI],[disease_ICD_10])
go

-- Table patient_immunization

CREATE TABLE [patient_immunization]
(
 [patient_UPI] Char(6) NOT NULL,
 [immunization_id] Int NOT NULL,
 [dosage] Varchar(10) NOT NULL,
 [immunization_status] Varchar(10) NOT NULL,
 [date_taken] Date NOT NULL
)
go

-- Add keys for table patient_immunization

ALTER TABLE [patient_immunization] ADD CONSTRAINT [Key22] PRIMARY KEY ([patient_UPI],[immunization_id])
go

-- Table patient_surgery_history

CREATE TABLE [patient_surgery_history]
(
 [surgery_id] Int NOT NULL,
 [patient_UPI] Char(6) NOT NULL,
 [surgery_date] Date NOT NULL,
 [surgery_performedby] Varchar(40) NOT NULL,
 [surgery_type] Varchar(40) NULL,
 [surgery_description] Varchar(255) NULL
)
go

-- Add keys for table patient_surgery_history

ALTER TABLE [patient_surgery_history] ADD CONSTRAINT [Key23] PRIMARY KEY ([patient_UPI],[surgery_id])
go

-- Table patient_disability

CREATE TABLE [patient_disability]
(
 [patient_UPI] Char(6) NOT NULL,
 [disability_id] Int NOT NULL,
 [disability_percentage] Decimal(4,2) NOT NULL
)
go

-- Add keys for table patient_disability

ALTER TABLE [patient_disability] ADD CONSTRAINT [Key24] PRIMARY KEY ([patient_UPI],[disability_id])
go

-- Table patient_event

CREATE TABLE [patient_event]
(
 [event_date] Date NOT NULL,
 [patient_UPI] Char(6) NOT NULL,
 [doctor_id] Int NOT NULL,
 [event_desc] Varchar(255) NOT NULL,
 [patient_type] Varchar(20) DEFAULT Out-patient NOT NULL
)
go

-- Add keys for table patient_event

ALTER TABLE [patient_event] ADD CONSTRAINT [Key27] PRIMARY KEY ([patient_UPI],[doctor_id],[event_date])
go

-- Table bed_assignment

CREATE TABLE [bed_assignment]
(
 [bed_assignment_id] Int NOT NULL,
 [date_from] Date NOT NULL,
 [date_till] Date NOT NULL,
 [ward_type] Varchar(20) NOT NULL,
 [patient_UPI] Char(6) NOT NULL,
 [doctor_id] Int NOT NULL,
 [event_date] Date NOT NULL
)
go

-- Create indexes for table bed_assignment

CREATE INDEX [IX_Rel_pat_bedassigned] ON [bed_assignment] ([patient_UPI],[doctor_id],[event_date])
go

-- Add keys for table bed_assignment

ALTER TABLE [bed_assignment] ADD CONSTRAINT [Key17] PRIMARY KEY ([bed_assignment_id])
go

-- Table ward_details

CREATE TABLE [ward_details]
(
 [ward_id] Char(3) NOT NULL,
 [ward_type] Char(50) NOT NULL
)
go

-- Add keys for table ward_details

ALTER TABLE [ward_details] ADD CONSTRAINT [Key17] PRIMARY KEY ([ward_id])
go

-- Table patient_insurance_history

CREATE TABLE [patient_insurance_history]
(
 [patient_UPI] Char(6) NOT NULL,
 [company_id] Char(6) NOT NULL,
 [insurance_number] Char(6) NOT NULL,
 [effective_date] Date NOT NULL,
 [effective_till] Date NULL
)
go

-- Add keys for table patient_insurance_history

ALTER TABLE [patient_insurance_history] ADD CONSTRAINT [Key23] PRIMARY KEY ([patient_UPI],[company_id])
go

ALTER TABLE [patient_insurance_history] ADD CONSTRAINT [insurance_number] UNIQUE CLUSTERED ([insurance_number])
go

-- Table insurance_lk

CREATE TABLE [insurance_lk]
(
 [company_id] Char(6) NOT NULL,
 [copmany_name] Varchar(40) NOT NULL
)
go

-- Add keys for table insurance_lk

ALTER TABLE [insurance_lk] ADD CONSTRAINT [Key10] PRIMARY KEY ([company_id])
go

-- Table treatment

CREATE TABLE [treatment]
(
 [patient_UPI] Char(6) NOT NULL,
 [doctor_id] Int NOT NULL,
 [event_date] Date NOT NULL,
 [treatment_desc] Varchar(255) NULL,
 [procedure_id] Int NULL
)
go

-- Create indexes for table treatment

CREATE INDEX [IX_Rel_treat_procedure] ON [treatment] ([procedure_id])
go

-- Add keys for table treatment

ALTER TABLE [treatment] ADD CONSTRAINT [Key29] PRIMARY KEY ([patient_UPI],[doctor_id],[event_date])
go

-- Table lab_test_history

CREATE TABLE [lab_test_history]
(
 [patient_UPI] Char(6) NOT NULL,
 [doctor_id] Int NOT NULL,
 [event_date] Date NOT NULL,
 [test_id] Int NOT NULL,
 [time_reported] Datetime NOT NULL,
 [time_collected] Datetime NOT NULL,
 [result] Varchar(20) NOT NULL,
 [status] Varchar(10) NOT NULL
)
go

-- Add keys for table lab_test_history

ALTER TABLE [lab_test_history] ADD CONSTRAINT [Key29] PRIMARY KEY ([patient_UPI],[doctor_id],[event_date],[test_id])
go

-- Table lab_test_lk

CREATE TABLE [lab_test_lk]
(
 [test_id] Int NOT NULL,
 [test_type] Varchar(20) NOT NULL,
 [test_description] Varchar(255) NOT NULL,
 [above_optimal] Int NOT NULL,
 [below_optimal] Int NOT NULL
)
go

-- Add keys for table lab_test_lk

ALTER TABLE [lab_test_lk] ADD CONSTRAINT [Key29] PRIMARY KEY ([test_id])
go

-- Table patient_surgery_details

CREATE TABLE [patient_surgery_details]
(
 [patient_UPI] Char(6) NOT NULL,
 [doctor_id] Int NOT NULL,
 [event_date] Date NOT NULL,
 [surgery_notes] Varchar(255) NULL,
 [surgery_start_time] Datetime NOT NULL,
 [surger_end_time] Datetime NOT NULL,
 [procedure_id] Int NULL
)
go

-- Create indexes for table patient_surgery_details

CREATE INDEX [IX_Rel_surg_procedure] ON [patient_surgery_details] ([procedure_id])
go

-- Add keys for table patient_surgery_details

ALTER TABLE [patient_surgery_details] ADD CONSTRAINT [Key31] PRIMARY KEY ([patient_UPI],[doctor_id],[event_date])
go

-- Table procedure_lk

CREATE TABLE [procedure_lk]
(
 [procedure_id] Int NOT NULL,
 [procedure_desc] Varchar(255) NOT NULL
)
go

-- Add keys for table procedure_lk

ALTER TABLE [procedure_lk] ADD CONSTRAINT [Key29] PRIMARY KEY ([procedure_id])
go

-- Table lab_test_images

CREATE TABLE [lab_test_images]
(
 [patient_UPI] Char(6) NOT NULL,
 [doctor_id] Int NOT NULL,
 [event_date] Date NOT NULL,
 [test_id] Int NOT NULL,
 [test_image] Image NOT NULL
)
go

-- Add keys for table lab_test_images

ALTER TABLE [lab_test_images] ADD CONSTRAINT [Key32] PRIMARY KEY ([patient_UPI],[doctor_id],[event_date],[test_id])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [patient_allergy] ADD CONSTRAINT [allergy_lookup] FOREIGN KEY ([allergy_id]) REFERENCES [allergy_lk] ([allergy_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_allergy] ADD CONSTRAINT [patient_has_allergy] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_disease_summary] ADD CONSTRAINT [patient_has_disease] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [social_habits] ADD CONSTRAINT [patient_has_socialhabits] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [family_history] ADD CONSTRAINT [patient_has_familyhistory] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [emergency_contact] ADD CONSTRAINT [patient_has_emergencycontact] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_immunization] ADD CONSTRAINT [patient_is_immuned] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_immunization] ADD CONSTRAINT [immunize_lookup] FOREIGN KEY ([immunization_id]) REFERENCES [immunization_details_lk] ([immunization_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_surgery_history] ADD CONSTRAINT [patient_undergoes_surgery] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_disability] ADD CONSTRAINT [patient_has_disability] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_disability] ADD CONSTRAINT [disability_lookup] FOREIGN KEY ([disability_id]) REFERENCES [disability_lk] ([disability_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [health_care_proxy] ADD CONSTRAINT [patient_has_healthproxy] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_event] ADD CONSTRAINT [patient_has_event] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_event] ADD CONSTRAINT [doctor_serves_event] FOREIGN KEY ([doctor_id]) REFERENCES [doctor] ([doctor_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [prescription] ADD CONSTRAINT [prescription_has_medication] FOREIGN KEY ([drug_NDC]) REFERENCES [medication_lk] ([drug_NDC]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_disease_summary] ADD CONSTRAINT [disease_lookup] FOREIGN KEY ([disease_ICD_10]) REFERENCES [disease_lk] ([disease_ICD_10]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [vital_signs] ADD CONSTRAINT [patient_has_vitals] FOREIGN KEY ([patient_UPI], [doctor_id], [event_date]) REFERENCES [patient_event] ([patient_UPI], [doctor_id], [event_date]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_insurance_history] ADD CONSTRAINT [patient_has_insurance] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_insurance_history] ADD CONSTRAINT [insurance_lookup] FOREIGN KEY ([company_id]) REFERENCES [insurance_lk] ([company_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [treatment] ADD CONSTRAINT [patient_undergoes_treatment] FOREIGN KEY ([patient_UPI], [doctor_id], [event_date]) REFERENCES [patient_event] ([patient_UPI], [doctor_id], [event_date]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [prescription] ADD CONSTRAINT [patient_given_prescription] FOREIGN KEY ([patient_UPI], [doctor_id], [event_date]) REFERENCES [patient_event] ([patient_UPI], [doctor_id], [event_date]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [bed_assignment] ADD CONSTRAINT [in_patient_has_bedassigned] FOREIGN KEY ([patient_UPI], [doctor_id], [event_date]) REFERENCES [patient_event] ([patient_UPI], [doctor_id], [event_date]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [lab_test_history] ADD CONSTRAINT [patient_gives_labtest] FOREIGN KEY ([patient_UPI], [doctor_id], [event_date]) REFERENCES [patient_event] ([patient_UPI], [doctor_id], [event_date]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [lab_test_history] ADD CONSTRAINT [lab_test_lk] FOREIGN KEY ([test_id]) REFERENCES [lab_test_lk] ([test_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_surgery_details] ADD CONSTRAINT [patient_undergoes_surgery] FOREIGN KEY ([patient_UPI], [doctor_id], [event_date]) REFERENCES [patient_event] ([patient_UPI], [doctor_id], [event_date]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [patient_surgery_details] ADD CONSTRAINT [surgery_follows_procedure_lk] FOREIGN KEY ([procedure_id]) REFERENCES [procedure_lk] ([procedure_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [treatment] ADD CONSTRAINT [treatment_follows_procedures_lk] FOREIGN KEY ([procedure_id]) REFERENCES [procedure_lk] ([procedure_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [address] ADD CONSTRAINT [patient_has_address] FOREIGN KEY ([patient_UPI]) REFERENCES [patient] ([patient_UPI]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [lab_test_images] ADD CONSTRAINT [labtest_has_images] FOREIGN KEY ([patient_UPI], [doctor_id], [event_date], [test_id]) REFERENCES [lab_test_history] ([patient_UPI], [doctor_id], [event_date], [test_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



