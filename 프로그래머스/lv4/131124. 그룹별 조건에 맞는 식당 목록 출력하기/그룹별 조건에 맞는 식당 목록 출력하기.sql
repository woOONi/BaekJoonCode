# 몰름개오래걸림
# 서브쿼리랑 LIMIT 같이 사용안된다해서 눈물남
# SELECT M.MEMBER_NAME, R.REVIEW_TEXT, DATE_FORMAT(R.REVIEW_DATE, "%Y-%m-%d")
# FROM MEMBER_PROFILE M
# JOIN (SELECT REVIEW_TEXT, REVIEW_DATE, MEMBER_ID
#       FROM REST_REVIEW
#       WHERE MEMBER_ID IN (SELECT MEMBER_ID
#                          FROM REST_REVIEW
#                          GROUP BY MEMBER_ID
#                          ORDER BY COUNT(*) DESC
#                          LIMIT 2)
#      ) R
# ON R.MEMBER_ID = M.MEMBER_ID
# ORDER BY R.REVIEW_DATE, R.REVIEW_TEXT

select p.MEMBER_NAME, r.REVIEW_TEXT, date_format(r.REVIEW_DATE, "%Y-%m-%d")
from (
    select MEMBER_ID, rank() over (order by count(REVIEW_ID) desc) as rnk
    from REST_REVIEW
    group by MEMBER_ID
    # having rnk = 1
) tmp1
left join REST_REVIEW r on tmp1.MEMBER_ID = r.MEMBER_ID
left join MEMBER_PROFILE p on tmp1.MEMBER_ID = p.MEMBER_ID
where rnk = 1
order by REVIEW_DATE, REVIEW_TEXT