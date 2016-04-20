package com.parsd.patientengine.pojo;
// Generated Apr 19, 2016 7:35:31 PM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PatientSurgeryHistory generated by hbm2java
 */
@Entity
@Table(name="patient_surgery_history"
    ,catalog="patient"
)
public class PatientSurgeryHistory  implements java.io.Serializable {


     private PatientSurgeryHistoryId id;
     private Patient patient;
     private Date surgeryDate;
     private String surgeryPerformedby;
     private String surgeryType;
     private String surgeryDescription;

    public PatientSurgeryHistory() {
    }

	
    public PatientSurgeryHistory(PatientSurgeryHistoryId id, Patient patient, Date surgeryDate, String surgeryPerformedby) {
        this.id = id;
        this.patient = patient;
        this.surgeryDate = surgeryDate;
        this.surgeryPerformedby = surgeryPerformedby;
    }
    public PatientSurgeryHistory(PatientSurgeryHistoryId id, Patient patient, Date surgeryDate, String surgeryPerformedby, String surgeryType, String surgeryDescription) {
       this.id = id;
       this.patient = patient;
       this.surgeryDate = surgeryDate;
       this.surgeryPerformedby = surgeryPerformedby;
       this.surgeryType = surgeryType;
       this.surgeryDescription = surgeryDescription;
    }
   
     @EmbeddedId

    
    @AttributeOverrides( {
        @AttributeOverride(name="patientUpi", column=@Column(name="patient_UPI", nullable=false, length=6) ), 
        @AttributeOverride(name="surgeryId", column=@Column(name="surgery_id", nullable=false) ) } )
    public PatientSurgeryHistoryId getId() {
        return this.id;
    }
    
    public void setId(PatientSurgeryHistoryId id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="patient_UPI", nullable=false, insertable=false, updatable=false)
    public Patient getPatient() {
        return this.patient;
    }
    
    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="surgery_date", nullable=false, length=10)
    public Date getSurgeryDate() {
        return this.surgeryDate;
    }
    
    public void setSurgeryDate(Date surgeryDate) {
        this.surgeryDate = surgeryDate;
    }

    
    @Column(name="surgery_performedby", nullable=false, length=40)
    public String getSurgeryPerformedby() {
        return this.surgeryPerformedby;
    }
    
    public void setSurgeryPerformedby(String surgeryPerformedby) {
        this.surgeryPerformedby = surgeryPerformedby;
    }

    
    @Column(name="surgery_type", length=40)
    public String getSurgeryType() {
        return this.surgeryType;
    }
    
    public void setSurgeryType(String surgeryType) {
        this.surgeryType = surgeryType;
    }

    
    @Column(name="surgery_description")
    public String getSurgeryDescription() {
        return this.surgeryDescription;
    }
    
    public void setSurgeryDescription(String surgeryDescription) {
        this.surgeryDescription = surgeryDescription;
    }




}

