SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
--
-- Database: `trance`
--
-- --------------------------------------------------------
--
-- Table structure for table `stores`
--
CREATE TABLE `stores` (
  `stores_id` int(10) NOT NULL auto_increment,
  `store_number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `store_sales_id` int(11) NOT NULL,
  PRIMARY KEY (`stores_id`),
  KEY `store_sales` (`store_sales`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=5;
--
-- Table structure for table `store_sales`
--
CREATE TABLE `store_sales` (
  `store_sales_id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  PRIMARY KEY (`store_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Constraints for dumped tables
--
--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `store_sales_fk` FOREIGN KEY (`store_sales_id`) REFERENCES `store_sales` (`store_sales_id`) ON DELETE CASCADE ON UPDATE CASCADE;