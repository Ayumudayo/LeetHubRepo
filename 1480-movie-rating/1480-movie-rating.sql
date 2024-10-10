# 리뷰 수가 많고 사전적으로 빠른 이름을 가진 사용자 찾기
(
    SELECT u.name AS results
    FROM Users u
    JOIN MovieRating mr
        ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
    LIMIT 1
)

UNION ALL

# 20년 2월에 가장 평점이 높은 영화 찾기
(
    SELECT m.title AS results
    FROM Movies m
    JOIN MovieRating mr
        ON m.movie_id = mr.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
)