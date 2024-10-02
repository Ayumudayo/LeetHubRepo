# 가격 변동 있는 id와 그 가격을 구함
SELECT product_id,
    new_price AS price
FROM (
    # change_date 별로 내림차순 정렬
    # 가장 최근의 가격 가져옴
    # ROW_NUMBER()로 번호 매겨서 나중에 WHERE 절에서 1만 가져오게 함
    SELECT product_id, new_price,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS is_changed
    FROM Products
    # 여기서 기준 날짜 기준으로 필터링
    WHERE change_date <= '2019-08-16'
) prices
# 만족하는 행이 없는 것도 필터링 함
# 행 번호가 가장 빠른 걸 가져오는 것이지만,
# 행의 유무도 판단되기에 BOOLEAN 처럼 취급
WHERE is_changed = 1

UNION ALL

# 가격 변경 없는 id를 구함
# 기준 날짜 뒤의 변경 사항을 걸러내는 것
SELECT DISTINCT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (
        SELECT DISTINCT product_id FROM Products WHERE change_date <= '2019-08-16'
    );