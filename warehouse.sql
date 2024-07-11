-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2024 at 10:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama`, `jabatan`, `tanggal_masuk`, `gaji`) VALUES
(1, 'Andi Pratama', 'Manajer Gudang', '2020-01-15', 8000000.00),
(2, 'Budi Santoso', 'Staff Gudang', '2021-03-20', 4500000.00),
(3, 'Citra Dewi', 'Admin Inventory', '2022-05-10', 5000000.00),
(4, 'Dian Purnama', 'Staff Pengiriman', '2023-02-01', 4000000.00),
(5, 'Eko Prasetyo', 'Staff Penerimaan', '2023-07-15', 4000000.00),
(6, 'Fajar Nugroho', 'Staff Gudang', '2021-09-01', 4500000.00),
(7, 'Gita Pratiwi', 'Admin Pesanan', '2022-11-05', 5000000.00),
(8, 'Hadi Sucipto', 'Staff Pengiriman', '2023-04-10', 4000000.00),
(9, 'Indah Sari', 'Staff Penerimaan', '2023-08-20', 4000000.00),
(10, 'Joko Widodo', 'Asisten Manajer', '2021-06-01', 6500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `deskripsi`) VALUES
(1, 'Komputer', 'Perangkat keras komputer dan aksesoris'),
(2, 'Smartphone', 'Telepon pintar dan aksesorisnya'),
(3, 'Perlengkapan Kantor', 'Peralatan dan perlengkapan untuk kantor'),
(4, 'Audio', 'Perangkat audio dan aksesoris'),
(5, 'Jaringan', 'Perangkat jaringan dan konektivitas');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL,
  `nama_lokasi` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `kapasitas` int(11) DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `nama_lokasi`, `alamat`, `kapasitas`, `status`) VALUES
(1, 'Gudang Pusat', 'Jl. Industri No. 1, Jakarta', 10000, 'Aktif'),
(2, 'Gudang Cabang Surabaya', 'Jl. Raya Surabaya No. 10, Surabaya', 5000, 'Aktif'),
(3, 'Gudang Cabang Bandung', 'Jl. Asia Afrika No. 15, Bandung', 3000, 'Aktif'),
(4, 'Gudang Transit', 'Jl. Pelabuhan No. 5, Semarang', 2000, 'Aktif'),
(5, 'Gudang Lama', 'Jl. Veteran No. 20, Jakarta', 1000, 'Tidak Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `tanggal_pesanan` date DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `tanggal_pesanan`, `id_produk`, `jumlah`, `status`) VALUES
(1, '2024-07-01', 1, 5, 'Diproses'),
(2, '2024-07-02', 2, 10, 'Dikirim'),
(3, '2024-07-03', 3, 3, 'Selesai'),
(4, '2024-07-04', 4, 8, 'Diproses'),
(5, '2024-07-05', 5, 15, 'Menunggu'),
(6, '2024-07-06', 6, 20, 'Diproses'),
(7, '2024-07-07', 7, 7, 'Dikirim'),
(8, '2024-07-08', 8, 4, 'Selesai'),
(9, '2024-07-09', 9, 12, 'Menunggu'),
(10, '2024-07-10', 10, 6, 'Diproses');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `deskripsi`, `harga`, `unit`, `id_kategori`) VALUES
(1, 'Laptop A1', 'Laptop 14 inch, RAM 8GB, SSD 256GB', 8000000.00, 'unit', 1),
(2, 'Smartphone X1', 'Smartphone 6.5 inch, RAM 6GB, Storage 128GB', 4000000.00, 'unit', 2),
(3, 'Printer Ink Black', 'Tinta printer warna hitam', 100000.00, 'cartridge', 3),
(4, 'Monitor M1', 'Monitor 24 inch, Full HD', 1500000.00, 'unit', 1),
(5, 'Keyboard K1', 'Keyboard Mechanical RGB', 1000000.00, 'unit', 1),
(6, 'Network Cable', 'Kabel LAN Cat6 100m', 500000.00, 'roll', 5),
(7, 'Thermal Paste', 'Pasta termal untuk CPU', 50000.00, 'tube', 3),
(8, 'Computer Screws', 'Set sekrup untuk perangkat keras komputer', 25000.00, 'pack', 3),
(9, 'USB Flash Drive', 'USB Flash Drive 32GB', 80000.00, 'piece', 4),
(10, 'Cleaning Kit', 'Kit pembersih perangkat elektronik', 150000.00, 'set', 3);

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id_stok` int(11) NOT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `lokasi_rak` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id_stok`, `id_produk`, `jumlah`, `lokasi_rak`) VALUES
(1, 1, 50, 'A1-01'),
(2, 2, 100, 'A2-02'),
(3, 3, 30, 'B1-03'),
(4, 4, 40, 'B2-04'),
(5, 5, 80, 'C1-05'),
(6, 6, 120, 'C2-06'),
(7, 7, 60, 'D1-07'),
(8, 8, 25, 'D2-08'),
(9, 9, 70, 'E1-09'),
(10, 10, 45, 'E2-10');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(100) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `nomor_telepon`, `email`) VALUES
(1, 'PT Elektronik Jaya', 'Jl. Industri No. 10, Jakarta', '021-5551234', 'info@elektronikjaya.com'),
(2, 'CV Maju Teknologi', 'Jl. Raya Bekasi No. 15, Bekasi', '021-8882345', 'sales@majuteknologi.com'),
(3, 'UD Sentosa Komputer', 'Jl. Sudirman No. 20, Surabaya', '031-7773456', 'contact@sentosakomp.com'),
(4, 'PT Mega Elektro', 'Jl. Gatot Subroto No. 25, Bandung', '022-6664567', 'support@megaelektro.com'),
(5, 'CV Abadi Teknik', 'Jl. Thamrin No. 30, Medan', '061-4445678', 'info@abaditeknik.com'),
(6, 'PT Sinar Digital', 'Jl. Diponegoro No. 35, Semarang', '024-3336789', 'sales@sinardigital.com'),
(7, 'UD Cahaya Komputer', 'Jl. Veteran No. 40, Makassar', '0411-2227890', 'info@cahayakomp.com'),
(8, 'CV Mitra Teknologi', 'Jl. Gajah Mada No. 45, Yogyakarta', '0274-5558901', 'support@mitrateknologi.com');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `jenis_transaksi` enum('Masuk','Keluar') NOT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal_transaksi`, `jenis_transaksi`, `id_produk`, `jumlah`, `id_karyawan`, `keterangan`) VALUES
(1, '2024-07-01 09:00:00', 'Masuk', 1, 10, 2, 'Pengiriman dari supplier'),
(2, '2024-07-02 14:30:00', 'Keluar', 2, 5, 4, 'Pengiriman ke pelanggan'),
(3, '2024-07-03 11:15:00', 'Masuk', 3, 20, 5, 'Restok tinta printer'),
(4, '2024-07-04 16:45:00', 'Keluar', 4, 3, 4, 'Pengiriman ke cabang'),
(5, '2024-07-05 10:30:00', 'Masuk', 5, 15, 2, 'Pengiriman dari supplier');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id_stok`),
  ADD UNIQUE KEY `id_produk` (`id_produk`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
