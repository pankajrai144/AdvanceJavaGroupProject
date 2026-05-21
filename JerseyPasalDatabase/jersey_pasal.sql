-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2026 at 06:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jersey_pasal`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 26, '2026-05-19 05:52:13', '2026-05-19 05:52:13');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `selected_size` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `cart_id`, `product_id`, `selected_size`, `quantity`, `added_at`) VALUES
(15, 4, 45, 'L', 3, '2026-05-19 06:38:45'),
(16, 4, 32, 'M', 9, '2026-05-19 06:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `contact_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(80) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`contact_id`, `user_id`, `subject`, `message`, `submitted_at`) VALUES
(2, 26, 'return', 'How can I exchange my jersey?', '2026-05-19 06:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_total` decimal(10,2) NOT NULL,
  `order_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_total`, `order_status`, `order_date`) VALUES
(16, 26, 169.00, 'Pending', '2026-05-19 05:43:06'),
(17, 26, 1644.00, 'Delivered', '2026-05-19 05:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `selected_size` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_each` decimal(10,2) NOT NULL,
  `item_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `selected_size`, `quantity`, `price_each`, `item_total`) VALUES
(21, 16, 45, 'L', 1, 169.00, 169.00),
(22, 17, 26, 'S', 10, 150.00, 1500.00),
(23, 17, 43, 'L', 1, 144.00, 144.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `card_holder_name` varchar(100) DEFAULT NULL,
  `card_last_four` varchar(4) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` varchar(30) NOT NULL DEFAULT 'Paid',
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `user_id`, `full_name`, `email`, `phone`, `address`, `payment_method`, `card_holder_name`, `card_last_four`, `amount`, `payment_status`, `payment_date`) VALUES
(15, 16, 26, 'Pankaj Rai', 'pankaj@gmail.com', '9843411719', 'Okhaldhunga', 'Cash on Delivery', '', '', 169.00, 'Pending', '2026-05-19 05:43:06'),
(16, 17, 26, 'Pankaj Rai', 'pankaj@gmail.com', '9843411719', 'Okhaldhunga', 'Cash on Delivery', '', '', 1644.00, 'Pending', '2026-05-19 05:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `jersey_name` varchar(100) NOT NULL,
  `team_name` varchar(100) NOT NULL,
  `size` varchar(20) NOT NULL,
  `season` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `category` enum('Club','Nation') NOT NULL,
  `description` text DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_image_2` varchar(255) DEFAULT NULL,
  `product_image_3` varchar(255) DEFAULT NULL,
  `product_image_4` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `jersey_name`, `team_name`, `size`, `season`, `price`, `stock_quantity`, `category`, `description`, `product_image`, `created_at`, `product_image_2`, `product_image_3`, `product_image_4`) VALUES
(21, 'Marcelo', 'Real Madrid CF', 'S,M,XL', '2017/18', 125.00, 45, 'Club', 'High-quality Real Madrid home jersey inspired by Marcelo’s iconic look. Features classic white design with club crest and sponsor logo. Comfortable, breathable fabric suitable for casual wear or sports. Perfect for fans and collectors.', 'product_main_1779094067553.jpg', '2026-05-18 08:47:47', 'product_second_1779094067559.jpg', 'product_third_1779094067560.jpg', 'product_fourth_1779094067560.jpg'),
(22, 'Harry Maguire', 'England', 'M,L,XL', '2022/23', 145.00, 25, 'Nation', 'Official-style England home jersey worn by Harry Maguire. Features a clean white base with blue gradient shoulders and the England crest. Made with breathable, high-quality fabric for comfort and performance. Ideal for fans supporting their national team.', 'product_main_1779094570373.jpg', '2026-05-18 08:56:10', 'product_second_1779094570373.jpg', 'product_third_1779094570373.jpg', 'product_fourth_1779094570373.jpg'),
(23, 'Noni Madueke', 'England', 'XS,S,XL', '2022/23', 150.00, 20, 'Nation', 'England national team home jersey inspired by Noni Madueke. Features the classic white design with blue detailing, offering comfort and premium football style for supporters and collectors.', 'product_main_1779094839632.jpg', '2026-05-18 09:00:39', 'product_second_1779094839632.jpg', 'product_third_1779094839632.jpg', 'product_fourth_1779094839632.jpg'),
(24, 'Paolo Maldini', 'AC Milan', 'XS,XL,XXL', '2009/10', 130.00, 20, 'Club', 'Classic red and black striped AC Milan home jersey worn by Paolo Maldini. Features Adidas design with Bwin sponsor and retro football styling.', 'product_main_1779095130431.jpg', '2026-05-18 09:05:30', 'product_second_1779095130431.jpg', 'product_third_1779095130431.jpg', 'product_fourth_1779095130431.jpg'),
(25, 'Kylian Mbappe', 'Real Madrid', 'XS,M,L', '2024/25', 120.00, 25, 'Club', 'Modern white Real Madrid home jersey worn by Kylian Mbappé featuring Adidas design, HP sleeve sponsor, and classic Madrid styling. Popular among football fans and collectors.', 'product_main_1779095222963.jpg', '2026-05-18 09:07:03', 'product_second_1779095222963.jpg', 'product_third_1779095222963.jpg', 'product_fourth_1779095222963.jpg'),
(26, 'Lionel Messi', 'Argentina', 'XS,S', '2022/23', 150.00, 20, 'Nation', 'Argentina national team home jersey worn by Lionel Messi featuring the iconic sky blue and white striped design with number 10. Celebrated after Argentina’s World Cup winning era and highly popular among fans.', 'product_main_1779095299069.jpg', '2026-05-18 09:08:19', 'product_second_1779095299069.jpg', 'product_third_1779095299069.jpg', 'product_fourth_1779095299069.jpg'),
(27, 'Luka Modric', 'Real Madrid', 'XS,S,M', '2024/25', 140.00, 30, 'Club', 'Classic white Real Madrid home jersey worn by Luka Modrić featuring Adidas styling, Fly Better sponsor, and captain armband design. A popular jersey among Madrid and Croatia fans.', 'product_main_1779095446684.jpg', '2026-05-18 09:10:46', 'product_second_1779095446684.jpg', 'product_third_1779095446684.jpg', 'product_fourth_1779095446684.jpg'),
(28, 'Jamal Musiala', 'Germany', 'S,M,L', '2024/25', 136.00, 33, 'Nation', 'Germany national team home jersey worn by Jamal Musiala featuring the modern Adidas design with multicolor shoulder stripes and number 10. A stylish and popular international football jersey.', 'product_main_1779095531556.jpg', '2026-05-18 09:12:11', 'product_second_1779095531556.jpg', 'product_third_1779095531556.jpg', 'product_fourth_1779095531556.jpg'),
(29, 'Neymar Jr', 'Brazil', 'S,M', '2022/23', 155.00, 30, 'Nation', 'Brazil national team home jersey worn by Neymar Jr featuring the iconic yellow and green design with number 10. One of the most popular international football jerseys among fans worldwide.', 'product_main_1779095607296.jpg', '2026-05-18 09:13:27', 'product_second_1779095607296.jpg', 'product_third_1779095607296.jpg', 'product_fourth_1779095607296.jpg'),
(30, 'Mesut Ozil', 'Real Madrid', 'S,M,XXL', '2011/12', 137.00, 25, 'Club', 'Classic Real Madrid home jersey worn by Mesut Özil featuring the iconic white Adidas design with Bwin sponsor. A popular retro football jersey from Madrid’s early 2010s era.', 'product_main_1779095761695.jpg', '2026-05-18 09:16:01', 'product_second_1779095761695.jpg', 'product_third_1779095761695.jpg', 'product_fourth_1779095761695.jpg'),
(31, 'Pedri', 'Spain', 'XS,M,L', '2024/25', 148.00, 34, 'Nation', 'Spain national team home jersey worn by Pedri featuring the classic red Adidas design with gold detailing and modern Spain crest. A popular international football jersey among Spain and Barcelona fans.', 'product_main_1779095833147.jpg', '2026-05-18 09:17:13', 'product_second_1779095833147.jpg', 'product_third_1779095833147.jpg', 'product_fourth_1779095833147.jpg'),
(32, 'Ronaldinho', 'FC Barcelona', 'S,M,L', '2005/06', 145.00, 28, 'Club', 'Iconic FC Barcelona home jersey worn by Ronaldinho featuring the classic blue and red striped Nike design. One of the most legendary retro football jerseys from Barcelona’s golden era.', 'product_main_1779095947596.jpg', '2026-05-18 09:19:07', 'product_second_1779095947596.jpg', 'product_third_1779095947596.jpg', 'product_fourth_1779095947596.jpg'),
(33, 'Cristiano Ronaldo', 'Portugal', 'S,L,XL,XXL', '2022/23', 150.00, 50, 'Nation', 'Portugal national team home jersey worn by Cristiano Ronaldo featuring the iconic red and green Nike design with captain armband and number 7. One of the most popular football jerseys worldwide.', 'product_main_1779096046704.jpg', '2026-05-18 09:20:46', 'product_second_1779096046704.jpg', 'product_third_1779096046704.jpg', 'product_fourth_1779096046704.jpg'),
(34, 'Wayne Rooney', 'Manchester United', 'S,L,XXL', '2007/08', 100.00, 24, 'Club', 'Classic Manchester United home jersey worn by Wayne Rooney featuring the iconic red Nike design with AIG sponsor. A legendary retro football jersey from United’s dominant era under Sir Alex Ferguson.', 'product_main_1779096148620.jpg', '2026-05-18 09:22:28', 'product_second_1779096148620.jpg', 'product_third_1779096148620.jpg', 'product_fourth_1779096148620.jpg'),
(35, 'Kobbie Mainoo', 'Manchester United', 'XS,S,XXL', '2024/25', 120.00, 40, 'Club', 'Modern Manchester United home jersey worn by Kobbie Mainoo featuring the classic red Adidas design with Snapdragon sponsor and black striped detailing. Popular among young football fans and United supporters.', 'product_main_1779096236400.jpg', '2026-05-18 09:23:56', 'product_second_1779096236400.jpg', 'product_third_1779096236400.jpg', 'product_fourth_1779096236400.jpg'),
(36, 'Yildiz', 'Turkey', 'XS,M,L', '2024/25', 130.00, 46, 'Nation', 'Turkey national team home jersey worn by Yildiz featuring the clean white Nike design with red chest stripe and number 19. A stylish and fast-rising fan favorite among young football supporters.', 'product_main_1779096308704.jpg', '2026-05-18 09:25:08', 'product_second_1779096308704.jpg', 'product_third_1779096308704.jpg', 'product_fourth_1779096308704.jpg'),
(37, 'Zinedine Zidane', 'Real Madrid', 'XS,S,M', '2003/04', 119.00, 20, 'Club', 'Iconic Real Madrid home jersey worn by Zinedine Zidane featuring the classic white Adidas design with Siemens Mobile sponsor. A legendary retro football jersey from the Galácticos era.', 'product_main_1779096393660.jpg', '2026-05-18 09:26:33', 'product_second_1779096393660.jpg', 'product_third_1779096393660.jpg', 'product_fourth_1779096393660.jpg'),
(39, 'David Beckham', 'Manchester United', 'XS,S,XL', '2002/03', 179.00, 45, 'Club', 'Iconic Manchester United home jersey worn during David Beckham’s final season at the club. Features the classic red design with black side panels, Vodafone sponsor logo, Nike construction, and Beckham’s legendary number 7 styling. A must-have retro jersey for football collectors and Premier League fans.', 'product_main_1779096880970.jpg', '2026-05-18 09:34:41', 'product_second_1779096880970.jpg', 'product_third_1779096880970.jpg', 'product_fourth_1779096880970.jpg'),
(40, 'Bruno Fernandes', 'Portugal', 'S,M,XXL', '2022/23', 134.00, 37, 'Nation', 'Premium Portugal national team jersey featuring Bruno Fernandes’ number 8 print. Designed with Portugal’s signature red and green split-color style, lightweight performance fabric, and modern athletic fit. Ideal for match-day wear, collectors, and international football supporters.', 'product_main_1779097004124.jpg', '2026-05-18 09:36:44', 'product_second_1779097004124.jpg', 'product_third_1779097004124.jpg', 'product_fourth_1779097004124.jpg'),
(42, 'Eric Cantona', 'Manchester United', 'XS,S,M', '1993/94', 189.00, 30, 'Club', 'Legendary black Manchester United away jersey associated with Eric Cantona’s iconic Premier League era. Features the classic Umbro design, Sharp Viewcam sponsor, vintage club crest styling, and long-sleeve retro football fit. A timeless collector’s jersey for Manchester United supporters and retro football fans.', 'product_main_1779097215756.jpg', '2026-05-18 09:40:15', 'product_second_1779097215756.jpg', 'product_third_1779097215756.jpg', 'product_fourth_1779097215756.jpg'),
(43, 'Paulo Dybala', 'Argentina', 'L,XL,XXL', '2022/23', 144.00, 28, 'Nation', 'Official-style Argentina home jersey featuring Paulo Dybala’s iconic number 10 print. Designed with the classic sky-blue and white striped pattern, Adidas performance technology, lightweight breathable material, and a modern slim athletic fit inspired by Argentina’s championship-winning era.', 'product_main_1779097339559.jpg', '2026-05-18 09:42:19', 'product_second_1779097339559.jpg', 'product_third_1779097339559.jpg', 'product_fourth_1779097339559.jpg'),
(44, 'Endrick', 'Brazil', 'XS,M,L', '2023/24', 159.00, 20, 'Nation', 'Vibrant Brazil home jersey featuring rising star Endrick in the iconic yellow and green national colors. Includes modern Nike performance technology, lightweight moisture-wicking fabric, and a sleek athletic fit designed for elite-level comfort and style. Perfect for Brazil supporters and next-generation football collectors.', 'product_main_1779097441412.jpg', '2026-05-18 09:44:01', 'product_second_1779097441412.jpg', 'product_third_1779097441412.jpg', 'product_fourth_1779097441412.jpg'),
(45, 'Erling Haaland', 'Norway', 'M,L,XL', '2023/24', 169.00, 38, 'Nation', 'Premium Norway national team jersey featuring Erling Haaland’s number 9 print. Designed with Norway’s bold red, blue, and white vertical stripe pattern, Nike performance fabric, breathable lightweight construction, and a modern athletic fit inspired by Haaland’s explosive international performances.', 'product_main_1779097514501.jpg', '2026-05-18 09:45:14', 'product_second_1779097514501.jpg', 'product_third_1779097514501.jpg', 'product_fourth_1779097514501.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_text` text NOT NULL,
  `recommend` varchar(10) DEFAULT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `product_id`, `order_id`, `rating`, `review_text`, `recommend`, `review_date`) VALUES
(5, 26, 26, 17, 5, 'Best Jersey to wear', 'Yes', '2026-05-19 06:43:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'member',
  `profile_image` varchar(255) DEFAULT NULL,
  `approval_status` varchar(20) DEFAULT 'denied'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `email`, `phone`, `registration_date`, `password`, `address`, `gender`, `role`, `profile_image`, `approval_status`) VALUES
(24, 'ADMIN', 'admin@gmail.com', '9843411719', '2026-05-19', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Okhaldhunga', 'Male', 'admin', 'admin_gmail_com.jpg', 'approved'),
(26, 'Pankaj Rai', 'pankaj@gmail.com', '9843411719', '2026-05-19', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Okhaldhunga', 'Male', 'user', 'pankaj_gmail_com.jpg', 'approved'),
(27, 'superman', 'superman@gmail.com', '1234567890', '2026-05-19', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Gotham', 'Male', 'user', 'superman_gmail_com.jpg', 'deleted');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `product_id`, `added_at`) VALUES
(8, 26, 31, '2026-05-19 06:39:46'),
(9, 26, 24, '2026-05-19 06:39:57'),
(11, 26, 21, '2026-05-20 14:47:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `unique_user_cart` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD UNIQUE KEY `unique_cart_product_size` (`cart_id`,`product_id`,`selected_size`),
  ADD KEY `fk_cart_items_product` (`product_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `fk_contact_user` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orders_user` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `fk_order_items_order` (`order_id`),
  ADD KEY `fk_order_items_product` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_payments_order` (`order_id`),
  ADD KEY `fk_payments_user` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `unique_user_product_review` (`user_id`,`product_id`),
  ADD KEY `fk_review_product` (`product_id`),
  ADD KEY `fk_review_order` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `unique_user_product_wishlist` (`user_id`,`product_id`),
  ADD KEY `fk_wishlist_product` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `fk_cart_items_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD CONSTRAINT `fk_contact_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_payments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_review_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
