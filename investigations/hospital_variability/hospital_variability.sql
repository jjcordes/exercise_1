SELECT measureid, measurename, avg(score) as average, std(score) as var 
FROM effective_care 
GROUP BY measureid, measurename 
ORDER BY var DESC;
