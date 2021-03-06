SELECT state, avg(mortscore) as m, avg(readscore) as r, avg(surveyscore) as s, avg(carescore) as c, avg(mortscore+readscore+surveyscore+carescore) as StateScore, stddev(mortscore+readscore+surveyscore+carescore) / sqrt(count(*)) as Variability
FROM hospitalratings 
WHERE mortscore IS NOT NULL AND readscore IS NOT NULL and surveyscore IS NOT NULL and carescore IS NOT NULL
GROUP BY state 
ORDER BY StateScore DESC 
LIMIT 10;



