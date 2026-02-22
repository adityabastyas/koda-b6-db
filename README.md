# ERD DIAGRAM COFFE SHOP

```mermaid
erDiagram

    USER {
        string user_id PK
        string full_name
        string email
        string password
        datetime created_at
    }

    PRODUCT {
      string product_id PK
      string name
      string decription
      int price
      string image_url
    }

    KATEGORY {
      string category_id PK
      string name
    }

    TESTIMONIAL {
      string testimonial_id PK
      string name
      string position
      string comment
      int rating
    }

    PROMO {
      string promo_id PK
      string title
      string description
      string promo_type
      int discount_value
    }

    CART {
      string cart_id PK
      string user_id PK
    }

    CART_ITEM {
    string cart_item_id PK
    string cart_id FK
    string product_id FK
    int quantity
    }

    PRODUCT_VARIANT{
      string variant_id PK
      string product_id FK
      string size
      string temperature
      int price
    }


```