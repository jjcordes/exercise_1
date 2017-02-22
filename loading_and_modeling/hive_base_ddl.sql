DROP TABLE Hospitals;
CREATE EXTERNAL TABLE Hospitals (
ProviderID INT,
HospitalName STRING,
Address STRING,
City STRING,
State STRING,
ZIP STRING,
CountyName STRING,
PhoneNumber STRING,
HospitalType STRING,
HospitalOwnership STRING,
EmergencyServices STRING,
MeetsCriteria STRING,
OverallRating STRING,
OverallRatingFootnote STRING,
MortNatComp STRING,
MortNatCompFootnote STRING,
SafetyNatComp STRING,
SafetyNatCompFootnote STRING,
ReadmissionNatComp STRING,
ReadmissionNatCompFootnote STRING,
ExperienceNatComp STRING,
ExperienceNatCompFootnote STRING,
EffectNatComp STRING,
EffectNatCompFootnote STRING,
TimelyNatComp STRING,
TimelyNatCompFootnote STRING,
EfficientNatComp STRING,
EfficientNatCompFootnote STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/hospitals_compare/hospitals';

DROP TABLE Effective_Care;
CREATE EXTERNAL TABLE Effective_Care (
ProviderID INT,
HospitalName STRING,
Address STRING,
City STRING,
State STRING,
ZIP STRING,
CountyName STRING,
PhoneNumber STRING,
Condition STRING,
MeasureID STRING,
MeasureName STRING,
Score STRING,
Sample STRING,
Footnote STRING,
MeasureStartDate STRING,
MeasureEndDate STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/hospitals_compare/effective_care';

DROP TABLE Readmissions;
CREATE EXTERNAL TABLE Readmissions (
ProviderID INT,
HospitalName STRING,
Address STRING,
City STRING,
State STRING,
ZIP STRING,
CountyName STRING,
PhoneNumber STRING,
MeasureName STRING,
MeasureID STRING,
ComparedToNational STRING,
Denominator STRING,
Score STRING,
LowerEstimate STRING,
HigherEstimate STRING,
Footnote STRING,
MeasureStartDate STRING,
MeasureEndDate STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/hospitals_compare/readmissions';

DROP TABLE Measures;
CREATE EXTERNAL TABLE Measures (
MeasureName STRING,
MeasureID STRING,
MeasureStartQuarter STRING,
MeasureStartDate STRING,
MeasureEndQuarter STRING,
MeasureEndDate STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/hospitals_compare/measures';

DROP TABLE Survey_Responses;
CREATE EXTERNAL TABLE Survey_Responses (
ProviderID INT,
HospitalName STRING,
Address STRING,
City STRING,
State STRING,
ZIP STRING,
CountyName STRING,
CommNurseFloor STRING,
CommNurseAchThresh STRING,
CommNurseBench STRING,
CommNurseBaseline STRING,
CommNursePerfRate STRING,
CommNursesAch STRING,
CommNursesImp STRING,
CommNursesDim STRING,
CommDocsFloor STRING,
CommDocsAchThresh STRING,
CommDocsBench STRING,
CommDocsBaseline STRING,
CommDocsPerfRate STRING,
CommDocsAch STRING,
CommDocsImp STRING,
CommDocsDim STRING,
RespHospFloor STRING,
RespHospAchThresh STRING,
RespHospBench STRING,
RespHospBaseline STRING,
RespHospPerfRate STRING,
RespHospAch STRING,
RespHospImp STRING,
RespHospDim STRING,
PainMgmtFloor STRING,
PainMgmtAchThresh STRING,
PainMgmtBench STRING,
PainMgmtBaseline STRING,
PainMgmtPerfRate STRING,
PainMgmtAch STRING,
PainMgmtImp STRING,
PainMgmtDim STRING,
CommMedFloor STRING,
CommMedAchThresh STRING,
CommMedBench STRING,
CommMedBaseline STRING,
CommMedPerfRate STRING,
CommMedAch STRING,
CommMedImp STRING,
CommMedDim STRING,
CleanFloor STRING,
CleanAchThresh STRING,
CleanBench STRING,
CleanBaseline STRING,
CleanPerfRate STRING,
CleanHospAch STRING,
CleanHospImp STRING,
CleanHospDim STRING,
DischargeFloor STRING,
DischargeAchThresh STRING,
DischargeBench STRING,
DischargeBaseline STRING,
DischargePerfRate STRING,
DischargeAch STRING,
DischargeImp STRING,
DischargeDim STRING,
OverallFloor STRING,
OverallAchThresh STRING,
OverallBench STRING,
OverallBaseline STRING,
OverallPerfRate STRING,
OverallAch STRING,
OverallImp STRING,
OverallDim STRING,
HCAHPSBaseScore STRING,
HCAHPSConsistencyScore STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/hospitals_compare/survey_responses';

