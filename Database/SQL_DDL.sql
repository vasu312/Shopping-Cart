CREATE DATABASE shopping;

CREATE TABLE `orders` (
    `o_id` INT NOT NULL AUTO_INCREMENT,
    `p_id` INT NOT NULL,
    `u_id` INT NOT NULL,
    `o_quantity` INT NOT NULL,
    `o_date` VARCHAR(450) NOT NULL,
    PRIMARY KEY (`o_id`)
);

INSERT INTO `orders` VALUES (25,3,1,3,'2021-05-15'),(26,2,1,1,'2021-05-15');


CREATE TABLE `products` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(450) NOT NULL,
    `category` VARCHAR(450) NOT NULL,
    `price` DOUBLE NOT NULL,
    `image` VARCHAR(450) NOT NULL,
    PRIMARY KEY (`id`)
);
INSERT INTO `products` VALUES (1,'New Arrival Femal Shoes','Female Shoes',120,'female-shoes.jpg'),(2,'Ladies Pure PU Shoulder Bag','Ladis Bag',69.99,'ladis-bag.jpg'),(3,'Stylish Men Office Suits','Men Clothes',169,'men-suits.jpg'),(4,'Jaeger-LeCoultre Men Watch','Men Watch',2500.99,'men-watch.jpg'),(5,'FreeMax e-cigarettes VB-456','E-Cigarattes',310,'smoking-e-cigarette.jpg'),(6,'GeekVapee e-cigarattes MM-632','E-Cigarattes',555.5,'smoking-e-cigarette-2.jpg');

-- Update Products:

UPDATE `shopping`.`products` SET `name` = 'Samsung Crystal 4K', `category` = 'Television', `price` = '30000', `image` = 'https://rukminim2.flixcart.com/image/416/416/xif0q/television/j/l/3/-original-imagtwtewzgfnvjp.jpeg?q=70' WHERE (`id` = '1');
UPDATE `shopping`.`products` SET `name` = 'Apple iPhone 14', `category` = 'Mobile', `price` = '60000', `image` = 'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/3/5/l/-original-imaghx9qmgqsk9s4.jpeg?q=70' WHERE (`id` = '2');
UPDATE `shopping`.`products` SET `name` = 'Fastrack Optimus', `category` = 'Smartwatch', `price` = '25000', `image` = 'https://rukminim2.flixcart.com/image/416/416/xif0q/smartwatch/w/q/r/-original-imaguhx9eaa4fu43.jpeg?q=70' WHERE (`id` = '3');
UPDATE `shopping`.`products` SET `name` = 'Canon DSLR ', `category` = 'Camera', `price` = '32000', `image` = 'https://rukminim2.flixcart.com/image/416/416/jfbfde80/camera/n/r/n/canon-eos-eos-3000d-dslr-original-imaf3t5h9yuyc5zu.jpeg?q=70' WHERE (`id` = '4');
UPDATE `shopping`.`products` SET `name` = 'PROVOGUE Laptop Backpack', `category` = 'Bag', `price` = '2000', `image` = 'https://rukminim2.flixcart.com/image/832/832/kddf6a80/backpack/f/g/g/spacy-unisex-backpack-with-rain-cover-and-reflective-strip-004-original-imafua3eku3uzywy.jpeg?q=70' WHERE (`id` = '5');
UPDATE `shopping`.`products` SET `name` = 'Realme Buds T100', `category` = 'Headsets', `price` = '1500', `image` = 'https://rukminim2.flixcart.com/image/416/416/xif0q/headphone/j/t/c/-original-imaghbdup9jbrdzh.jpeg?q=70' WHERE (`id` = '6');

INSERT INTO `shopping`.`products` (`id`, `name`, `category`, `price`, `image`) VALUES ('7', 'Premium Sports Shoes', 'Shoes', '800', 'https://rukminim2.flixcart.com/image/832/832/xif0q/shoe/n/w/t/6-brd-406-brd-466-6-birde-grey-orange-green-original-imag5ccyzzwrwwfh.jpeg?q=70');
INSERT INTO `shopping`.`products` (`id`, `name`, `category`, `price`, `image`) VALUES ('8', 'The Man Company Night', 'Perfume', '200', 'https://rukminim2.flixcart.com/image/416/416/xif0q/perfume/j/i/y/50-night-long-lasting-perfume-for-men-perfume-the-man-company-original-imagqtg4sffjhwwv.jpeg?q=70');
INSERT INTO `shopping`.`products` (`id`, `name`, `category`, `price`, `image`) VALUES ('9', 'Color Block Hooded Neck Tshirt', 'Tshirt', '500', 'https://rukminim2.flixcart.com/image/832/832/kl175ow0/t-shirt/a/e/h/xl-lho-try-this-original-imagy94cgqndawkp.jpeg?q=70');
INSERT INTO `shopping`.`products` (`id`, `name`, `category`, `price`, `image`) VALUES ('10', 'Duzo steel Swing', 'Furniture', '3000', 'https://rukminim2.flixcart.com/image/416/416/l31x2fk0/hammock-swing/w/p/u/95-0-14-0-cswbbk001-duzo-original-image9n75nsz2ab2.jpeg?q=70');
INSERT INTO `shopping`.`products` (`id`, `name`, `category`, `price`, `image`) VALUES ('11', 'Kadio Analog Wall Clock', 'Clock', '300', 'https://rukminim2.flixcart.com/image/416/416/k44hksw0/wall-clock/s/z/r/6303-6303brown-analog-kadio-original-imafn3cgrcb3f7w5.jpeg?q=70');
INSERT INTO `shopping`.`products` (`id`, `name`, `category`, `price`, `image`) VALUES ('12', 'HP Pendrive', 'Storage', '450', 'https://rukminim2.flixcart.com/image/416/416/xif0q/pendrive/pendrive/j/m/q/v215w-hp-original-imagr9gzn9rrg7ks.jpeg?q=70');




CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(250) NOT NULL,
    `email` VARCHAR(250) NOT NULL,
    `password` VARCHAR(250) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `email_UNIQUE` (`email`)
);

INSERT INTO `users` VALUE(1,"vasu","test@gmail.com","123");
