-- Nota média de avaliação para pedidos entregues no prazo vs. atrasados.
SELECT
  IF(o.order_delivered_customer_date > o.order_estimated_delivery_date, 'atrasado', 'no_prazo') AS entrega,
  COUNT(*)                     AS avaliacoes,
  ROUND(AVG(r.review_score), 2) AS nota_media
FROM `SEU_PROJECT_ID.olist_ecommerce.orders` AS o
JOIN `SEU_PROJECT_ID.olist_ecommerce.order_reviews` AS r USING (order_id)
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY entrega
ORDER BY entrega;
