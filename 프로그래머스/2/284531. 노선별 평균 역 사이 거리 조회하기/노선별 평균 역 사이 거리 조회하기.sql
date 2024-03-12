SELECT ROUTE, 
    CONCAT(ROUND(SUM(D_BETWEEN_DIST),1), 'km') TOTAL_DISTANCE, 
    CONCAT(ROUND(AVG(D_BETWEEN_DIST),2), 'km') AVERAGE_DISTANCE
FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY ROUND(sum(D_BETWEEN_DIST),2) DESC