# Laporan Transaksi Harian

SELECT 
    DATE(t.waktu_masuk) AS tanggal,
    COUNT(t.id_transaksi) AS total_kendaraan_masuk,
    SUM(CASE WHEN t.status_parkir = 'Selesai' THEN 1 ELSE 0 END) AS kendaraan_selesai,
    SUM(CASE WHEN t.status_parkir = 'Parkir' THEN 1 ELSE 0 END) AS masih_di_dalam,
    IFNULL(SUM(p.total_tagihan), 0) AS total_pendapatan_harian
FROM transaksi t
LEFT JOIN pembayaran p ON t.id_transaksi = p.id_transaksi
GROUP BY DATE(t.waktu_masuk)
ORDER BY tanggal DESC;

# Menampilkan nama member, milik kendaraa, status member kedaluwarsa dan kapan terakhir bayar membernya

SELECT
    m.nama_lengkap AS 'Nama Member',
    k.plat_nomor AS 'Plat Nomor',
    k.jenis_kendaraan AS 'Jenis Kendaraan',
    m.status_keanggotaan AS 'Status Member',
    m.tanggal_kadaluarsa AS 'Tanggal Kedaluwarsa',
    MAX(p.waktu_payar) AS 'Terakhir Bayar Member' 
FROM member m
JOIN kendaraan k ON m.id_member = k.id_member
JOIN transaksi t ON k.plat_nomor = t.plat_nomor
JOIN pembayaran p ON t.id_transaksi = p.id_transaksi
GROUP BY 
    m.id_member, 
    m.nama_lengkap, 
    k.plat_nomor, 
    k.jenis_kendaraan, 
    m.status_keanggotaan, 
    m.tanggal_kadaluarsa;

# TAMPILAN DATA YANG MASIH TERPARKIR DI AREA MANA

select
    t.id_transaksi,
    t.plat_nomor,
    k.jenis_kendaraan,
    a.nama_area,
    t.waktu_masuk,
    t.status_parkir
from transaksi t
join kendaraan k on t.plat_nomor = k.plat_nomor
join area_parkir a on t.kode_area = a.kode_area
where t.status_parkir = 'Parkir';

# LAPORAN PELANGGARAN BERDASARKAN AREA PARKIR

SELECT
    t.id_transaksi,
    t.plat_nomor,
    k.jenis_kendaraan,
    t.waktu_masuk,
    t.waktu_keluar,
    t.status_parkir,
    IFNULL(p.total_tagihan, 0) AS total_bayar
FROM transaksi t
JOIN kendaraan k ON t.plat_nomor = k.plat_nomor
LEFT JOIN pembayaran p ON t.id_transaksi = p.id_transaksi
WHERE t.plat_nomor = 'D 1234 AB'
ORDER BY t.waktu_masuk DESC;

# LAPORAN KINERJA PETUGAS

select
    pt.id_petugas,
    pt.nama_petugas,
    count(p.total_tagihan)
from pembayaran p
join petugas pt on p.id_petugas = pt.id_petugas
group by pt.id_petugas, pt.nama_petugas;

# DURASI PARKIR

SELECT
    t.id_transaksi,
    t.plat_nomor,
    k.jenis_kendaraan,
    t.waktu_masuk,
    t.waktu_keluar,
    t.status_parkir,
    IFNULL(p.total_tagihan, 0) AS total_bayar
FROM transaksi t
JOIN kendaraan k ON t.plat_nomor = k.plat_nomor
LEFT JOIN pembayaran p ON t.id_transaksi = p.id_transaksi
WHERE t.id_transaksi = 'TRX-001';

