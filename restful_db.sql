-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: dbUser
-- Waktu pembuatan: 24 Okt 2022 pada 16.04
-- Versi server: 5.7.40
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `dosen_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nip` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`dosen_id`, `user_id`, `nip`) VALUES
(1, 6, 12457459679),
(2, 7, 67367345662),
(3, 8, 42353234756),
(4, 9, 45342353454),
(5, 10, 34534534553);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `mahasiswa_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `generation` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`mahasiswa_id`, `user_id`, `nim`, `generation`, `status`, `lecture_id`) VALUES
(1, 1, 12345, 2020, 1, 1),
(2, 2, 42341, 2020, 1, 1),
(3, 3, 67562, 2020, 1, 1),
(4, 4, 53453, 2020, 1, 1),
(5, 5, 34535, 2020, 1, 1),
(6, 11, 12346, 2020, 1, 2),
(7, 12, 42342, 2020, 1, 2),
(8, 13, 67563, 2020, 1, 2),
(9, 14, 53454, 2020, 1, 2),
(10, 15, 34837, 2020, 1, 2),
(11, 16, 12649, 2020, 1, 3),
(12, 17, 42647, 2020, 1, 3),
(13, 18, 67870, 2020, 1, 3),
(14, 19, 53763, 2020, 1, 3),
(15, 20, 34847, 2020, 1, 3),
(16, 21, 12652, 2021, 1, 1),
(17, 22, 42649, 2021, 1, 1),
(18, 23, 67871, 2021, 1, 1),
(19, 24, 53763, 2021, 1, 1),
(20, 25, 34846, 2021, 1, 1),
(21, 26, 12658, 2021, 1, 2),
(22, 27, 42655, 2021, 1, 2),
(23, 28, 67877, 2021, 1, 2),
(24, 29, 53769, 2021, 1, 2),
(25, 30, 34852, 2021, 1, 2),
(26, 31, 12664, 2021, 1, 3),
(27, 32, 42662, 2021, 1, 3),
(28, 33, 67885, 2021, 1, 3),
(29, 34, 53778, 2021, 1, 3),
(30, 35, 34862, 2021, 1, 3),
(31, 36, 12667, 2022, 1, 1),
(32, 37, 42664, 2022, 1, 1),
(33, 38, 67886, 2022, 1, 1),
(34, 39, 53778, 2022, 1, 1),
(35, 40, 34861, 2022, 1, 1),
(36, 41, 12673, 2022, 1, 2),
(37, 42, 42670, 2022, 1, 2),
(38, 43, 67892, 2022, 1, 2),
(39, 44, 53784, 2022, 1, 2),
(40, 45, 34867, 2022, 1, 2),
(41, 46, 12679, 2022, 1, 3),
(42, 47, 42677, 2022, 1, 3),
(43, 48, 67900, 2022, 1, 3),
(44, 49, 53793, 2022, 1, 3),
(45, 50, 34877, 2022, 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `user_adrdess` varchar(200) NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '1=Mahasiswa | 2=Dosen'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `full_name`, `user_adrdess`, `user_type`) VALUES
(1, 'mhswa2020.1', 'Mhsw 2020 1', '160 Schurz Place', 1),
(2, 'mhswa2020.2', 'Mhsw 2020 2', '0508 Clemons Drive', 1),
(3, 'mhswa2020.3', 'Mhsw 2020 3', '37742 Golden Leaf Avenue', 1),
(4, 'mhswa2020.4', 'Mhsw 2020 4', '91898 Nova Lane', 1),
(5, 'mhswa2020.5', 'Mhsw 2020 5', '83780 Vermont Point', 1),
(6, 'dosen1', 'Dosen 1', '16 Saint Paul Trail', 2),
(7, 'dosen2', 'Dosen 2', '65510 East Court', 2),
(8, 'dosen3', 'Dosen 3', '611 Knutson Junction', 2),
(9, 'dosen4', 'Dosen 4', '13615 Milwaukee Hill', 2),
(10, 'dosen5', 'Dosen 5', '9925 Portage Plaza', 2),
(11, 'mhsw2020.1', 'Mhsw 2020 1', '160 Schurz Place', 1),
(12, 'mhsw2020.2', 'Mhsw 2020 2', '0508 Clemons Drive', 1),
(13, 'mhsw2020.3', 'Mhsw 2020 3', '37742 Golden Leaf Avenue', 1),
(14, 'mhsw2020.4', 'Mhsw 2020 4', '91898 Nova Lane', 1),
(15, 'mhsw2020.5', 'Mhsw 2020 5', '83780 Vermont Point', 1),
(16, 'mhsw2020.1', 'Mhsw 2020 1', '160 Schurz Place', 1),
(17, 'mhsw2020.2', 'Mhsw 2020 2', '0508 Clemons Drive', 1),
(18, 'mhsw2020.3', 'Mhsw 2020 3', '37742 Golden Leaf Avenue', 1),
(19, 'mhsw2020.4', 'Mhsw 2020 4', '91898 Nova Lane', 1),
(20, 'mhsw2020.5', 'Mhsw 2020 5', '83780 Vermont Point', 1),
(21, 'mhsw2021.1', 'Mhsw 2021 1', '160 Schurz Place', 1),
(22, 'mhsw2021.2', 'Mhsw 2021 2', '0508 Clemons Drive', 1),
(23, 'mhsw2021.3', 'Mhsw 2021 3', '37742 Golden Leaf Avenue', 1),
(24, 'mhsw2021.4', 'Mhsw 2021 4', '91898 Nova Lane', 1),
(25, 'mhsw2021.5', 'Mhsw 2021 5', '83780 Vermont Point', 1),
(26, 'mhsw2021.1', 'Mhsw 2021 1', '160 Schurz Place', 1),
(27, 'mhsw2021.2', 'Mhsw 2021 2', '0508 Clemons Drive', 1),
(28, 'mhsw2021.3', 'Mhsw 2021 3', '37742 Golden Leaf Avenue', 1),
(29, 'mhsw2021.4', 'Mhsw 2021 4', '91898 Nova Lane', 1),
(30, 'mhsw2021.5', 'Mhsw 2021 5', '83780 Vermont Point', 1),
(31, 'mhsw2021.1', 'Mhsw 2021 1', '160 Schurz Place', 1),
(32, 'mhsw2021.2', 'Mhsw 2021 2', '0508 Clemons Drive', 1),
(33, 'mhsw2021.3', 'Mhsw 2021 3', '37742 Golden Leaf Avenue', 1),
(34, 'mhsw2021.4', 'Mhsw 2021 4', '91898 Nova Lane', 1),
(35, 'mhsw2021.5', 'Mhsw 2021 5', '83780 Vermont Point', 1),
(36, 'mhsw2022.1', 'Mhsw 2021 1', '160 Schurz Place', 1),
(37, 'mhsw2022.2', 'Mhsw 2021 2', '0508 Clemons Drive', 1),
(38, 'mhsw2022.3', 'Mhsw 2021 3', '37742 Golden Leaf Avenue', 1),
(39, 'mhsw2022.4', 'Mhsw 2021 4', '91898 Nova Lane', 1),
(40, 'mhsw2022.5', 'Mhsw 2021 5', '83780 Vermont Point', 1),
(41, 'mhsw2022.1', 'Mhsw 2021 1', '160 Schurz Place', 1),
(42, 'mhsw2022.2', 'Mhsw 2021 2', '0508 Clemons Drive', 1),
(43, 'mhsw2022.3', 'Mhsw 2021 3', '37742 Golden Leaf Avenue', 1),
(44, 'mhsw2022.4', 'Mhsw 2021 4', '91898 Nova Lane', 1),
(45, 'mhsw2022.5', 'Mhsw 2021 5', '83780 Vermont Point', 1),
(46, 'mhsw2022.1', 'Mhsw 2021 1', '160 Schurz Place', 1),
(47, 'mhsw2022.2', 'Mhsw 2021 2', '0508 Clemons Drive', 1),
(48, 'mhsw2022.3', 'Mhsw 2021 3', '37742 Golden Leaf Avenue', 1),
(49, 'mhsw2022.4', 'Mhsw 2021 4', '91898 Nova Lane', 1),
(50, 'mhsw2022.5', 'Mhsw 2021 5', '83780 Vermont Point', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`dosen_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`mahasiswa_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `dosen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `mahasiswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
