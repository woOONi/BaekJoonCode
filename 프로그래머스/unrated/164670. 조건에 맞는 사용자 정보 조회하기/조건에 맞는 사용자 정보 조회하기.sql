-- 코드를 입력하세요
SELECT
    USER_ID,
    NICKNAME,
    concat(CITY, ' ', STREET_ADDRESS1,' ',STREET_ADDRESS2) AS 전체주소,
    concat(LEFT(TLNO,3),'-',substring(TLNO, 4,4),'-', RIGHT(TLNO,4)) as 전화번호
FROM USED_GOODS_USER as u
left join USED_GOODS_BOARD as b on u.USER_ID = b.WRITER_ID
group by WRITER_ID
having count(BOARD_ID) >= 3
Order by USER_ID DESC