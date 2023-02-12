SELECT pages.page_id
FROM pages
LEFT JOIN page_likes AS likes
ON pages.page_id = likes.page_id
WHERE likes.page_id IS NULL;