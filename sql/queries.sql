# Tabel: sales (data bersih, 776.574 baris)
# Kolom: invoice, stockcode, description, quantity, invoicedate, price, customer_id, country, total_price, invoice_month

# Pendapatan, pesanan, dan pelanggan aktif per bulan
SELECT invoice_month AS bulan,
       ROUND(SUM(total_price), 0) AS pendapatan,
       COUNT(DISTINCT invoice) AS jumlah_pesanan,
       COUNT(DISTINCT customer_id) AS pelanggan_aktif
FROM sales
GROUP BY invoice_month
ORDER BY invoice_month;

# Pertumbuhan bulan ke bulan 
WITH bulanan AS (
  SELECT invoice_month AS bulan, SUM(total_price) AS pendapatan
  FROM sales GROUP BY invoice_month
)
SELECT bulan,
       ROUND(pendapatan, 0) AS pendapatan,
       ROUND((pendapatan - LAG(pendapatan) OVER (ORDER BY bulan)) * 100.0
             / LAG(pendapatan) OVER (ORDER BY bulan), 1) AS growth_pct
FROM bulanan
ORDER BY bulan;

# Top 10 produk berdasarkan pendapatan (per stockcode)
SELECT stockcode, MAX(description) AS description,
       SUM(quantity) AS unit_terjual,
       ROUND(SUM(total_price), 0) AS pendapatan
FROM sales
GROUP BY stockcode
ORDER BY pendapatan DESC
LIMIT 10;

# Pendapatan per negara (persentase)
SELECT country,
       ROUND(SUM(total_price), 0) AS pendapatan,
       COUNT(DISTINCT customer_id) AS pelanggan,
       ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM sales), 1) AS persen
FROM sales
GROUP BY country
ORDER BY pendapatan DESC
LIMIT 10;

# 10 pelanggan terbaik dengan peringkat dan kontribusi
SELECT customer_id,
       ROUND(SUM(total_price), 0) AS total_belanja,
       COUNT(DISTINCT invoice) AS jumlah_pesanan,
       RANK() OVER (ORDER BY SUM(total_price) DESC) AS peringkat,
       ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM sales), 2) AS persen_total
FROM sales
GROUP BY customer_id
ORDER BY peringkat
LIMIT 10;