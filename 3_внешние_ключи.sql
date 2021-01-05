ALTER TABLE discounts
  ADD CONSTRAINT discounts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    on delete set null,
  ADD CONSTRAINT discounts_product_id_fk
    FOREIGN KEY (product_id) REFERENCES products(id)
    on delete set null;


ALTER TABLE finances
  ADD CONSTRAINT finances_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    on delete set null;


ALTER TABLE rubrics
  ADD CONSTRAINT rubrics_catalog_id_fk 
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
    on delete set null;


ALTER TABLE orders
  ADD CONSTRAINT orders_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    on delete set null;

   

ALTER TABLE orders_products
  ADD CONSTRAINT orders_products_order_id_fk 
    FOREIGN KEY (order_id) REFERENCES orders(id)
    on delete set null,
  ADD CONSTRAINT orders_products_product_id_fk 
    FOREIGN KEY (product_id) REFERENCES products(id)
    on delete set null,
  ADD CONSTRAINT orders_products_order_status_id_fk 
    FOREIGN KEY (order_status_id) REFERENCES orders_statuses(id);
   
   

ALTER TABLE products
  ADD CONSTRAINT products_rubric_id_fk 
    FOREIGN KEY (rubric_id) REFERENCES rubrics(id)
    on delete set null,
  ADD CONSTRAINT products_catalog_id_fk 
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
    on delete set null,
  ADD CONSTRAINT products_brand_id_fk 
    FOREIGN KEY (brand_id) REFERENCES brands(id)
    on delete set null,
   ADD CONSTRAINT products_size_id_fk 
    FOREIGN KEY (size_id) REFERENCES sizes(id)
    on delete set null;  
   
   
ALTER TABLE reviews
  ADD CONSTRAINT reviews_to_product_id_fk 
    FOREIGN KEY (to_product_id) REFERENCES products(id)
    on delete set null,
  ADD CONSTRAINT reviews_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id)
    on delete set null;
     
   

ALTER TABLE storehouses
  ADD CONSTRAINT storehouses_adress_id_fk 
    FOREIGN KEY (adress_id) REFERENCES adresses(id)
    on delete set null;

   

ALTER TABLE storehouses_products
  ADD CONSTRAINT storehouses_products_storehouse_id_fk 
    FOREIGN KEY (storehouse_id) REFERENCES storehouses(id)
    on delete set null,
  ADD CONSTRAINT storehouses_products_product_id_fk 
    FOREIGN KEY (product_id) REFERENCES products(id)
    on delete set null;
    


ALTER TABLE waiting_lists
  ADD CONSTRAINT waiting_lists_product_id_fk 
    FOREIGN KEY (product_id) REFERENCES products(id)
    on delete set null,
  ADD CONSTRAINT waiting_lists_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
    on delete set null,
  ADD CONSTRAINT waiting_lists_waiting_status_id_fk 
    FOREIGN KEY (waiting_status_id) REFERENCES waiting_statuses(id)
    on delete set null;
   
      
   