select *, mortscore+readscore+surveyscore+carescore as TotalScore 
FROM hospitalratings 
ORDER BY TotalScore DESC 
LIMIT 10;
