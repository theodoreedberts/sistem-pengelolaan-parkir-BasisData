INSERT INTO Area_Parkir (kode_area, nama_area, peruntukan, kapasitas_total) VALUES
('A1', 'Lantai 1', 'Mobil', 100),
('A2', 'Lantai 2', 'Mobil', 100),
('B1', 'Basement 1', 'Motor', 200),
('B2', 'Basement 2', 'Motor', 200),
('VIP', 'Area VIP', 'Mobil Premium', 20);

INSERT INTO Jenis_Tarif (id_tarif, kategori_layanan, peruntukan_kendaraan, nama_tarif, biaya) VALUES
('T01', 'Reguler', 'Motor', 'Tarif Motor Reguler', 2000.00),
('T02', 'Reguler', 'Mobil', 'Tarif Mobil Reguler', 5000.00),
('T03', 'Member', 'Motor', 'Tarif Motor Member', 0.00),
('T04', 'Member', 'Mobil', 'Tarif Mobil Member', 0.00),
('T05', 'VIP', 'Mobil', 'Tarif Mobil VIP', 20000.00);

INSERT INTO Petugas (id_petugas, nama_petugas, username, password, role_akses) VALUES
('P01', 'Ahmad', 'ahmad_p', 'pass123', 'Admin'),
('P02', 'Budi', 'budi_p', 'pass123', 'Operator Pintu Masuk'),
('P03', 'Citra', 'citra_p', 'pass123', 'Operator Pintu Keluar'),
('P04', 'Dewi', 'dewi_p', 'pass123', 'Kasir'),
('P05', 'Eko', 'eko_p', 'pass123', 'Supervisor');

INSERT INTO Denda (id_denda, nama_pelanggaran, nominal_denda) VALUES
('D01', 'Tiket Hilang Mobil', 50000.00),
('D02', 'Tiket Hilang Motor', 25000.00),
('D03', 'Parkir Sembarangan', 100000.00),
('D04', 'Menginap Tanpa Izin', 150000.00),
('D05', 'Kerusakan Fasilitas', 500000.00);

INSERT INTO member (id_member, nama_lengkap, no_telepon, tanggal_daftar, tanggal_kadaluarsa, status_keanggotaan) VALUES
('0', 'Non-Member', '-', '2000-01-01', '2099-12-31', 'Tidak Aktif'),
('1', 'Fajar Pratama', '081234567890', '2024-01-01', '2025-01-01', 'Aktif'),
('2', 'Gita Gutawa', '081234567891', '2024-02-01', '2025-02-01', 'Aktif'),
('3', 'Hadi Sucipto', '081234567892', '2023-05-01', '2024-05-01', 'Kedaluwarsa'),
('4', 'Indah Permatasari', '081234567893', '2024-06-01', '2025-06-01', 'Aktif'),
('5', 'Rian Wijaya', '085712345678', '2026-01-10', '2026-12-01', 'Aktif'),
('6', 'Dewi Lestari', '081922334455', '2026-03-15', '2026-12-01', 'Aktif'),
('7', 'Siti Aminah', '082198765432', '2024-10-10', '2025-10-10', 'Kedaluwarsa'),
('8', 'Budi Santoso', '081311223344', '2025-01-01', '2026-01-01', 'Kedaluwarsa'),
('9', 'Eko Prasetyo', '087855667788', '2025-02-15', '2026-02-15', 'Kedaluwarsa'),
('10', 'Citra Kirana', '081299887766', '2025-03-20', '2026-03-20', 'Aktif');

INSERT INTO kendaraan (plat_nomor, id_member, jenis_kendaraan, keterangan_fisik) VALUES
('B 1122 KLI', '5', 'Mobil', 'Yaris Putih'),
('B 3344 XYZ', '6', 'Motor', 'Scoopy Cream'),
('B 5678 CD', '1', 'Motor', 'Vario Merah'),
('D 1234 AB', '2', 'Mobil', 'Avanza Hitam'),
('D 4567 MNO', '7', 'Mobil', 'Fortener Hitam, Gagah'),
('D 6543 CBA', '8', 'Motor', 'PCX Merah Bold'),
('D 9999 AB', '3', 'Mobil', 'Xpander Putih'),
('E 8888 FG', '4', 'Motor', 'Cbr150r'),
('F 4321 AA', '6', 'Motor', 'Nmax Hitam'),
('F 8888 GD', '9', 'Mobil', 'Brio Kuning'),
('L 7890 IJ', '0', 'Mobil', 'Civic Abu-abu'),
('N 3456 GH', '1', 'Motor', 'Beat Biru'),
('Z 7777 OP', '10', 'Motor', 'Vespa Kuning');

INSERT INTO transaksi (id_transaksi, plat_nomor, id_tariff, kode_area, waktu_masuk, waktu_keluar, status_parkir, foto_kendaraan_masuk, foto_kendaraan_keluar, id_denda) VALUES
('TRX-001', 'D 1234 AB', 'T04', 'A1', '2026-06-14 08:00:00', '2026-06-14 10:00:00', 'Selesai', 'in_1.jpg', 'out_1.jpg', NULL),
('TRX-002', 'Z 9012 EF', 'T02', 'A2', '2026-06-14 08:15:00', '2026-06-14 11:15:00', 'Selesai', 'in_2.jpg', 'out_2.jpg', NULL),
('TRX-003', 'B 5678 CD', 'T03', 'B1', '2026-06-12 08:30:00', '2026-06-12 15:30:00', 'Selesai', 'in_3.jpg', 'out_3.jpg', NULL),
('TRX-004', 'N 3456 GH', 'T01', 'B2', '2026-06-14 09:00:00', '2026-06-14 10:15:00', 'Selesai', 'in_4.jpg', 'out_4.jpg', NULL),
('TRX-005', 'L 7890 IJ', 'T02', 'A1', '2026-06-13 09:30:00', '2026-06-13 11:00:00', 'Selesai', 'in_5.jpg', 'out_5.jpg', 'D01'),
('TRX-006', 'D 1234 AB', 'T04', 'A1', '2026-06-15 15:00:00', NULL, 'Parkir', 'in_6.jpg', NULL, NULL),
('TRX-007', 'D 1234 AB', 'T04', 'A1', '2026-01-05 08:00:00', '2026-01-05 17:00:00', 'Selesai', 'in_7.jpg', 'out_7.jpg', NULL),
('TRX-008', 'D 1234 AB', 'T04', 'A1', '2026-02-05 08:00:00', '2026-02-05 17:00:00', 'Selesai', 'in_8.jpg', 'out_8.jpg', NULL),
('TRX-009', 'D 1234 AB', 'T04', 'A1', '2026-04-05 08:00:00', '2026-04-05 17:00:00', 'Selesai', 'in_9.jpg', 'out_9.jpg', NULL),
('TRX-010', 'E 8888 FG', 'T04', 'A2', '2026-06-15 00:29:44', NULL, 'Parkir', 'in_10.jpg', NULL, NULL),
('TRX-011', 'Z 7777 OP', 'T02', 'A1', '2026-05-16 00:29:44', NULL, 'Parkir', 'in_11.jpg', NULL, NULL),
('TRX-012', 'L 7890 IJ', 'T05', 'VIP', '2026-05-16 00:29:44', NULL, 'Parkir', 'in_12.jpg', NULL, NULL),
('TRX-021', 'B 5678 CD', 'T03', 'B1', '2026-06-15 09:17:56', NULL, 'Parkir', 'in_21.jpg', NULL, NULL);

INSERT INTO pembayaran (id_pembayaran, id_transaksi, jumlah_bayar, metode_pembayaran, waktu_pembayaran, status_pembayaran) VALUES
('PAY-001', 'TRX-001', 12000, 'Cash', '2026-06-14 10:00:00', 'Sukses'),
('PAY-002', 'TRX-002', 15000, 'E-Wallet', '2026-06-14 11:15:00', 'Sukses'),
('PAY-003', 'TRX-003', 25000, 'Qris', '2026-06-12 15:30:00', 'Sukses'),
('PAY-004', 'TRX-004', 10000, 'Cash', '2026-06-14 10:15:00', 'Sukses'),
('PAY-005', 'TRX-005', 65000, 'E-Wallet', '2026-06-13 11:00:00', 'Sukses'),
('PAY-006', 'TRX-007', 30000, 'Qris', '2026-01-05 17:00:00', 'Sukses'),
('PAY-007', 'TRX-008', 30000, 'Qris', '2026-02-05 17:00:00', 'Sukses'),
('PAY-008', 'TRX-009', 30000, 'Qris', '2026-04-05 17:00:00', 'Sukses');