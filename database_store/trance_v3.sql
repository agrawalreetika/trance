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
  PRIMARY KEY (`store_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Table structure for table `store_sales`
--
CREATE TABLE `sales` (
  `store_number` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `store_sales` int(11) DEFAULT NULL,
  KEY `store_number` (`store_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Constraints for dumped tables
--
--
-- Constraints for table `store_sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `store_number` FOREIGN KEY (`store_number`) REFERENCES `stores` (`store_number`) ON DELETE CASCADE ON UPDATE CASCADE;