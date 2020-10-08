
USE `test2`;

INSERT INTO `test2`.`type_foods` (`name`) VALUES ('Pizza');
INSERT INTO `test2`.`type_foods` (`name`) VALUES ('Dessert');
INSERT INTO `test2`.`type_foods` (`name`) VALUES ('Hot Beverage');
INSERT INTO `test2`.`type_foods` (`name`) VALUES ('Cocktail');
INSERT INTO `test2`.`type_foods` (`name`) VALUES ('Belter food');

INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Margherita', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Marinara', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Red kibble', '5');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('White kibble', '5');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Vat grown steak', '5');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Vat grown rice', '5');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES (' Cooperstown Cocktail', '4');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Three Wise Men', '4');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Jungle Juice', '4');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Brass Monkey', '4');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Masala Chai', '3');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES (' Mate cocido', '3');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Herbal tea', '3');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Espresso', '3');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Apple cider', '3');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Sweet roll', '2');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES (' Red velvet cake', '2');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Pumpkin pie', '2');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Lemon meringue pie', '2');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Macaroon', '2');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Mimosa', '2');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Tricolore', '1');

#
INSERT INTO `test2`.`places` (`name`) VALUES ('Italian Pizzeria');
INSERT INTO `test2`.`places` (`name`) VALUES ('That Bar');
INSERT INTO `test2`.`places` (`name`) VALUES ('DoDo Pizza');

INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('1', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('2', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('3', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('4', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('5', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('6', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('7', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('8', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('9', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('10', '1');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('11', '2');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('12', '2');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('13', '2');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('14', '2');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('15', '2');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('16', '2');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('17', '2');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('18', '2');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('19', '2');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('20', '2');


INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Tricolore', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Pepperoni', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Pepperoni Fresh with Tomatoes', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Four seasons', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Mushrooms and ham', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Ham and cheese', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Sweet and Sour Chicken', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Pepperoni Fresh with Tomatoes', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Pepperoni fresh with pepper', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Chorizo', '1');
INSERT INTO `test2`.`foods` (`name`, `type_foods_id`) VALUES ('Dodo pizza', '1');

INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('23', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('24', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('25', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('26', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('27', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('28', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('29', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('30', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('31', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('32', '3');
INSERT INTO `test2`.`place_food` (`food_id`, `place_id`) VALUES ('33', '1');