SELECT corr(mortscore, surveyscore) FROM hospitalratings;

SELECT corr(readscore, surveyscore) FROM hospitalratings;

SELECT corr(carescore, surveyscore) FROM hospitalratings;

SELECT corr(cast(score as int), surveyscore) 
FROM effective_care JOIN hospitalratings ON effective_care.providerid = hospitalratings.providerid 
WHERE measureid = 'ED_1b' and score <> 'Not Available';

SELECT corr(cast(score as int), surveyscore) 
FROM effective_care JOIN hospitalratings ON effective_care.providerid = hospitalratings.providerid 
WHERE measureid = 'ED_2b' and score <> 'Not Available';

SELECT corr(cast(score as int), surveyscore) 
FROM effective_care JOIN hospitalratings ON effective_care.providerid = hospitalratings.providerid 
WHERE measureid = 'OP_18b' and score <> 'Not Available';

