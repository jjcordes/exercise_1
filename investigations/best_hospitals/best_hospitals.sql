select *, mortscore+readscore+surveyscore+carescore as TotalScore,
sqrt(((mortscore-(mortscore+readscore+surveyscore+carescore)/4)*(mortscore-(mortscore+readscore+surveyscore+carescore)/4)+(readscore-(mortscore+readscore+surveyscore+carescore)/4)*(readscore-(mortscore+readscore+surveyscore+carescore)/4)+(surveyscore-(mortscore+readscore+surveyscore+carescore)/4)*(surveyscore-(mortscore+readscore+surveyscore+carescore)/4)+(carescore-(mortscore+readscore+surveyscore+carescore)/4)*(carescore-(mortscore+readscore+surveyscore+carescore)/4))/4) as standarddeviation
FROM hospitalratings 
WHERE mortscore IS NOT NULL AND readscore IS NOT NULL and surveyscore IS NOT NULL and carescore IS NOT NULL
ORDER BY TotalScore DESC 
LIMIT 10;
