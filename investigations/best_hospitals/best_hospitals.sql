select *, mortscore+readscore+surveyscore+carescore as TotalScore
FROM hospitalratings 
WHERE mortscore IS NOT NULL AND readscore IS NOT NULL and surveyscore IS NOT NULL and carescore IS NOT NULL
ORDER BY TotalScore DESC 
LIMIT 10;

