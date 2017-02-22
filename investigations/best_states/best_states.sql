SELECT state, sum(mortscore) as m, sum(readscore) as r, sum(surveyscore) as s, sum(carescore) as c, avg(mortscore+readscore+surveyscore+carescore) as StateScore 
FROM hospitalratings 
GROUP BY state 
ORDER BY StateScore DESC 
LIMIT 10;
