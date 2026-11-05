# Online Retail II: Analisis Pelanggan dan Pendapatan

Analisis 1 juta+ transaksi retail online UK (2009-2011): SQL, segmentasi RFM,
cohort retensi, dan dashboard Tableau.

**Dashboard:** https://public.tableau.com/app/profile/dira.amelia/viz/Book1_17938653670610/OnlineRetailIIDashboard?
**Notebook Kaggle:** https://www.kaggle.com/code/diraamelia/01-online-retail-ii-data-cleaning | https://www.kaggle.com/code/diraamelia/02-online-retail-ii-sql-analysis | https://www.kaggle.com/code/diraamelia/03-online-retail-ii-rfm-cohort

## Pertanyaan bisnis
1. Siapa pelanggan paling bernilai dan siapa yang mulai hilang?
2. Bagaimana retensi pelanggan dari bulan ke bulan?
3. Produk dan negara mana yang mendorong pendapatan?

## Temuan utama
- Champions (22,5% pelanggan) menyumbang 70% pendapatan
- Hanya ±21% pelanggan baru kembali di bulan berikutnya
- 83,4% pendapatan dari Inggris; puncak penjualan setiap November
- Segmen At Risk (245 pelanggan) bernilai tinggi tapi sudah lama tidak belanja

## Rekomendasi
- Champions: program loyalitas dan akses awal produk musiman
- At Risk: kampanye win-back personal (prioritas tertinggi)
- Pelanggan baru: onboarding 30 hari pertama
- Lost: kampanye otomatis berbiaya rendah

## Pembersihan data
1.067.371 baris awal menjadi 776.574 (72,8%): duplikat dihapus, retur dipisah,
harga/kuantitas tidak valid dan kode non-produk (POST, M, BANK CHARGES, dll)
dikeluarkan, 3 invoice yang dibatalkan dibuang, baris tanpa Customer ID dikeluarkan.

## Keterbatasan
- 21% baris tanpa Customer ID tidak masuk analisis pelanggan
- Desember 2011 hanya berisi data sampai 9 Des
- Retur tidak dikurangkan dari RFM
- Cohort 2009-12 berisi pelanggan lama

## Struktur
- `notebooks/` : cleaning, SQL, RFM dan cohort
- `sql/queries.sql` : 5 query SQL
