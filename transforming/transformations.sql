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
CREATE TABLE HospitalRatings AS SELECT hospitalreadmissionscores.providerid, hospitalreadmissionscores.hospitalname, hospitalreadmissionscores.state, (hospitalmortalityscores.totalscore - 0.007073018514666112) / 0.6530018245397134 as MortScore, (hospitalreadmissionscores.totalscore + 0.062408986894112756) / 0.7398543793113476 as ReadScore, (hcahpsbasescore - 20.012207527975583) / 17.886871434892708 as SurveyScore, (newscore + 0.023923444976076555) / 0.2782784619731062 as CareScore FROM hospitalreadmissionscores JOIN hospitalmortalityscores on hospitalreadmissionscores.providerid = hospitalmortalityscores.providerid JOIN survey_responses ON hospitalreadmissionscores.providerid = survey_responses.providerid JOIN hospitaleffectivecarescores ON hospitalreadmissionscores.providerid = hospitaleffectivecarescores.providerid;
	

