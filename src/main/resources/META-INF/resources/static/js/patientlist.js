var txt = '{"patients":[' +
    '{"ageYears":22,"appVersion":"15 = Beta 0.015","bpDiastolic":99,"bpSystolic":141,' +
    '"dateLastSaved":"2019-08-17T01:29:59.898-07:00[America/Vancouver]",' +
    '"dateRecheckVitalsNeeded":"2019-08-17T01:44:56.583-07:00[America/Vancouver]",' +
    '"dateTimeTaken":"2019-08-17T01:29:16.726-07:00[America/Vancouver]","deviceInfo":"Google, Pixel 3 XL",' +
    '"gestationalAgeUnit":"GESTATIONAL_AGE_UNITS_NONE","gestationalAgeValue":"N/A","heartRateBPM":77,' +
    '"isFlaggedForFollowup":false,"manuallyChangeOcrResults":4,' +
    '"pathToPhoto":"/storage/emulated/0/Pictures/CradleSupportApp/IMG_20190817_012949.jpg",' +
    '"patientId":"1234567890","patientName":"FirstN LastN","readingId":8,"symptoms":["Bleeding"],' +
    '"totalOcrSeconds":0.0,"vhtName":"Brian Fraser","region":"Testing again","ocrEnabled":true,' +
    '"uploadImages":true},' +
    '' +
    '{"ageYears":30,"appVersion":"15 = Beta 0.015","bpDiastolic":100,"bpSystolic":151,' +
    '"dateLastSaved":"2019-08-17T01:29:59.898-07:00[America/Vancouver]",' +
    '"dateRecheckVitalsNeeded":"2019-08-17T01:44:56.583-07:00[America/Vancouver]",' +
    '"dateTimeTaken":"2019-08-17T01:29:16.726-07:00[America/Vancouver]","deviceInfo":"Google, Pixel 3 XL",' +
    '"gestationalAgeUnit":"GESTATIONAL_AGE_UNITS_NONE","gestationalAgeValue":"N/A","heartRateBPM":77,' +
    '"isFlaggedForFollowup":false,"manuallyChangeOcrResults":4,' +
    '"pathToPhoto":"/storage/emulated/0/Pictures/CradleSupportApp/IMG_20190817_012949.jpg",' +
    '"patientId":"1234567877","patientName":"Bob By","readingId":8,"symptoms":["Bleeding"],' +
    '"totalOcrSeconds":0.0,"vhtName":"Brian Fraser","region":"Testing again","ocrEnabled":true,' +
    '"uploadImages":true}]' +
    '}';
patientsObjects = JSON.parse(txt);
patientlist = [];
for (var i = 0; i < patientsObjects.patients.length; i++)
{
    patientlist[i] =
        patientsObjects.patients[i].ageYears + " " + patientsObjects.patients[i].bpDiastolic;
}
document.getElementById("list-of-patients").innerHTML = "test";//patientlist.join('<br>');