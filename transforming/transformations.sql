DROP TABLE HospitalMortalityScores;
CREATE TABLE HospitalMortalityScores AS 
	SELECT providerid, hospitalname, state, sum(Score) AS TotalScore 
	FROM (
	SELECT providerid, hospitalname, state, count(*) as Score 
	FROM readmissions 
	WHERE comparedtonational LIKE 'Better%' and measureid LIKE 'MORT%' 
	GROUP BY providerid, hospitalname, state 
	UNION ALL 
	SELECT providerid, hospitalname, state, 0-count(*) as Score 
	FROM readmissions 
	WHERE comparedtonational LIKE 'Worse%' and measureid LIKE 'MORT%' 
	GROUP BY providerid, hospitalname, state 
	UNION ALL 
	SELECT providerid, hospitalname, state, 0 as Score 
	FROM readmissions 
	WHERE measureid LIKE 'MORT%') a 
	GROUP BY providerid, hospitalname, state 
	ORDER BY TotalScore DESC;

DROP TABLE HospitalReadmissionScores;
CREATE TABLE HospitalReadmissionScores AS 
	SELECT providerid, hospitalname, state, sum(Score) AS TotalScore 
	FROM (
	SELECT providerid, hospitalname, state, count(*) as Score 
	FROM readmissions WHERE comparedtonational LIKE 'Better%' and measureid LIKE 'READ%' 
	GROUP BY providerid, hospitalname, state 
	UNION ALL 
	SELECT providerid, hospitalname, state, 0-count(*) as Score 
	FROM readmissions 
	WHERE comparedtonational LIKE 'Worse%' and measureid LIKE 'READ%' 
	GROUP BY providerid, hospitalname, state 
	UNION ALL 
	SELECT providerid, hospitalname, state, 0 as Score 
	FROM readmissions 
	WHERE measureid LIKE 'READ%') a 
	GROUP BY providerid, hospitalname, state 
	ORDER BY TotalScore DESC;

DROP TABLE HospitalEffectiveCareScores;
CREATE TABLE HospitalEffectiveCareScores AS 
	select providerid, hospitalname, state, effectnatcomp, CASE WHEN effectnatcomp LIKE 'Above%' THEN 1 WHEN effectnatcomp LIKE 'Below%' THEN -1 ELSE 0 END AS newscore 
	from hospitals;

DROP TABLE HospitalRatings;
CREATE TABLE HospitalRatings AS 
	select hospitalreadmissionscores.providerid, hospitalreadmissionscores.hospitalname, hospitalreadmissionscores.state, 
	(hospitalmortalityscores.totalscore - 0.01) / 7.66 as MortScore, 
	(hospitalreadmissionscores.totalscore - 0.06) / 0.74 as ReadScore, 
	(hcahpsbasescore - 49.5) / 7.66 as SurveyScore, 
	(newscore + 0.02) / 0.28 as CareScore 
	FROM hospitalreadmissionscores JOIN hospitalmortalityscores on hospitalreadmissionscores.providerid = hospitalmortalityscores.providerid 
	JOIN survey_responses ON hospitalreadmissionscores.providerid = survey_responses.providerid 
	JOIN hospitaleffectivecarescores ON hospitalreadmissionscores.providerid = hospitaleffectivecarescores.providerid;
	

