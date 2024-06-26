-- 코드를 작성해주세요
WITH A_code_f as (
    SELECT SUM(CODE)
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End'
), A_code_p as(
    SELECT SUM(CODE)
    FROM SKILLCODES
    WHERE NAME = 'Python'
), B_code as (
    SELECT CODE
    FROM SKILLCODES
    WHERE NAME = 'C#'
), C_code as (
    SELECT SUM(CODE)
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End'
)
SELECT 
    CASE 
        WHEN SKILL_CODE & (SELECT * FROM A_code_f) AND SKILL_CODE & (SELECT * FROM A_code_p) THEN 'A'
        WHEN SKILL_CODE & (SELECT * FROM B_code) THEN 'B'
        WHEN SKILL_CODE & (SELECT * FROM C_code) THEN 'C'
    END GRADE
    , ID
    , EMAIL
FROM DEVELOPERS
HAVING GRADE IS NOT NULL
ORDER BY GRADE, ID