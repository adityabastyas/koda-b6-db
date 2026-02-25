DROP TABLE IF EXISTS "reviews" CASCADE;
DROP TABLE IF EXISTS "transaction_product" CASCADE;
DROP TABLE IF EXISTS "transaction" CASCADE;
DROP TABLE IF EXISTS "cart_item" CASCADE;
DROP TABLE IF EXISTS "cart" CASCADE;
DROP TABLE IF EXISTS "discount" CASCADE;
DROP TABLE IF EXISTS "product_images" CASCADE;
DROP TABLE IF EXISTS "product_size" CASCADE;
DROP TABLE IF EXISTS "product_variant" CASCADE;
DROP TABLE IF EXISTS "products" CASCADE;
DROP TABLE IF EXISTS "promo" CASCADE;
DROP TABLE IF EXISTS "kategory" CASCADE;
DROP TABLE IF EXISTS "users" CASCADE;


CREATE TABLE "users" (
    "user_id" SERIAL PRIMARY KEY,
    "full_name" VARCHAR,
    "email" VARCHAR,
    "password" VARCHAR,
    "address" TEXT,
    "phone" VARCHAR,
    "profile_pic" VARCHAR,
    "created_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "kategory" (
    "kategory_id" SERIAL PRIMARY KEY,
    "name" VARCHAR
);

CREATE TABLE "products" (
    "product_id" SERIAL PRIMARY KEY,
    "kategory_id" INT REFERENCES "kategory"("kategory_id"),
    "name" VARCHAR,
    "description" TEXT,
    "price" INT,
    "image_url" VARCHAR
);

CREATE TABLE "product_variant" (
    "variant_id" SERIAL PRIMARY KEY,
    "product_id" INT REFERENCES "products"("product_id"),
    "temperature" VARCHAR,
    "add_price" INT DEFAULT 0
);

CREATE TABLE "product_size" (
    "product_size_id" SERIAL PRIMARY KEY,
    "product_id" INT REFERENCES "products"("product_id"),
    "name" VARCHAR,
    "add_price" INT DEFAULT 0
);

CREATE TABLE "product_images" (
    "product_images_id" SERIAL PRIMARY KEY,
    "product_id" INT REFERENCES "products"("product_id"),
    "path" VARCHAR
);

CREATE TABLE "discount" (
    "discount_id" SERIAL PRIMARY KEY,
    "product_id" INT REFERENCES "products"("product_id"),
    "flash_sale" BOOLEAN DEFAULT FALSE,
    "description" TEXT,
    "discount_rate" INT
);

CREATE TABLE "promo" (
    "promo_id" SERIAL PRIMARY KEY,
    "title" VARCHAR,
    "description" TEXT,
    "promo_type" VARCHAR,
    "discount_value" INT
);

CREATE TABLE "cart" (
    "cart_id" SERIAL PRIMARY KEY,
    "user_id" INT REFERENCES "users"("user_id")
);

CREATE TABLE "cart_item" (
    "cart_item_id" SERIAL PRIMARY KEY,
    "cart_id" INT REFERENCES "cart"("cart_id"),
    "product_id" INT REFERENCES "products"("product_id"),
    "variant_id" INT REFERENCES "product_variant"("variant_id"),
    "product_size_id" INT REFERENCES "product_size"("product_size_id"),
    "quantity" INT DEFAULT 1
);

CREATE TABLE "transaction" (
    "transaction_id" SERIAL PRIMARY KEY,
    "user_id" INT REFERENCES "users"("user_id"),
    "promo_id" INT REFERENCES "promo"("promo_id"),
    "fullname" VARCHAR,
    "email" VARCHAR,
    "address" TEXT,
    "delivery_type" VARCHAR,
    "subtotal" INT,
    "tax" INT,
    "total" INT,
    "tanggal" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "transaction_product" (
    "transaction_product_id" SERIAL PRIMARY KEY,
    "transaction_id" INT REFERENCES "transaction"("transaction_id"),
    "product_id" INT REFERENCES "products"("product_id"),
    "variant_id" INT REFERENCES "product_variant"("variant_id"),
    "product_size_id" INT REFERENCES "product_size"("product_size_id"),
    "quantity" INT,
    "price_at_purchase" INT
);

CREATE TABLE "reviews" (
    "reviews_id" SERIAL PRIMARY KEY,
    "product_id" INT REFERENCES "products"("product_id"),
    "user_id" INT REFERENCES "users"("user_id"),
    "message" TEXT,
    "rating" INT
);


-----

INSERT INTO "kategory" ("name")VALUES ('Coffee');
INSERT INTO "kategory" ("name")VALUES ('Non Coffe');
INSERT INTO "kategory" ("name")VALUES ('Food');

INSERT INTO "products" ("kategory_id", "name", "description", "price", "image_url")
VALUES
 (1, 'Caramel Latte', 'Kopi susu dengan sirup karamel yang manis', 35000, 'caramel_latte.jpg'),
 (1, 'Espresso', 'Kopi hitam tanpa susu', 25000, 'espresso.jpg'),
 (1, 'Cappuccino', 'Kopi dengan foam susu', 32000, 'cappuccino.jpg'),
 (1, 'Americano', 'Espresso yang dicampur air panas', 28000, 'americano.jpg'),
 (1, 'Vietnamese Coffee', 'Kopi susu kental manis ala vietnam', 33000, 'vietnamese_coffee.jpg'),
 (2, 'Matcha Latte', 'Minuman matcha dengan susu yang creamy', 35000, 'matcha_latte.jpg'),
 (2, 'Taro Latte', 'Minuman talas ungu dengan susu', 35000, 'taro_latte.jpg'),
 (2, 'Chocolate', 'Minuman coklat hangat yang kaya rasa', 30000, 'chocolate.jpg'),
 (3, 'Croissant', 'Roti croissant mentega yang renyah', 25000, 'croissant.jpg'),
 (3, 'Cheesecake', 'Kue keju lembut dengan topping strawberry', 32000, 'cheesecake.jpg');

SELECT "product_id", "kategory_id", "name", "description", "price", "image_url" FROM "products";  
-- SELECT 
--     p.product_id,
--     p.name AS product_name,
--     p.price,
--     k.name AS category_name
-- FROM "products" p
-- JOIN "kategory" k 
--     ON p.kategory_id = k.kategory_id
-- WHERE k.name = 'Coffee';

INSERT INTO "users"
("full_name", "email", "password", "address", "phone", "profile_pic")
VALUES
('adit', 'adit@email.com', '123456', 'Jakarta Selatan', '081234567801', 'adit.jpg'),
('anton', 'anton@email.com', '123456', 'Bandung', '081234567802', 'anton.jpg'),
('wildan', 'wildan@email.com', '123456', 'Surabaya', '081234567803', 'wildan.jpg'),
('aska', 'aska@email.com', '123456', 'Medan', '081234567804', 'aska.jpg'),
('ghifar', 'ghifar@email.com', '123456', 'Depok', '081234567805', 'ghifar.jpg'),
('hilmi', 'hilmi@email.com', '123456', 'Bekasi', '081234567806', 'hilmi.jpg'),
('jaka', 'jaka@email.com', '123456', 'Yogyakarta', '081234567807', 'jaka.jpg'),
('virgil', 'virgil@email.com', '123456', 'Semarang', '081234567808', 'virgil.jpg'),
('hilal', 'hilal@email.com', '123456', 'Malang', '081234567809', 'hilal.jpg'),
('vincent', 'vincent@email.com', '123456', 'Bali', '081234567810', 'vincent.jpg'),
('arif', 'arif@email.com', '123456', 'Makassar', '081234567811', 'arif.jpg'),
('reza', 'reza@email.com', '123456', 'Palembang', '081234567812', 'reza.jpg');

SELECT 
    "user_id",
    "full_name",
    "email",
    "password",
    "address",
    "phone",
    "profile_pic",
    "created_at"
FROM "users";


---PROMO
INSERT INTO "promo" ("title", "description", "promo_type", "discount_value")
VALUES
('Promo Pagi', 'Diskon khusus pembelian pagi hari jam 7-9', 'voucher', 10),
('Happy Hour', 'Diskon spesial jam 3-5 sore', 'voucher', 15),
('Weekend Sale', 'Diskon setiap sabtu dan minggu', 'cashback', 20),
('Member Discount', 'Diskon khusus member setia', 'voucher', 25),
('Buy 1 Get 1', 'Beli 1 gratis 1 untuk semua minuman', 'voucher', 50),
('Flash Sale', 'Diskon dadakan setiap hari jumat', 'cashback', 30),
('Birthday Promo', 'Diskon spesial di hari ulang tahun kamu', 'voucher', 20),
('New Member', 'Diskon untuk member baru', 'cashback', 15),
('Payday Sale', 'Diskon akhir bulan setiap tanggal 25', 'voucher', 10),
('Grand Opening', 'Diskon spesial pembukaan cabang baru', 'cashback', 35);

SELECT "promo_id", "title", "description", "promo_type", "discount_value" FROM "promo";