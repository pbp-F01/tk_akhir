<div align="center" style="padding-bottom: 20px">
	<h1>Tugas Akhir Kelompok PBP - F01 - GoUMKM</h1>
</div>

[![Build & upload to Firebase App Distribution](https://github.com/pbp-F01/tk_akhir/actions/workflows/main.yml/badge.svg)](https://github.com/pbp-F01/tk_akhir/actions/workflows/main.yml)[![Release](https://github.com/pbp-F01/tk_akhir/actions/workflows/release.yml/badge.svg)](https://github.com/pbp-F01/tk_akhir/actions/workflows/release.yml)

### Nama Anggota Kelompok

    1. Ihza Dafa Maulidan - 2106652726
    2. Ahmadhi Prananta Hastiputra - 2106702895
    3. Shafa Aleyda Tsabitah - 2106634534
    4. Rafinal Haryokusumo Taloputra - 2106634540
    5. Sania Rizqi Maharani - 2006597001

### Deskripsi Aplikasi

### :iphone: Nama Aplikasi

Nama aplikasi yang akan kami gunakan pada tugas akhir kelompok ini adalah **GoUMKM**. Kami menggunakan GoUMKM sebagai nama aplikasi kami karena aplikasi kami bertujuan
untuk membantu UMKM - UMKM yang ada dengan aplikasi yang akan kami konstruksi.

### :bulb: Fungsi Aplikasi

Pada aplikasi yang akan kami buat berisi segala hal terkait dengan UMKM di Indonesia seperti cara pendaftaran UMKM pada GoUMKM, fitur rating dan review UMKM, investasi pada UMKM, daftar lokasi UMKM, dan berita terkini mengenai UMKM. Tentunya aplikasi ini mempunyai banyak manfaat tidak hanya untuk pelaku dan konsumen UMKM, tapi untuk perekonomian rakyat Indonesia.

Berdasarkan permasalahan di atas, kami hendak membuat sebuah aplikasi perangkat lunak berbasis Web dan Aplikasi sebagai media yang terkait dengan UMKM di Indonesia. Pengembangan aplikasi ini bertujuan agar pemanfaatan digitalisasi untuk beberapa sektor UMKM yang belum beradaptasi secara digital dapat dioptimalkan serta membantu para pelaku UMKM dalam mempromosikan usaha UMKM di masa pasca pandemi. Dengan adanya aplikasi ini, harapannya dapat bermanfaat untuk pelaku dan konsumen UMKM, bahkan untuk perekonomian rakyat Indonesia.

### :busts_in_silhouette: Peran atau Aktor Pengguna Aplikasi

**Pemilik UMKM**: Pemilik UMKM dapat meng-_update_ laporan penjualan.

**Investor Dana UMKM**: Investor dapat melakukan donasi untuk membantu para UMKM, melakukan pemantauan terhadap laporan penjualan UMKM dan melihat _review_ dari UMKM.

**Konsumen UMKM**: Konsumen dapat melihat halaman mengenai letak dari lokasi UMKM, deskripsi detail mengenai produk yang dihasilkan oleh UMKM, menulis _review_ dari UMKM dan menulis komentar pada berita-berita mengenai UMKM.

### :page_facing_up: Daftar fitur atau modul yang diimplementasikan beserta kontrak kinerja per anggota kelompok.

- Landing Page - **Rafinal Haryokusumo Taloputra**

Landing page akan memuat halaman untuk melakukan proses _login_ dan _register_. Pada saat registrasi akun, juga akan tersedia opsi untuk memilih _role_ yang ingin dipilih yaitu pelaku UMKM, konsumen UMKM, ataupun investor UMKM.

- Daftar lokasi dan detail deskripsi/profil UMKM - **Ahmadhi Prananta Hastiputra**

Modul ini akan menampilkan lokasi setiap UMKM serta deskripsi mengenai sektor usaha dari setiap UMKM yang terdaftar pada GoUMKM

- Dashboard laporan penjualan UMKM (untuk pihak investor) - **Sania Rizqi Maharani**

Dashboard laporan penjualan akan menampilkan laporan penjualan dari setiap UMKM sehingga investor dapat memantau tingkat perkembangan penjualan dari setiap UMKM. Laporan penjulana GoUMKM hanya dapat diperbarui oleh UMKM yang bersangkutan.

- Berita UMKM - **Shafa Aleyda Tsabitah**

Berita UMKM akan menampilkan berita yang bersangkutan dengan perkembangan UMKM di Indonesia serta menambah komentar pada laman yang memuat berita tertentu.

- Review/rating UMKM (dari konsumen) - **Ihza Dafa Maulidan**

Review atau rating UMKM akan menampilkan review dan rating UMKM yang terdaftar pada GoUMKM, selain itu user juga dapat menambahkan atau memasukkan review dan ratingnya masing-masing pada UMKM.

### :link: Alur pengintegrasian dengan web service untuk terhubung dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester.

1. Untuk membuat akses data-nya terintegrasi dengan data pada web yang sebelumnya, kelompok kami membuat REST API pada Django yang isinya data pada web sebelumnya untuk diakses oleh mobile app flutter.
2. Pada aplikasi flutter, tampilan yang akan kami buat juga disesuaikan dengan desain user interface yang sesuai dengan konsep awal dan akhir pada Django app yang sudah dibuat sebelumnya.
3. Membuat model yang berisi class sesuai dengan respons dari data yang kami peroleh dari web service Django yang sudah dibuat sebelumnya.
4. Menggunakan package `http` untuk melakukan HTTP request ke url endpoint web service Django agar dapat terintegrasi dengan mobile app flutter (front-end) dengan Django app (back-end) secara asinkronus.
