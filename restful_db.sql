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
(6, 11, 12346, 2021, 1, 2),
(7, 12, 42342, 2021, 1, 2),
(8, 13, 67563, 2021, 1, 2),
(9, 14, 53454, 2021, 1, 2),
(10, 15, 34536, 2021, 1, 2),
(11, 16, 12347, 2022, 1, 3),
(12, 17, 42344, 2022, 1, 3),
(13, 18, 67566, 2022, 1, 3),
(14, 19, 53458, 2022, 1, 3),
(15, 20, 34541, 2022, 1, 3);

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
(1, 'mahasiswa1', 'Mahasiswa 1', '160 Schurz Place', 1),
(2, 'mahasiswa2', 'Mahasiswa 2', '0508 Clemons Drive', 1),
(3, 'mahasiswa3', 'Mahasiswa 3', '37742 Golden Leaf Avenue', 1),
(4, 'mahasiswa4', 'Mahasiswa 4', '91898 Nova Lane', 1),
(5, 'mahasiswa5', 'Mahasiswa 5', '83780 Vermont Point', 1),
(6, 'dosen1', 'Dosen 1', '16 Saint Paul Trail', 2),
(7, 'dosen2', 'Dosen 2', '65510 East Court', 2),
(8, 'dosen3', 'Dosen 3', '611 Knutson Junction', 2),
(9, 'dosen4', 'Dosen 4', '13615 Milwaukee Hill', 2),
(10, 'dosen5', 'Dosen 5', '9925 Portage Plaza', 2),
(11, 'mahasiswa1', 'Mahasiswa 1', '160 Schurz Place', 1),
(12, 'mahasiswa2', 'Mahasiswa 2', '0508 Clemons Drive', 1),
(13, 'mahasiswa3', 'Mahasiswa 3', '37742 Golden Leaf Avenue', 1),
(14, 'mahasiswa4', 'Mahasiswa 4', '91898 Nova Lane', 1),
(15, 'mahasiswa5', 'Mahasiswa 5', '83780 Vermont Point', 1),
(16, 'mahasiswa1', 'Mahasiswa 1', '160 Schurz Place', 1),
(17, 'mahasiswa2', 'Mahasiswa 2', '0508 Clemons Drive', 1),
(18, 'mahasiswa3', 'Mahasiswa 3', '37742 Golden Leaf Avenue', 1),
(19, 'mahasiswa4', 'Mahasiswa 4', '91898 Nova Lane', 1),
(20, 'mahasiswa5', 'Mahasiswa 5', '83780 Vermont Point', 1);

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
