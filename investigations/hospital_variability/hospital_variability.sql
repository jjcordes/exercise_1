SELECT measureid, measurename, avg(score) as average, std(score) as standdev 
FROM effective_care 
WHERE score IS NOT NULL
GROUP BY measureid, measurename 
ORDER BY var DESC
LIMIT 10;


