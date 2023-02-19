SELECT 
ROUND(SUM(item_count::DECIMAL * order_occurrences)/SUM(order_occurrences),1) as mean
FROM items_per_order;