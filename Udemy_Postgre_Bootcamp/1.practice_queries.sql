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
