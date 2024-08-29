with tmp as (
    SELECT FLAVOR, SUM(TOTAL_ORDER) as total
        FROM (
            SELECT FLAVOR, TOTAL_ORDER
                FROM FIRST_HALF
            UNION ALL
            SELECT FLAVOR, TOTAL_ORDER
                FROM JULY
        )
        GROUP BY FLAVOR
        ORDER BY total DESC
)
select FLAVOR
    from tmp
    where rownum<=3