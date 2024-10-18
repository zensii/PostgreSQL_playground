SELECT
    c.contents,
    u.username
FROM users AS u
    JOIN comments as c
        ON c.user_id = u.id
WHERE photo_id = 3;


SELECT
    c.contents,
    p.url
FROM comments AS c
         JOIN photos as p
              ON c.photo_id = p.id;


SELECT
    p.url,
    c.contents,
    u.username
FROM
    photos as p
JOIN
    comments as c
ON c.photo_id = p.id
    JOIN users as u
        ON c.user_id = u.id
WHERE c.user_id = p.user_id;


SELECT
    user_id,
       count(url)
FROM photos
GROUP BY user_id;


SELECT
    photo_id,
    COUNT(*)
FROM comments
--WHERE photo_id = 10
GROUP BY photo_id;


SELECT
    photo_id,
    COUNT(*)
FROM comments
WHERE photo_id < 3
GROUP BY photo_id
HAVING COUNT(*) > 2;


SELECT
    user_id,
    COUNT(*)
FROM comments
WHERE photo_id < 50
GROUP BY user_id;


SELECT
    AVG(comments_per_photo)
FROM
    (SELECT
       COUNT(comments) as comments_per_photo
    FROM
    comments
    GROUP BY photo_id) as comments_per_photo;



SELECT
    user_id,
    max(photo_per_user + comments_per_user) as max_activity
FROM
    (SELECT user_id,
               COUNT(id) AS photo_per_user
        FROM photos
        GROUP BY user_id
        ORDER BY photo_per_user DESC
    ) AS tot_photo
JOIN
     (SELECT user_id,
             COUNT(id) AS comments_per_user
      FROM comments
      GROUP BY user_id
      ORDER BY comments_per_user DESC
     ) AS tot_comments
USING (user_id)
GROUP BY user_id
ORDER BY max_activity DESC;


SELECT
    p.id as photo_id,
    COUNT(*) total_comments
FROM
    photos AS p
JOIN
    comments AS c
ON p.id = c.photo_id
GROUP BY p.id
ORDER BY total_comments DESC;


SELECT
    AVG(LENGTH(contents))
FROM
    comments



SELECT
    u.first_name,
    u.last_name,
    paid
FROM
    users AS u
        JOIN
            orders AS o
                ON u.id = o.user_id


SELECT
    *
FROM
    products
ORDER BY price, weight;


SELECT
    *
FROM products
ORDER BY price DESC
OFFSET 1
LIMIT 2;


(
SELECT
    *
FROM
    products
ORDER BY price DESC
LIMIT 4
    )
UNION ALL
(
SELECT *
 FROM products
 ORDER BY price / weight DESC
 LIMIT 4
 );



 (
    SELECT
        manufacturer
    FROM
        phones
    WHERE price < 170
)
UNION
(
    SELECT
        manufacturer
    FROM
        phones
    GROUP BY manufacturer
    HAVING COUNT(*) > 2
);



SELECT
    name,
    price,
    ROUND(price / (select max(price) from products)::NUMERIC, 3) AS price_ratio
FROM products;


SELECT
    AVG(p.count_of_orders)
FROM (SELECT user_id, COUNT(product_id) AS count_of_orders
      FROM orders
      GROUP BY user_id
      ) AS p;

SELECT
    COUNT(id) / COUNT(DISTINCT user_id) AS order_per_user
FROM orders;


SELECT
    MAX(p.average_paid_per_product)
FROM
(SELECT
    o.user_id,
    ROUND(AVG(p.price),2) AS average_paid_per_product
FROM orders as o
JOIN products as p
ON o.product_id = p.id
GROUP BY o.user_id) AS p
;


SELECT
    users.first_name

FROM users
JOIN
     (SELECT
          user_id
      FROM
          orders
      WHERE
          product_id = 3 ) AS o
ON o.user_id = users.id;


SELECT name
FROM products
WHERE department NOT IN (SELECT department FROM products WHERE price < 100);


SELECT
    name,
    department,
    price
FROM products
WHERE price > ALL (
    SELECT
        price
    FROM products
    WHERE department = 'Industrial'
    );


    SELECT
    name,
    (
        SELECT
            COUNT(*)
        FROM orders as o
        WHERE o.product_id = p1.id
        )
FROM products as p1;



SELECT
    (SELECT MAX(price) FROM products) as max_price,
    (SELECT MIN(price) FROM products) as min_price,
    (SELECT AVG(price) FROM products) as avg_price;


