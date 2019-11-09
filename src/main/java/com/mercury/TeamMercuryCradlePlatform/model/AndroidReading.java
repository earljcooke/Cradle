package com.mercury.TeamMercuryCradlePlatform.model;

import com.mercury.TeamMercuryCradlePlatform.model.Reading;
import com.mercury.TeamMercuryCradlePlatform.model.Util;

import org.threeten.bp.ZonedDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

//Class model for temporary storing datas from the android app
public class AndroidReading {
    private Integer ageYears;
    private String appVersion;
    private Integer bpDiastolic;
    private Integer bpSystolic;
    private ZonedDateTime dateLastSaved;
    private ZonedDateTime dateRecheckVitalsNeeded;
    private ZonedDateTime dateTimeTaken;
    private String deviceInfo;
    private GestationalAgeUnit gestationalAgeUnit;
    private String gestationalAgeValue;
    private Integer heartRateBPM;
    private Boolean isFlaggedForFollowup;
    private int manuallyChangeOcrResults;
    private String pathToPhoto;
    private String patientId;
    private String patientName;
    private Long readingId;
    private List<String> symptoms =  new ArrayList<>();
    private float totalOcrSeconds;
    private String vhtName;
    private String region;
    private Boolean ocrEnabled;
    private Boolean uploadImages;

    public AndroidReading() {

    }

    public Integer getAgeYears() {
        return ageYears;
    }

    public void setAgeYears(Integer ageYears) {
        this.ageYears = ageYears;
    }

    public String getAppVersion() {
        return appVersion;
    }

    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }

    public Integer getBpDiastolic() {
        return bpDiastolic;
    }

    public void setBpDiastolic(Integer bpDiastolic) {
        this.bpDiastolic = bpDiastolic;
    }

    public Integer getBpSystolic() {
        return bpSystolic;
    }

    public void setBpSystolic(Integer bpSystolic) {
        this.bpSystolic = bpSystolic;
    }

    public ZonedDateTime getDateLastSaved() {
        return dateLastSaved;
    }

    public void setDateLastSaved(ZonedDateTime dateLastSaved) {
        this.dateLastSaved = dateLastSaved;
    }

    public ZonedDateTime getDateRecheckVitalsNeeded() {
        return dateRecheckVitalsNeeded;
    }

    public void setDateRecheckVitalsNeeded(ZonedDateTime dateRecheckVitalsNeeded) {
        this.dateRecheckVitalsNeeded = dateRecheckVitalsNeeded;
    }

    public ZonedDateTime getDateTimeTaken() {
        return dateTimeTaken;
    }

    public void setDateTimeTaken(ZonedDateTime dateTimeTaken) {
        this.dateTimeTaken = dateTimeTaken;
    }

    public String getDeviceInfo() {
        return deviceInfo;
    }

    public void setDeviceInfo(String deviceInfo) {
        this.deviceInfo = deviceInfo;
    }

    public GestationalAgeUnit getGestationalAgeUnit() {
        return gestationalAgeUnit;
    }

    public void setGestationalAgeUnit(GestationalAgeUnit gestationalAgeUnit) {
        this.gestationalAgeUnit = gestationalAgeUnit;
    }

    public String getGestationalAgeValue() {
        return gestationalAgeValue;
    }

    public void setGestationalAgeValue(String gestationalAgeValue) {
        this.gestationalAgeValue = gestationalAgeValue;
    }

    public Integer getHeartRateBPM() {
        return heartRateBPM;
    }

    public void setHeartRateBPM(Integer heartRateBPM) {
        this.heartRateBPM = heartRateBPM;
    }

    public Boolean getIsFlaggedForFollowup() {
        return isFlaggedForFollowup;
    }

    public void setIsFlaggedForFollowup(Boolean flaggedForFollowup) {
        isFlaggedForFollowup = flaggedForFollowup;
    }

    public int getManuallyChangeOcrResults() {
        return manuallyChangeOcrResults;
    }

    public void setManuallyChangeOcrResults(int manuallyChangeOcrResults) {
        this.manuallyChangeOcrResults = manuallyChangeOcrResults;
    }

    public String getPathToPhoto() {
        return pathToPhoto;
    }

    public void setPathToPhoto(String pathToPhoto) {
        this.pathToPhoto = pathToPhoto;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public Long getReadingId() {
        return readingId;
    }

    public void setReadingId(Long readingId) {
        this.readingId = readingId;
    }

    public List<String> getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(List<String> symptoms) {
        this.symptoms = symptoms;
    }

    public float getTotalOcrSeconds() {
        return totalOcrSeconds;
    }

    public void setTotalOcrSeconds(float totalOcrSeconds) {
        this.totalOcrSeconds = totalOcrSeconds;
    }

    public String getVhtName() {
        return vhtName;
    }

    public void setVhtName(String vhtName) {
        this.vhtName = vhtName;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public Boolean getOcrEnabled() {
        return ocrEnabled;
    }

    public void setOcrEnabled(Boolean ocrEnabled) {
        this.ocrEnabled = ocrEnabled;
    }

    public Boolean getUploadImages() {
        return uploadImages;
    }

    public void setUploadImages(Boolean uploadImage) {
        this.uploadImages = uploadImage;
    }
}
