USE `test2`;
#
#
# CREATE TABLE `type_foods` (
#                               `id` int(11) NOT NULL AUTO_INCREMENT,
#                               `name` varchar(128) DEFAULT NULL,
#                               PRIMARY KEY (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
# CREATE TABLE `customers` (
#                              `id` int(11) NOT NULL AUTO_INCREMENT,
#                              `password` varchar(128) DEFAULT NULL,
#                              `email` varchar(128) DEFAULT NULL,
#                              `name` varchar(128) DEFAULT NULL,
#                              PRIMARY KEY (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
# CREATE TABLE `foods` (
#                          `id` int(11) NOT NULL AUTO_INCREMENT,
#                          `name` varchar(128) DEFAULT NULL,
#                          `image` varchar(128) DEFAULT NULL,
#                          `type_foods_id` int(11) DEFAULT NULL,
#                          PRIMARY KEY (`id`),
#                          KEY `FK2uys48mwjamwspqa5hxhi2bah` (`type_foods_id`),
#                          CONSTRAINT `FK2uys48mwjamwspqa5hxhi2bah` FOREIGN KEY (`type_foods_id`) REFERENCES `type_foods` (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
#
# CREATE TABLE `orders` (
#                           `id` int(11) NOT NULL AUTO_INCREMENT,
#                           `amount` int(11) DEFAULT NULL,
#                           `customres_id` int(11) DEFAULT NULL,
#                           `foods_id` int(11) DEFAULT NULL,
#                           PRIMARY KEY (`id`),
#                           KEY `FKpq0mvdn9ty4v5s4ojjmo7lf6o` (`customres_id`),
#                           KEY `FKrb7kr1ygoqgri3m4r79pr8lr9` (`foods_id`),
#                           CONSTRAINT `FKpq0mvdn9ty4v5s4ojjmo7lf6o` FOREIGN KEY (`customres_id`) REFERENCES `customers` (`id`),
#                           CONSTRAINT `FKrb7kr1ygoqgri3m4r79pr8lr9` FOREIGN KEY (`foods_id`) REFERENCES `foods` (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
# CREATE TABLE `places` (
#                           `id` int(11) NOT NULL AUTO_INCREMENT,
#                           `name` varchar(128) DEFAULT NULL,
#                           `image` varchar(128) DEFAULT NULL,
#                           PRIMARY KEY (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
# CREATE TABLE `place_food` (
#                               `id` int(11) NOT NULL AUTO_INCREMENT,
#                               `food_id` int(11) DEFAULT NULL,
#                               `place_id` int(11) DEFAULT NULL,
#                               PRIMARY KEY (`id`),
#                               KEY `FKafa8tcr2koojqhvami5x1k3qy` (`food_id`),
#                               KEY `FKka3sbd5x5khlxxx3vfal6pgbp` (`place_id`),
#                               CONSTRAINT `FKafa8tcr2koojqhvami5x1k3qy` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
#                               CONSTRAINT `FKka3sbd5x5khlxxx3vfal6pgbp` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#

#
CREATE TABLE `type_foods` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `name` varchar(128) DEFAULT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
CREATE TABLE `foods` (
                         `id` int(11) NOT NULL AUTO_INCREMENT,
                         `descriptions` varchar(128) DEFAULT NULL,
                         `image` varchar(128) DEFAULT NULL,
                         `name` varchar(128) DEFAULT NULL,
                         `price` int(11) DEFAULT NULL,
                         `type_foods_id` int(11) DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         KEY `FK2uys48mwjamwspqa5hxhi2bah` (`type_foods_id`),
                         CONSTRAINT `FK2uys48mwjamwspqa5hxhi2bah` FOREIGN KEY (`type_foods_id`) REFERENCES `type_foods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
#
CREATE TABLE `places` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `image` varchar(128) DEFAULT NULL,
                          `name` varchar(128) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
#
#
CREATE TABLE `place_food` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `food_id` int(11) DEFAULT NULL,
                              `place_id` int(11) DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `FKafa8tcr2koojqhvami5x1k3qy` (`food_id`),
                              KEY `FKka3sbd5x5khlxxx3vfal6pgbp` (`place_id`),
                              CONSTRAINT `FKafa8tcr2koojqhvami5x1k3qy` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
                              CONSTRAINT `FKka3sbd5x5khlxxx3vfal6pgbp` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
CREATE TABLE `cart` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
#
#
CREATE TABLE `cart_food` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `cart_id` int(11) DEFAULT NULL,
                             `food_id` int(11) DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `FKppsia0a9kjylvaq8dr2i76unk` (`cart_id`),
                             KEY `FK7fxiht2v1os74gknlpakvkh1f` (`food_id`),
                             CONSTRAINT `FK7fxiht2v1os74gknlpakvkh1f` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`),
                             CONSTRAINT `FKppsia0a9kjylvaq8dr2i76unk` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
CREATE TABLE `customers` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `email` varchar(128) DEFAULT NULL,
                             `enabled` bit(1) DEFAULT NULL,
                             `name` varchar(128) DEFAULT NULL,
                             `password` varchar(128) DEFAULT NULL,
                             `role` varchar(128) DEFAULT NULL,
                             `cart_id` int(11) DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             KEY `FK1y63n6caw4ic3oofwgammh3b7` (`cart_id`),
                             CONSTRAINT `FK1y63n6caw4ic3oofwgammh3b7` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
#
#
#
#
#
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `date_created` datetime(6) NOT NULL,
                                  `customer_id` int(11) DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `FKs1hhpyc01pwovjdkl4n8bt240` (`customer_id`),
                                  CONSTRAINT `FKs1hhpyc01pwovjdkl4n8bt240` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
#
#
#
CREATE TABLE `ordered_food` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `amount` int(11) DEFAULT NULL,
                                `foods_id` int(11) DEFAULT NULL,
                                `orders_id` int(11) DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `FKqkwggen9hl0knewrhxgfgi8gw` (`foods_id`),
                                KEY `FKh3cy4vvw9fny3tgq1036egvyg` (`orders_id`),
                                CONSTRAINT `FKh3cy4vvw9fny3tgq1036egvyg` FOREIGN KEY (`orders_id`) REFERENCES `customer_order` (`id`),
                                CONSTRAINT `FKqkwggen9hl0knewrhxgfgi8gw` FOREIGN KEY (`foods_id`) REFERENCES `foods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `resets` (
                          `id` bigint(20) NOT NULL AUTO_INCREMENT,
                          `token` varchar(255) DEFAULT NULL,
                          `customer_id` int(11) NOT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FKt7y3iogor7xhy8o1itxtrhdva` (`customer_id`),
                          CONSTRAINT `FKt7y3iogor7xhy8o1itxtrhdva` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;