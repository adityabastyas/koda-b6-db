--mendapakan 1 product  yang sudah di agregasikan dengan variant yang di pilih

-- yg harus di munculkan adalah
-- nama product
-- final price
-- variant
-- size

-- satu product aja duluu

SELECT 
   "products"."name" AS "nama_product", 
   "products"."price" + "product_variant"."add_price" + "product_size"."add_price" AS "final_price",
   "product_variant"."temperature" AS "variant",
   "product_size"."name" AS "size"
FROM "products"
JOIN "product_variant" ON "products"."product_id" = "product_variant"."product_id"
JOIN "product_size" ON "products"."product_id" = "product_size"."product_id"
WHERE "products"."product_id" = 1
AND "product_variant"."variant_id" = 2
AND "product_size"."product_size_id" = 3;

---

--Query untuk menambahkan subtotal dari barang yang dipilih, termasuk yang tadi
-- caranya pakai yang tadi
--expetasi sub total , quantity
--- quantity + subtotal
---  2            ---
--   5            ---
---  7            ---

SELECT 
    "orders"."quantity",
    "products"."price" * "orders"."quantity" AS "sub_total"
FROM (
    SELECT 1 AS "product_id", 2 AS "quantity"
    UNION ALL
    SELECT 2 AS "product_id", 5 AS "quantity"
    UNION ALL
    SELECT 3 AS "product_id", 7 AS "quantity"
) AS "orders"
JOIN "products" ON "products"."product_id" = "orders"."product_id";


-----

---halaman home landing page
-- amati, dan query apa saja yg dibutuhkan

SELECT "product_id", "name", "description", "price", "image_url" FROM "products"
LIMIT 4;

SELECT "users"."full_name", "reviews"."message", "reviews"."rating" FROM "reviews"
JOIN "users" ON "reviews"."user_id" = "users"."user_id";


------

-- halaaman product page
-- ada filter pencarian ,kupon promo, dan ada lainnya
-- apa saja yg di perluakan query di halaman tersebut

SELECT "promo_id", "title", "description", "promo_type", "discount_value" FROM "promo";

SELECT 
  products.product_id,
  products.name,
  products.description,
  products.price,
  products.image_url,
  discount.flash_sale,
  products.price - (products.price * discount.discount_rate / 100) AS price_after_discount,
  AVG(reviews.rating) AS rating
FROM "products"
JOIN discount ON "products".product_id = discount.product_id
JOIN reviews ON "products".product_id = reviews.product_id
GROUP BY "products".product_id, discount.flash_sale, discount.discount_rate