
select corr(mortscore, surveyscore) as mortcorr, corr(readscore, surveyscore) as readcorr, corr(carescore, surveyscore) as carecorr 
FROM hospitalratings
WHERE mortscore IS NOT NULL and surveyscore IS NOT NULL and readscore IS NOT NULL and carescore IS NOT NULL;

SELECT corr(cast(score as int), surveyscore) 
FROM effective_care JOIN hospitalratings ON effective_care.providerid = hospitalratings.providerid 
WHERE measureid = 'ED_1b' and score <> 'Not Available' and score IS NOT NULL;

SELECT corr(cast(score as int), surveyscore) 
FROM effective_care JOIN hospitalratings ON effective_care.providerid = hospitalratings.providerid 
WHERE measureid = 'ED_2b' and score <> 'Not Available' and score IS NOT NULL;

SELECT corr(cast(score as int), surveyscore) 
FROM effective_care JOIN hospitalratings ON effective_care.providerid = hospitalratings.providerid 
WHERE measureid = 'OP_18b' and score <> 'Not Available' and score IS NOT NULL;


