-- Триггер, который не позволяет добавить скидку больше 95%

DELIMITER //

create trigger validate_discounts before insert on discounts
for each row
  if new.discount > 95 then
    signal sqlstate '45000'
    set message_text = 'The discount exceeded the allowed value of 95';
  end if;
end//

DELIMITER ;

-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

DELIMITER //

create trigger validate_name_description before insert on products
for each row begin 
  if new.name is null and new.description is null then 
    signal sqlstate '45000'
    set message_text = 'Both name and description are null';
  end if;
end//

