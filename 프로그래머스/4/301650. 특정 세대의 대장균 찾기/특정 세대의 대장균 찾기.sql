-- 1세대

WITH TblFirst as(
    SELECT id
        FROM ECOLI_DATA
        WHERE PARENT_ID IS NULL
), TblSecond as (
    SELECT A.id
        FROM ECOLI_DATA A
            INNER JOIN TblFirst B
            ON A.PARENT_ID = B.id
)
SELECT A.id
    FROM ECOLI_DATA A
        INNER JOIN TblSecond C
        ON A.PARENT_ID = C.id
    