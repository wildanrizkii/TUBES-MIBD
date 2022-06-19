-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2022 at 07:59 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mibd`
--

-- --------------------------------------------------------

--
-- Table structure for table `akse`
--

CREATE TABLE `akse` (
  `id_aksesoris` int(8) NOT NULL,
  `no_pesanan` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `aksesoris`
--

CREATE TABLE `aksesoris` (
  `id_aksesoris` int(8) NOT NULL,
  `stok` int(8) NOT NULL,
  `jenis` varchar(16) NOT NULL,
  `harga_beli` varchar(60) NOT NULL,
  `harga_jual` varchar(60) NOT NULL,
  `fotoAksesoris` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aksesoris`
--

INSERT INTO `aksesoris` (`id_aksesoris`, `stok`, `jenis`, `harga_beli`, `harga_jual`, `fotoAksesoris`) VALUES
(1, 10, 'BT01', '200000', '300000', '');

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `id_bahan` int(8) NOT NULL,
  `no_pesanan` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `id_bahan` int(8) NOT NULL,
  `jenis` varchar(16) NOT NULL,
  `harga_beli` varchar(60) NOT NULL,
  `harga_jual` varchar(60) NOT NULL,
  `fotoBahan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan_baku`
--

INSERT INTO `bahan_baku` (`id_bahan`, `jenis`, `harga_beli`, `harga_jual`, `fotoBahan`) VALUES
(1, 'Katun', '50000', '150000', ''),
(2, 'Linen', '30000', '100000', '');

-- --------------------------------------------------------

--
-- Table structure for table `detail_ukuran`
--

CREATE TABLE `detail_ukuran` (
  `id_detUkuran` int(8) NOT NULL,
  `id_model` int(8) NOT NULL,
  `id_ukuran` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `id_kurir` int(8) NOT NULL,
  `nama_kurir` varchar(60) NOT NULL,
  `ekspedisi` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kurir`
--

INSERT INTO `kurir` (`id_kurir`, `nama_kurir`, `ekspedisi`) VALUES
(1, 'Adriel', 'JNT'),
(2, 'Adrian', 'JNE'),
(4, 'Brian', 'SiCepat');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id_model` int(8) NOT NULL,
  `no_pesanan` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `model_baju`
--

CREATE TABLE `model_baju` (
  `id_model` int(8) NOT NULL,
  `id_Ukuran` int(8) NOT NULL,
  `harga_beli` varchar(60) NOT NULL,
  `harga_jual` varchar(60) NOT NULL,
  `fotoModel` varchar(255) NOT NULL,
  `id_bahan` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(8) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `nama` varchar(16) NOT NULL,
  `email` varchar(60) NOT NULL,
  `noHP` varchar(16) NOT NULL,
  `role` varchar(16) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `noRek` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `nama`, `email`, `noHP`, `role`, `alamat`, `noRek`) VALUES
(14, 'wildanrizkii', 'wildan123', 'Wildan', 'wildanrizki9560@gmail.com', '089646436360', 'pemilik', 'Jalan Batik Pekalongan No. 36', '088945223'),
(52, 'admin1', 'admin1123', 'Brendo', 'brendo@gmail.com', '089646436312', 'admin', '', '0'),
(53, 'admin2', 'admin2123', 'Budi', 'bud212@gmail.com', '089646436360', 'admin', '', '0'),
(72, 'user1', 'user123', 'Brendo', 'brendo@gmail.com', '089646436360', 'user', 'Jalan Rereng \r\nAdumanis No.3', 'undefined');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `no_pesanan` int(8) NOT NULL,
  `tanggal` date NOT NULL,
  `status_pesanan` varchar(60) NOT NULL,
  `total_harga` varchar(16) NOT NULL,
  `id_pengguna` int(8) NOT NULL,
  `no_transaksi` varchar(8) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` int(8) NOT NULL,
  `no_pesanan` int(8) NOT NULL,
  `id_kurir` int(8) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `status_pesanan` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `no_pesanan`, `id_kurir`, `tanggal_transaksi`, `status_pesanan`) VALUES
(501, 9000, 1001, '2022-06-11', 'Menunggu divalidasi');

-- --------------------------------------------------------

--
-- Table structure for table `ukuran`
--

CREATE TABLE `ukuran` (
  `id_ukuran` int(8) NOT NULL,
  `nomor` varchar(60) NOT NULL,
  `panjang` int(16) NOT NULL,
  `lebar` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ukuran`
--

INSERT INTO `ukuran` (`id_ukuran`, `nomor`, `panjang`, `lebar`) VALUES
(1, 'M - Baju', 100, 60),
(2, 'M - Celana', 110, 60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aksesoris`
--
ALTER TABLE `aksesoris`
  ADD PRIMARY KEY (`id_aksesoris`);

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`id_bahan`);

--
-- Indexes for table `detail_ukuran`
--
ALTER TABLE `detail_ukuran`
  ADD PRIMARY KEY (`id_detUkuran`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indexes for table `model_baju`
--
ALTER TABLE `model_baju`
  ADD PRIMARY KEY (`id_model`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`no_pesanan`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `no_transaksi` (`no_transaksi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`);

--
-- Indexes for table `ukuran`
--
ALTER TABLE `ukuran`
  ADD PRIMARY KEY (`id_ukuran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aksesoris`
--
ALTER TABLE `aksesoris`
  MODIFY `id_aksesoris` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  MODIFY `id_bahan` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_ukuran`
--
ALTER TABLE `detail_ukuran`
  MODIFY `id_detUkuran` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kurir`
--
ALTER TABLE `kurir`
  MODIFY `id_kurir` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `model_baju`
--
ALTER TABLE `model_baju`
  MODIFY `id_model` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `no_pesanan` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ukuran`
--
ALTER TABLE `ukuran`
  MODIFY `id_ukuran` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
