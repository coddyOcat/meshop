SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `MeShop`
--
CREATE DATABASE `MeShop` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `MeShop`;

-- --------------------------------------------------------

--
-- Table structure for table `ChiTietDonDatHang`
--

CREATE TABLE IF NOT EXISTS `ChiTietDonDatHang` (
  `MaChiTietDonDatHang` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `GiaBan` int(11) DEFAULT NULL,
  `MaDonDatHang` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `MaSanPham` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietDonDatHang`),
  KEY `fk_ChiTietDonDatHang_DonDatHang1_idx` (`MaDonDatHang`),
  KEY `fk_ChiTietDonDatHang_SanPham1_idx` (`MaSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DonDatHang`
--

CREATE TABLE IF NOT EXISTS `DonDatHang` (
  `MaDonDatHang` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `NgayLap` datetime DEFAULT NULL,
  `TongThanhTien` int(11) DEFAULT NULL,
  `MaTaiKhoan` int(11) NOT NULL,
  `MaTinhTrang` int(11) NOT NULL,
  PRIMARY KEY (`MaDonDatHang`),
  KEY `fk_DonDatHang_TaiKhoan1_idx` (`MaTaiKhoan`),
  KEY `fk_DonDatHang_TinhTrang1_idx` (`MaTinhTrang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `HangSanXuat`
--

CREATE TABLE IF NOT EXISTS `HangSanXuat` (
  `MaHangSanXuat` int(11) NOT NULL AUTO_INCREMENT,
  `TenHangSanXuat` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LogoURL` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MaHangSanXuat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `HangSanXuat`
--

INSERT INTO `HangSanXuat` (`MaHangSanXuat`, `TenHangSanXuat`, `BiXoa`) VALUES
(1, 'Revell', 0),
(2, 'Lego', 0),
(3, 'Lamaze', 0),
(4, 'vTech', 0),
(5, 'Rastar', 0),
(6, 'Syma', 0);

-- --------------------------------------------------------

--
-- Table structure for table `LoaiSanPham`
--

CREATE TABLE IF NOT EXISTS `LoaiSanPham` (
  `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiSanPham` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MaLoaiSanPham`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `LoaiSanPham`
--

INSERT INTO `LoaiSanPham` (`MaLoaiSanPham`, `TenLoaiSanPham`, `BiXoa`) VALUES
(1, 'Th?? nh???i b??ng', 0),
(2, '????? ch??i nh???a', 0),
(3, '????? ch??i ??i???n t???', 0),
(4, '??i???u khi???n t??? xa', 0),
(5, '????? ch??i tr?? tu???', 0);

-- --------------------------------------------------------

--
-- Table structure for table `LoaiTaiKhoan`
--

CREATE TABLE IF NOT EXISTS `LoaiTaiKhoan` (
  `MaLoaiTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiTaiKhoan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaLoaiTaiKhoan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `LoaiTaiKhoan`
--

INSERT INTO `LoaiTaiKhoan` (`MaLoaiTaiKhoan`, `TenLoaiTaiKhoan`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `SanPham`
--

CREATE TABLE IF NOT EXISTS `SanPham` (
  `MaSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HinhURL` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GiaSanPham` int(11) DEFAULT NULL,
  `NgayNhap` datetime DEFAULT NULL,
  `SoLuongNhap` int(11) DEFAULT NULL,
  `SoLuongTon` int(11) DEFAULT NULL,
  `SoLuongBan` int(11) DEFAULT NULL,
  `SoLuotXem` int(11) DEFAULT NULL,
  `XuatXu` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MoTa` text COLLATE utf8_unicode_ci,
  `BiXoa` tinyint(1) DEFAULT '0',
  `MaLoaiSanPham` int(11) NOT NULL,
  `MaHangSanXuat` int(11) NOT NULL,
  PRIMARY KEY (`MaSanPham`),
  KEY `fk_SanPham_LoaiSanPham1_idx` (`MaLoaiSanPham`),
  KEY `fk_SanPham_HangSanXuat1_idx` (`MaHangSanXuat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Dumping data for table `SanPham`
--

INSERT INTO `SanPham` (`MaSanPham`, `TenSanPham`, `HinhURL`, `GiaSanPham`, `NgayNhap`, `SoLuongTon`, `SoLuongBan`, `SoLuotXem`, `MoTa`, `BiXoa`, `MaLoaiSanPham`, `MaHangSanXuat`) VALUES
(4, 'Bill D. Beaver', '8568c7f31076735d806a9efcd8615e3f.jfif', 160000, '2022-05-25 00:00:00', 14, 9, 25, 'H???i l?? b???ng b??ng m???n, ?????p, d??? th????ng', 0, 1, 3),
(5, 'Captain Calamari', '8568c7f31076735d806a9efcd8615e3f.jfif', 180000, '2022-05-01 00:00:00', 14, 6, 4, 'B???ch tu???c bi???n', 0, 1, 3),
(7, 'Elephantunes', '8568c7f31076735d806a9efcd8615e3f.jfif', 480000, '2022-05-12 00:00:00', 25, 2, 9, 'Voi b???ng b??ng, h???ng x?? tin...', 0, 1, 3),
(8, 'Freddie the Firefly', '8568c7f31076735d806a9efcd8615e3f.jfif', 300000, '2022-05-03 00:00:00', 30, 0, 8, 'B?????m nh???i b??ng', 0, 1, 3),
(9, 'Supper Mario', '8568c7f31076735d806a9efcd8615e3f.jfif', 380000, '2022-01-01 00:00:00', 24, 6, 14, 'B??? l???p ??p Lego tr?? ch??i Mario', 0, 5, 2),
(10, 'Nasa Academy Space', '8568c7f31076735d806a9efcd8615e3f.jfif', 220000, '2022-05-15 00:00:00', 28, 7, 8, 'T??u con thoi c???a Nasa', 0, 3, 1),
(11, 'Lamborghini Revention', '8568c7f31076735d806a9efcd8615e3f.jfif', 260000, '2022-05-01 00:00:00', 38, 3, 38, 'Si??u xe Lamborghini Revention', 0, 3, 1),
(12, 'Camaro SS', '8568c7f31076735d806a9efcd8615e3f.jfif', 260000, '2022-05-02 00:00:00', 20, 0, 0, 'Xe ??ua Camaro SS', 0, 3, 1),
(13, 'Pond Motion Gym', '8568c7f31076735d806a9efcd8615e3f.jfif', 920000, '2022-05-04 00:00:00', 10, 2, 14, 'Ni???m l??t cho tr??? em', 0, 1, 3),
(14, 'Stacking Rings', '8568c7f31076735d806a9efcd8615e3f.jfif', 240000, '2022-05-25 00:00:00', 5, 5, 1, 'V??ng xoay k??? th??, k??ch th??ch s??? t?? m?? c???a tr???', 0, 1, 3),
(15, 'Octivity Time', '8568c7f31076735d806a9efcd8615e3f.jfif', 270000, '2022-05-27 00:00:00', 19, 3, 3, 'B?? m???t tr???i xanh', 0, 1, 3),
(16, 'Mittens the Kitten', '8568c7f31076735d806a9efcd8615e3f.jfif', 190000, '2022-05-13 00:00:00', 50, 3, 5, 'Ch?? m??o ng??? ngh??nh', 0, 1, 3),
(17, 'Feel Me Fish', '8568c7f31076735d806a9efcd8615e3f.jfif', 180000, '2022-05-15 00:00:00', 60, 3, 2, 'Ch?? c?? v??ng ??a s???c', 0, 1, 3),
(18, 'Huey the Hedgehog', '8568c7f31076735d806a9efcd8615e3f.jfif', 200000, '2022-05-14 00:00:00', 30, 30, 22, 'Nhi???m b???y m??u, mang ?????n s??? may m???n cho b??', 0, 1, 3),
(19, 'Neat-Oh!', '8568c7f31076735d806a9efcd8615e3f.jfif', 110000, '2022-05-12 00:00:00', 19, 13, 24, 'T??i ????? ch??i x??y d???ng c??ng vi??n c???a Lego', 0, 5, 2),
(20, 'Ninjago 2172', '8568c7f31076735d806a9efcd8615e3f.jfif', 160000, '2022-05-12 00:00:00', 20, 12, 13, 'B??? x???p h??nh Lego th???i Ai C???p c??? ?????i', 0, 5, 2),
(21, 'Mexican', '8568c7f31076735d806a9efcd8615e3f.jfif', 140000, '2022-05-17 00:00:00', 35, 12, 12, 'B??? x???p h??nh Lego nh???c c??ng Mehico', 0, 5, 2),
(22, 'Star Wars', '8568c7f31076735d806a9efcd8615e3f.jfif', 500000, '2022-05-05 00:00:00', 24, 28, 30, 'B??? x???p h??nh Lego phi thuy???n trong cu???c chi???n tranh gi???a c??c v?? sao', 0, 5, 2),
(23, 'City Park Cafe 3061', '8568c7f31076735d806a9efcd8615e3f.jfif', 950000, '2022-05-07 00:00:00', 30, 2, 24, 'B??? x???p h??nh x??y d???ng shop cafe trong th??nh ph??? ', 0, 5, 2),
(24, 'Bright Lights Ball', '8568c7f31076735d806a9efcd8615e3f.jfif', 150000, '2022-05-08 00:00:00', 39, 2, 6, 'Qu??? c???u th??ng minh', 0, 2, 4),
(25, 'Baby''s Laptop', '8568c7f31076735d806a9efcd8615e3f.jfif', 240000, '2022-05-07 00:00:00', 38, 2, 4, 'Laptop th??ng tin c???a tr??? em, gi??p tr??? ph??t tri???n t?? duy tr?? tu???', 0, 2, 4),
(26, 'Toot Driver Garage', '8568c7f31076735d806a9efcd8615e3f.jfif', 620000, '2022-05-07 00:00:00', 20, 12, 30, 'B??i ????? xe trong th??nh ph???, s??? gi??p b?? t??? ??i???u h??nh vi???c ho???t ?????ng c???a m???t b??i ????? xe hi???n ?????i trong th??nh ph???', 0, 2, 4),
(27, 'Emergency Vehicles (3-Pack)', '8568c7f31076735d806a9efcd8615e3f.jfif', 223000, '2022-05-02 00:00:00', 20, 12, 3, 'B??? s???n ph???m 3 xe ????? ch??i, ?????p, d??? th????ng v?? an to??n v???i tr???', 0, 2, 4),
(28, 'Lamborghini Murcielago', '8568c7f31076735d806a9efcd8615e3f.jfif', 300000, '2022-05-01 00:00:00', 10, 1, 2, 'Xe ??i???u khi???n t??? xa Lamborghini', 0, 4, 5),
(29, 'Rover Sport HSE', '8568c7f31076735d806a9efcd8615e3f.jfif', 320000, '2022-05-30 00:00:00', 10, 3, 2, 'Xe ??i???u khi???n Rover, v?????t m???i ?????a h??nh, s???c m???nh c???a tr??u', 0, 4, 5),
(30, 'Apache Helicopter', '8568c7f31076735d806a9efcd8615e3f.jfif', 625000, '2022-05-01 00:00:00', 4, 2, 1, 'M??y bay chi???n ????u si??u ??a n??ng Apache', 0, 4, 6),
(31, 'Micro Helicopter', '8568c7f31076735d806a9efcd8615e3f.jfif', 560000, '2022-05-05 00:00:00', 2, 6, 5, 'M??y bay l??n th???ng ??a d???ng', 0, 4, 6),
(32, 'Micro Chinook', '8568c7f31076735d806a9efcd8615e3f.jfif', 410000, '2022-05-06 00:00:00', 3, 0, 0, 'M??y bay tr???c th??ng v???n t???i, ??a d???ng, c?? th??? v???n chuy???n ???????c xe t??ng', 0, 4, 6),
(33, 'X1 - 01', '8568c7f31076735d806a9efcd8615e3f.jfif', 600000, '2022-05-06 00:00:00', 4, 0, 15, 'M??y bay l??n th???ng 4 c??nh qu???t, ??a d???ng v?? d??? d??ng ??i???u khi???n v?????t qua m???i ?????a h??nh', 0, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `TaiKhoan`
--

CREATE TABLE IF NOT EXISTS `TaiKhoan` (
  `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MatKhau` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenHienThi` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DienThoai` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT '0',
  `MaLoaiTaiKhoan` int(11) NOT NULL,
  PRIMARY KEY (`MaTaiKhoan`),
  KEY `fk_TaiKhoan_LoaiTaiKhoan_idx` (`MaLoaiTaiKhoan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `TaiKhoan`
--

INSERT INTO `TaiKhoan` (`MaTaiKhoan`, `TenDangNhap`, `MatKhau`, `TenHienThi`, `DiaChi`, `DienThoai`, `Email`, `BiXoa`, `MaLoaiTaiKhoan`) VALUES
(1, 'admin', 'admin', 'Admin website', 'Me Shop', '0909123456', 'admin@meshop.vn', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `TinhTrang`
--

CREATE TABLE IF NOT EXISTS `TinhTrang` (
  `MaTinhTrang` int(11) NOT NULL AUTO_INCREMENT,
  `TenTinhTrang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `TinhTrang`
--

INSERT INTO `TinhTrang` (`MaTinhTrang`, `TenTinhTrang`) VALUES
(1, '?????t h??ng'),
(2, '??ang giao h??ng'),
(3, 'Thanh to??n'),
(4, 'H???y');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ChiTietDonDatHang`
--
ALTER TABLE `ChiTietDonDatHang`
  ADD CONSTRAINT `fk_ChiTietDonDatHang_DonDatHang1` FOREIGN KEY (`MaDonDatHang`) REFERENCES `DonDatHang` (`MaDonDatHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ChiTietDonDatHang_SanPham1` FOREIGN KEY (`MaSanPham`) REFERENCES `SanPham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `DonDatHang`
--
ALTER TABLE `DonDatHang`
  ADD CONSTRAINT `fk_DonDatHang_TaiKhoan1` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `TaiKhoan` (`MaTaiKhoan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DonDatHang_TinhTrang1` FOREIGN KEY (`MaTinhTrang`) REFERENCES `TinhTrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `SanPham`
--
ALTER TABLE `SanPham`
  ADD CONSTRAINT `fk_SanPham_HangSanXuat1` FOREIGN KEY (`MaHangSanXuat`) REFERENCES `HangSanXuat` (`MaHangSanXuat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SanPham_LoaiSanPham1` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `LoaiSanPham` (`MaLoaiSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `TaiKhoan`
--
ALTER TABLE `TaiKhoan`
  ADD CONSTRAINT `fk_TaiKhoan_LoaiTaiKhoan` FOREIGN KEY (`MaLoaiTaiKhoan`) REFERENCES `LoaiTaiKhoan` (`MaLoaiTaiKhoan`) ON DELETE NO ACTION ON UPDATE NO ACTION;
