SELECT 
   "products"."name" AS "nama_product", 
   "products"."price" + "product_variant"."add_price" + "product_size"."add_price" AS "final_price",
   "product_variant"."temperature" AS "variant",
   "product_size"."name" AS "size"
FROM "products"
JOIN "product_variant" ON "products"."product_id" = "product_variant"."product_id"
JOIN "product_size" ON "products"."product_id" = "product_size"."product_id"
WHERE "products"."product_id" = 1