package com.parsd.patientengine.pojo;
// Generated Apr 20, 2016 9:22:47 PM by Hibernate Tools 4.3.1



/**
 * PatientSurgeryHistoryId generated by hbm2java
 */
public class PatientSurgeryHistoryId  implements java.io.Serializable {


     private String patientUpi;
     private int surgeryId;

    public PatientSurgeryHistoryId() {
    }

    public PatientSurgeryHistoryId(String patientUpi, int surgeryId) {
       this.patientUpi = patientUpi;
       this.surgeryId = surgeryId;
    }
   
    public String getPatientUpi() {
        return this.patientUpi;
    }
    
    public void setPatientUpi(String patientUpi) {
        this.patientUpi = patientUpi;
    }
    public int getSurgeryId() {
        return this.surgeryId;
    }
    
    public void setSurgeryId(int surgeryId) {
        this.surgeryId = surgeryId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof PatientSurgeryHistoryId) ) return false;
		 PatientSurgeryHistoryId castOther = ( PatientSurgeryHistoryId ) other; 
         
		 return ( (this.getPatientUpi()==castOther.getPatientUpi()) || ( this.getPatientUpi()!=null && castOther.getPatientUpi()!=null && this.getPatientUpi().equals(castOther.getPatientUpi()) ) )
 && (this.getSurgeryId()==castOther.getSurgeryId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getPatientUpi() == null ? 0 : this.getPatientUpi().hashCode() );
         result = 37 * result + this.getSurgeryId();
         return result;
   }   


}

