create database Tubes_BasisData;
use Tubes_BasisData;

CREATE TABLE Area_Parkir (
    kode_area VARCHAR(50) PRIMARY KEY,
    nama_area VARCHAR(100) NOT NULL,
    peruntukan VARCHAR(100) NOT NULL,
    kapasitas_total INT NOT NULL
);

CREATE TABLE Jenis_Tarif (
    id_tarif VARCHAR(50) PRIMARY KEY,
    kategori_layanan VARCHAR(100) NOT NULL,
    peruntukan_kendaraan VARCHAR(100) NOT NULL,
    nama_tarif VARCHAR(100) NOT NULL,
    biaya DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Petugas (
    id_petugas VARCHAR(50) PRIMARY KEY,
    nama_petugas VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_akses VARCHAR(50) NOT NULL
);

CREATE TABLE Denda (
    id_denda VARCHAR(50) PRIMARY KEY,
    nama_pelanggaran VARCHAR(255) NOT NULL,
    nominal_denda DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Member (
    id_member VARCHAR(50) PRIMARY KEY,
    nama_lengkap VARCHAR(150) NOT NULL,
    no_telepon VARCHAR(20) NOT NULL,
    tanggal_daftar DATE NOT NULL,
    tanggal_kedaluwarsa DATE NOT NULL,
    status_keanggotaan VARCHAR(50) NOT NULL
);

CREATE TABLE Kendaraan (
    plat_nomor VARCHAR(20) PRIMARY KEY,
    id_member VARCHAR(50), -- Boleh Null
    jenis_kendaraan VARCHAR(50) NOT NULL,
    keterangan_fisik TEXT, -- Boleh Null
    FOREIGN KEY (id_member) REFERENCES Member(id_member)
);

CREATE TABLE Transaksi (
    id_transaksi VARCHAR(50) PRIMARY KEY,
    plat_nomor VARCHAR(20) NOT NULL,
    id_tarif VARCHAR(50) NOT NULL,
    kode_area VARCHAR(50) NOT NULL,
    waktu_masuk DATETIME NOT NULL,
    waktu_keluar DATETIME, -- Boleh Null
    status_parkir VARCHAR(50) NOT NULL,
    foto_kendaraan_masuk VARCHAR(255) NOT NULL,
    foto_kendaraan_keluar VARCHAR(255) NOT NULL,
    FOREIGN KEY (plat_nomor) REFERENCES Kendaraan(plat_nomor),
    FOREIGN KEY (id_tarif) REFERENCES Jenis_Tarif(id_tarif),
    FOREIGN KEY (kode_area) REFERENCES Area_Parkir(kode_area)
);

CREATE TABLE Pembayaran (
    id_pembayaran VARCHAR(50) PRIMARY KEY,
    id_transaksi VARCHAR(50) NOT NULL,
    id_petugas VARCHAR(50) NOT NULL,
    waktu_bayar DATETIME NOT NULL,
    metode_bayar VARCHAR(50) NOT NULL,
    total_tagihan DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi),
    FOREIGN KEY (id_petugas) REFERENCES Petugas(id_petugas)
);
