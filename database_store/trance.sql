SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `trance`
--

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `store_category_id` int(11) NOT NULL,
  `sales` int(11) DEFAULT NULL,
  PRIMARY KEY (`store_number`),
  KEY `store_category_id` (`store_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `store_category`
--

CREATE TABLE `store_category` (
  `category_id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stores`
--

ALTER TABLE `stores`
  ADD CONSTRAINT `category_fkey` FOREIGN KEY (`store_category_id`) REFERENCES `store_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;