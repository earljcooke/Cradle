package com.mercury.TeamMercuryCradlePlatform.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mercury.TeamMercuryCradlePlatform.Strings;

import javax.persistence.*;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * Basic data about a currentReading.
 *
 * For format and processing ideas, see: https://www.hl7.org/fhir/overview-dev.html
 */
@Entity
@Table(name = "reading")
public class Reading {

    /**
     * Constants
     */
    @Transient private static final int DAYS_PER_MONTH = 30;
    @Transient private static final int DAYS_PER_WEEK = 7;
    @Transient public static final int MANUAL_USER_ENTRY_SYSTOLIC = 1;
    @Transient public static final int MANUAL_USER_ENTRY_DIASTOLIC = 2;
    @Transient public static final int MANUAL_USER_ENTRY_HEARTRATE = 4;

    public class WeeksAndDays {
        public final int weeks;
        public final int days;

        public WeeksAndDays(int weeks, int days) {
            this.weeks = weeks;
            this.days = days;
        }
    }

    /**
     * Stored Values
     */
    // db
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "reading_id") public Long readingId;
    public ZonedDateTime dateLastSaved;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "patient_Id", referencedColumnName = "patient_Id")
    private Patient patient;

    public Patient getPatient() {
        return patient;
    }

    public Long getPatientId() {
        return patient.getPatientId();

    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    // patient info
    @Column(name = "first_name") public String firstName;
    @Column(name = "last_name") public String lastName;
    @Column(name = "age_years") public Integer ageYears;
    @Transient public List<String> symptoms = new ArrayList<>();

    @Column(name = "symptoms") public String symptomsString;
    @Column(name = "gestational_age_unit") public GestationalAgeUnit gestationalAgeUnit;
    @Column(name = "gestational_age_value") public String gestationalAgeValue;

    // reading
    @Transient public String pathToPhoto;
    @Column(name = "bp_systolic") public Integer bpSystolic;  // first number (top)
    @Column(name = "by_diastolic") public Integer bpDiastolic; // second number (bottom)
    @Column(name = "hear_rate_bpm") public Integer heartRateBPM;

    @Column(name = "data_time_taken") public ZonedDateTime dateTimeTaken;
    @Transient public String gpsLocationOfReading;
    @Transient public ZonedDateTime dateUploadedToServer;

    // retest & follow-up
    @Transient public List<Long> retestOfPreviousReadingIds;   // oldest first
    @Transient public ZonedDateTime dateRecheckVitalsNeeded;
    @Transient private Boolean isFlaggedForFollowup;

    // referrals
    @Transient public ZonedDateTime referralMessageSendTime;
    @Transient public String referralHealthCentre;
    @Transient public String referralComment;

    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH, CascadeType.MERGE}, mappedBy = "reading")
    private Referral referral;


    // temporary values
    @Transient transient private long temporaryFlags = 0;
    @Transient transient public boolean userHasSelectedNoSymptoms;


    /**
     * Constructors & Factories
     */
    public Reading() {
        // for JSON only
    }

    public Reading(AndroidReading reading) {
        this.firstName = reading.getPatientFirstName();
        this.lastName = reading.getPatientLastName();
        this.ageYears = reading.getAgeYears();
        this.symptomsString = reading.getSymptoms().toString();
        this.gestationalAgeUnit = reading.getGestationalAgeUnit();
        this.gestationalAgeValue = reading.getGestationalAgeValue();
        this.bpSystolic = reading.getBpSystolic();
        this.bpDiastolic = reading.getBpDiastolic();
        this.heartRateBPM = reading.getHeartRateBPM();
        this.dateTimeTaken = reading.getDateTimeTaken();
    }

    public Reading(Reading reading){
        this.firstName = reading.firstName;
        this.lastName = reading.lastName;
        this.ageYears = reading.ageYears;
        this.symptomsString = reading.symptomsString;
        this.gestationalAgeUnit = reading.gestationalAgeUnit;
        this.gestationalAgeValue = reading.gestationalAgeValue;
        this.bpSystolic = reading.bpSystolic;
        this.bpDiastolic = reading.bpDiastolic;
        this.heartRateBPM = reading.heartRateBPM;
        this.dateTimeTaken = reading.dateTimeTaken;
    }

    public Reading(String firstName, String lastName, Integer ageYears, List<String> symptoms, GestationalAgeUnit gestationalAgeUnit, String gestationalAgeValue, Integer bpSystolic, Integer bpDiastolic, Integer heartRateBPM, ZonedDateTime dateTimeTaken) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.ageYears = ageYears;
        this.symptoms = symptoms;
        setSymptomsString(this.symptoms);
        this.gestationalAgeUnit = gestationalAgeUnit;
        this.gestationalAgeValue = gestationalAgeValue;
        this.bpSystolic = bpSystolic;
        this.bpDiastolic = bpDiastolic;
        this.heartRateBPM = heartRateBPM;
        this.dateTimeTaken = dateTimeTaken;
    }

    public Reading(String firstName, String lastName, Integer ageYears, Integer bpSystolic, Integer bpDiastolic, Integer heartRateBPM) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.ageYears = ageYears;
        this.bpSystolic = bpSystolic;
        this.bpDiastolic = bpDiastolic;
        this.heartRateBPM = heartRateBPM;
    }

    public static Reading makeNewReading(ZonedDateTime now) {
        // setup basic info
        Reading r = new Reading();
        r.dateTimeTaken = now;
        return r;
    }

    public static Reading makeToConfirmReading(Reading source, ZonedDateTime now) {
        // copy fields
        Reading r = Reading.makeNewReading(now);
//        r.patientId = source.patientId;
        r.firstName = source.firstName;
        r.lastName = source.lastName;
        r.ageYears = source.ageYears;
        r.symptoms = source.symptoms;
        r.symptoms.addAll(source.symptoms);
        r.gestationalAgeUnit = source.gestationalAgeUnit;
        r.gestationalAgeValue = source.gestationalAgeValue;

        // don't require user to re-check the 'no symptoms' box
        if (r.symptoms.isEmpty()) {
            r.userHasSelectedNoSymptoms = true;
        }

        // record it's a retest
        r.addIdToRetestOfPreviousReadings(source.retestOfPreviousReadingIds, source.readingId);
        return r;
    }


    /**
     * Accessors
     */
    public WeeksAndDays getGestationalAgeInWeeksAndDays() {
        // Handle not set:
        if (gestationalAgeUnit == null || gestationalAgeValue == null
                || gestationalAgeValue.trim().length() == 0)
        {
            return null;
        }

        switch (gestationalAgeUnit) {
            case GESTATIONAL_AGE_UNITS_MONTHS:
                int months = Util.stringToIntOr0(gestationalAgeValue);
                int days = DAYS_PER_MONTH * months;
                return new WeeksAndDays(
                        days / DAYS_PER_WEEK,
                        days % DAYS_PER_WEEK);
            case GESTATIONAL_AGE_UNITS_WEEKS:
                int weeks = Util.stringToIntOr0(gestationalAgeValue);
                return new WeeksAndDays(weeks,0);
            case GESTATIONAL_AGE_UNITS_NONE:
                return null;
            default:
                Util.ensure(false);
                return null;
        }
    }

    public String getGestationWeekDaysString(){
        if(gestationalAgeUnit == GestationalAgeUnit.GESTATIONAL_AGE_UNITS_NONE){
            return Strings.GESTATION_UNIT_NOT_PREGNANT;
        }
        else {
            return getGestationalAgeInWeeksAndDays().weeks + "w " + getGestationalAgeInWeeksAndDays().days + "d";
        }
    }

    public String getTimeYYYYMMDD() {
        return DateTimeFormatter.ofPattern("dd/MM/yyyy - hh:mm").format(dateTimeTaken);
    }


    public String getTimeTakenAmPm(){

        String time = "";
        int hour = dateTimeTaken.getHour();

        if(dateTimeTaken.getHour() > 12){
            hour -= 12;
            time = "PM";

        } else {
            time = "AM";
        }

        int min = dateTimeTaken.getMinute();
        return (hour < 10 ? "0" + hour : hour) + ":" + (min < 10? "0" + min : min) +  " "  + time;

    }


    // referred
    public boolean isReferredToHealthCentre() {
        return referralMessageSendTime != null;
    }
    public void setReferredToHealthCentre(String healthCentre, ZonedDateTime time) {
        referralHealthCentre = healthCentre;
        referralMessageSendTime = time;
    }

    // follow-up
    public boolean isFlaggedForFollowup() {
        return Util.isTrue(isFlaggedForFollowup);
    }
    public void setFlaggedForFollowup(Boolean flaggedForFollowup) {
        isFlaggedForFollowup = flaggedForFollowup;
    }

    // upload
    public boolean isUploaded() {
        return dateUploadedToServer != null;
    }

    // recheck vitals
    public boolean isRetestOfPreviousReading() {
        return retestOfPreviousReadingIds != null && retestOfPreviousReadingIds.size() > 0;
    }
    public void addIdToRetestOfPreviousReadings(List<Long> retestOfPreviousReadingIds, Long readingId) {
        if (this.retestOfPreviousReadingIds == null) {
            this.retestOfPreviousReadingIds = new ArrayList<>();
        }

        // add history
        if (retestOfPreviousReadingIds != null) {
            this.retestOfPreviousReadingIds.addAll(retestOfPreviousReadingIds);
        }

        // dd most recent
        this.retestOfPreviousReadingIds.add(readingId);
    }
    public boolean isNeedRecheckVitals() {
        return dateRecheckVitalsNeeded != null;
    }
    public boolean isNeedRecheckVitalsNow() {
        return isNeedRecheckVitals()
                && dateRecheckVitalsNeeded.isBefore(ZonedDateTime.now());
    }

    @JsonIgnore
    public long getMinutesUntilNeedRecheckVitals() {
        if (!isNeedRecheckVitals()) {
            throw new UnsupportedOperationException("No number of minutes for no recheck");
        }

        if (isNeedRecheckVitalsNow()) {
            return 0;
        } else {
            long seconds = ChronoUnit.SECONDS.between(ZonedDateTime.now(), dateRecheckVitalsNeeded);
            return (seconds + 59) / 60;
        }
    }

    private void setSymptomsString(List<String> symptoms){
        this.symptomsString = String.join(",", symptoms);
    }

    public void addSymptom(String value){
        this.symptoms.add(value);
        setSymptomsString(this.symptoms);
    }


    // check for required data
    public static class ComparatorByDateReverse implements Comparator <Reading>{
        @Override
        public int compare(Reading r1, Reading r2) {
            return r2.dateTimeTaken.compareTo(r1.dateTimeTaken);
        }
    }

    /**
     * Temporary Flags
     */
    public void setATemporaryFlag(long flagMask) {
        temporaryFlags |= flagMask;
    }
    public void clearATemporaryFlag(long flagMask) {
        temporaryFlags &= ~flagMask;
    }
    public boolean isATemporaryFlagSet(long flagMask) {
        return (temporaryFlags & flagMask) != 0;
    }
    public void clearAllTemporaryFlags() {
        temporaryFlags = 0;
    }

//    public Integer getPatientId() {
//        return patientId;
//    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Long getReadingId(){
        return this.readingId;
    }

    public Integer getAgeYears() {
        return ageYears;
    }

    public List<String> getSymptoms() {
        return symptoms;
    }

    public String getGestationalAgeValue() {
        return gestationalAgeValue;
    }

    public Integer getBpSystolic() {
        return bpSystolic;
    }

    public Integer getBpDiastolic() {
        return bpDiastolic;
    }

    public Integer getHeartRateBPM() {
        return heartRateBPM;
    }

    public String getSymptomsString() {
        return this.symptomsString;
    }

    public void setReadingId(Long readingId) {
        this.readingId = readingId;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setAgeYears(Integer ageYears) {
        this.ageYears = ageYears;
    }

    public void setSymptoms(List<String> symptoms) {
        this.symptoms = symptoms;
        setSymptomsString(this.symptoms);
    }

    public void setSymptomsList(String otherSymptoms){
        if(this.symptoms.size() == 0){
            this.addSymptom(Strings.SYMPTOM_NO_SYMPTOMS);
        }
        else{
            if(!otherSymptoms.isEmpty()){
                this.addSymptom(otherSymptoms);
            }
        }
    }

    public void setGestationalAgeUnit(String gestationalAgeUnit) {
        if(gestationalAgeUnit.compareTo(Strings.GESTATION_UNIT_WEEKS) == 0){
            this.gestationalAgeUnit = GestationalAgeUnit.GESTATIONAL_AGE_UNITS_WEEKS;
        }
        else if(gestationalAgeUnit.compareTo(Strings.GESTATION_UNIT_MONTHS) == 0){
            this.gestationalAgeUnit = GestationalAgeUnit.GESTATIONAL_AGE_UNITS_MONTHS;
        }
        else if(gestationalAgeUnit.compareTo(Strings.GESTATION_UNIT_NOT_PREGNANT) == 0){
            this.gestationalAgeUnit = GestationalAgeUnit.GESTATIONAL_AGE_UNITS_NONE;
        }
    }

    public void setGestationalAgeValue(String gestationalAgeValue) {
        this.gestationalAgeValue = gestationalAgeValue;
    }

    public void setBpSystolic(Integer bpSystolic) {
        this.bpSystolic = bpSystolic;
    }

    public void setBpDiastolic(Integer bpDiastolic) {
        this.bpDiastolic = bpDiastolic;
    }

    public void setHeartRateBPM(Integer heartRateBPM) {
        this.heartRateBPM = heartRateBPM;
    }

    public Referral getReferral() {
        return referral;
    }

    public void setReferral(Referral referral) {
        this.referral = referral;
    }

    public ZonedDateTime getDateTimeTaken() {
        return dateTimeTaken;
    }
}
