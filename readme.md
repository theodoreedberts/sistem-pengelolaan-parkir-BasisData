# 🅿️ Relational Database: Sistem Pengelolaan Parkir

[![MySQL](https://img.shields.io/badge/Database-MySQL-blue?style=flat-square&logo=mysql)](https://www.mysql.com/)
[![Computer Science](https://img.shields.io/badge/Context-Academic%20Project-orange?style=flat-square)](#)

Proyek ini merupakan implementasi **Sistem Pengelolaan Parkir Berbasis Data Relasional** yang dirancang untuk mengatasi problem antrean fisik, risiko kebocoran pendapatan, serta manipulasi pencatatan denda manual. Sistem ini mendukung kalkulasi tarif progresif otomatis, integrasi status keanggotaan (member), manajemen denda, hingga pelacakan kapasitas slot parkir secara real-time.

> Proyek ini disusun sebagai Tugas Besar mata kuliah IN224T - Basis Data (Semester Genap 2025/2026), Program Studi Teknik Informatika, Universitas Kristen Maranatha.

---

## 👥 Anggota Tim
1. **Theodore Edbert Suryo** (2572002)
2. **Kenneth Ansell Hansjaya** (2572013) 
3. **Darren Nicholas** (2572019) 

---

## 🗺️ Entity Relationship Diagram (ERD)

Berikut adalah rancangan struktural antarentitas (Area Parkir, Kendaraan, Member, Transaksi, Jenis Tarif, Denda, Petugas, dan Pembayaran) yang membangun sistem ini:

![Entity Relationship Diagram](docs/erd_diagram.png)

---

## ⚙️ Skema Data & Spesifikasi Teknis

Sistem ini berdiri di atas 8 entitas utama dengan aturan data yang ketat:

1. **Area Parkir (`Area_Parkir`)**: Mengatur zonasi (Mobil/Motor) dan batas total daya tampung armada[cite: 83, 85].
2. **Jenis Tarif (`Jenis_Tarif`)**: Menyediakan acuan biaya per jam berdasarkan kategori (Reguler/Member/VIP) tanpa mengganggu logika aplikasi jika ada perubahan tarif[cite: 90, 91, 92].
3. **Petugas (`Petugas`)**: Menyimpan data kredensial staf kasir/operator untuk menjaga akuntabilitas *audit trail*[cite: 94, 95].
4. **Denda (`Denda`)**: Master data penalti (seperti tiket hilang, parkir sembarangan, atau menginap tanpa izin)[cite: 97, 98].
5. **Member (`Member`)**: Melacak data validitas kontrak tenggang waktu keanggotaan pelanggan[cite: 100, 101, 102].
6. **Kendaraan (`Kendaraan`)**: Entitas fisik armada (dibuat *nullable* pada `id_member` agar fleksibel untuk kendaraan non-member)[cite: 103, 104, 105, 152].
7. **Transaksi (`Transaksi`)**: Log masuk-keluar kendaraan, lengkap dengan penanda status aktif dan bukti visual foto gerbang[cite: 108, 109, 110].
8. **Pembayaran (`Pembayaran`)**: Bukti digital pelunasan finansial yang mengunci pembukuan akhir pendapatan[cite: 112, 113, 114].

---

## 🎭 Skenario Operasional Sistem

### 1. Pengunjung Reguler (Normal)
* [cite_start]**Masuk**: Sistem memvalidasi plat nomor baru, jika belum ada maka data kendaraan disimpan ke tabel `Kendaraan` (`id_member IS NULL`)[cite: 24, 25]. [cite_start]Kemudian, data `Transaksi` dibuat dengan status `'Masuk'`[cite: 26].
* **Keluar**: Mengubah status menjadi `'Selesai'`, mencatat `waktu_keluar`, menghitung durasi menggunakan fungsi `TIMESTAMPDIFF`, mengalikannya dengan biaya dari master tarif, lalu mencatat struk di tabel `Pembayaran`[cite: 28, 29, 30].

### 2. Parkir Khusus Member
* [cite_start]Sistem melakukan `JOIN` antara tabel `Kendaraan` dan `Member` untuk mengecek masa kedaluwarsa kartu[cite: 33, 34]. [cite_start]Jika valid, transaksi diarahkan ke skema tarif khusus member (tarif flat Rp 0,00 atau harga khusus member)[cite: 36, 38].

### 3. Pengunjung Terkena Denda
* Jika terjadi pelanggaran, kolom `id_denda` pada tabel `Transaksi` diubah dari `NULL` menjadi ID sanksi yang sesuai (misal: `'D01'`)[cite: 41]. Total tagihan akhir dihitung otomatis via query: `(durasi * biaya_tarif) + nominal_denda`[cite: 44].

### 4. Pengecekan Kapasitas Penuh
* Sebelum `INSERT` data transaksi baru pada area tertentu, sistem menjalankan agregasi `SELECT COUNT(id_transaksi) WHERE status_parkir = 'Masuk'`[cite: 47, 48]. Jika hasil hitung mencapai batas `kapasitas_total` area tersebut, sistem akan memblokir transaksi baru[cite: 50, 51].

---

## 💻 Implementasi Kode SQL

Semua berkas skrip SQL secara modular dapat ditemukan di direktori [`/database`](./database).
