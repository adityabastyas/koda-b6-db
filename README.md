# ERD DIAGRAM COFFE SHOP

```mermaid
erDiagram

    USERS {
        int user_id PK
        string full_name
        string email
        string password
        string address
        string phone
        string profile_pic
        datetime created_at
    }

    PRODUCTS {
      int product_id PK
      int kategory_id FK
      string name
      string description
      int price
      string image_url
    }

    KATEGORY {
      int kategory_id PK
      string name
    }


    PROMO {
      int promo_id PK
      string title
      string description
      string promo_type
      int discount_value
    }

    CART {
      int cart_id PK
      int user_id FK
    }

    CART_ITEM {
    int cart_item_id PK
    int cart_id FK
    int product_id FK
    int variant_id FK
    int product_size_id FK
    int quantity
    }

    PRODUCT_VARIANT{
      int variant_id PK
      int product_id FK
      string temperature
      int add_price
    }

    PRODUCT_SIZE{
      int product_size_id PK
      int product_id FK
      string name
      int add_price
    }

    TRANSACTION {
      int transaction_id PK
      int user_id FK
      int promo_id FK
      string fullname
      string email
      string address
      string delivery_type
      int subtotal
      int tax
      int total
      datetime tanggal
    }

    TRANSACTION_PRODUCT {
      int transaction_product_id PK
      int transaction_id FK
      int product_id FK
      int variant_id FK
      int product_size_id FK
      int quantity
      int price_at_purchase
    }

    PRODUCT_IMAGES{
      int product_images_id PK
      int product_id FK
      string path
    }

    REVIEWS{
     int reviews_id PK
     int product_id FK
     int user_id FK
     string message
     int rating
    }

    DISCOUNT{
      int discount_id PK
      int product_id FK
      boolean flash_sale
      string description
      int discount_rate
    }

    USERS ||--|| CART : memiliki
    CART ||--o{ CART_ITEM : berisi
    PRODUCTS ||--o{ CART_ITEM : ditambahkan_ke
    PRODUCT_VARIANT ||--o{ CART_ITEM : dipilih
    PRODUCT_SIZE ||--o{ CART_ITEM : dipilih

    KATEGORY ||--o{ PRODUCTS : mengelompokkan
    PRODUCTS ||--o{ PRODUCT_VARIANT : memiliki
    PRODUCTS ||--o{ PRODUCT_SIZE : memiliki
    PRODUCTS ||--o{ PRODUCT_IMAGES : memiliki
    PRODUCTS ||--o{ REVIEWS : menerima
    PRODUCTS ||--o{ DISCOUNT : memiliki_diskon
    USERS ||--o{ REVIEWS : menulis

    USERS ||--o{ TRANSACTION : melakukan
    TRANSACTION ||--o{ TRANSACTION_PRODUCT : berisi
    PRODUCTS ||--o{ TRANSACTION_PRODUCT : termasuk_dalam
    PRODUCT_VARIANT ||--o{ TRANSACTION_PRODUCT : varian_dipilih
    PRODUCT_SIZE ||--o{ TRANSACTION_PRODUCT : ukuran_dipilih
    PROMO ||--o{ TRANSACTION : diterapkan_di


```