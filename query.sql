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
    "cart_item"."quantity",
    "cart_item"."quantity" *
    (
        SELECT
            "products"."price"
            + "product_variant"."add_price"
            + "product_size"."add_price"
        FROM "products"
        JOIN "product_variant"
            ON "products"."product_id" = "product_variant"."product_id"
        JOIN "product_size"
            ON "products"."product_id" = "product_size"."product_id"
        WHERE "products"."product_id" = "cart_item"."product_id"
        AND "product_variant"."variant_id" = "cart_item"."variant_id"
        AND "product_size"."product_size_id" = "cart_item"."product_size_id"
    ) AS "sub_total"
FROM "cart_item";