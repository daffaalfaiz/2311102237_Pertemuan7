# Penjelasan Singkat Widget UI Flutter

Berikut adalah penjelasan singkat mengenai beberapa widget UI Flutter yang digunakan dalam tugas praktikum ini:

## 1. Container
Container adalah widget yang digunakan untuk membungkus widget lain dan mengatur dekorasi tampilannya. Widget ini sangat fleksibel karena mendukung pengaturan lebar (width), tinggi (height), padding (jarak dalam), margin (jarak luar), warna latar, border (garis tepi), border radius (sudut melengkung), hingga bayangan (box shadow) dan warna gradasi (gradient) menggunakan properti decoration.

## 2. GridView
GridView merupakan widget layout dua dimensi yang menampilkan sekumpulan widget dalam bentuk baris dan kolom (grid) yang dapat digulir. GridView sangat berguna untuk membuat tampilan menu, galeri foto, atau katalog produk. Pada tugas ini, digunakan GridView.count dengan properti crossAxisCount untuk membagi kolom secara merata, serta properti crossAxisSpacing dan mainAxisSpacing untuk mengatur jarak antar item.

## 3. ListView
ListView adalah widget layout satu dimensi (vertikal atau horizontal) yang digunakan untuk menampilkan daftar item secara berurutan. ListView statis sangat cocok digunakan jika jumlah item yang ditampilkan sedikit dan nilainya tetap (statis), seperti pada halaman menu navigasi atau halaman pengaturan aplikasi. Semua item di dalamnya akan langsung dimuat ke memori saat halaman ditampilkan.

## 4. ListView.builder
ListView.builder adalah tipe ListView yang membuat item secara dinamis dan efisien. Widget ini menerapkan prinsip "lazy loading" di mana item hanya akan dirender ketika akan terlihat di layar. ListView.builder sangat direkomendasikan saat menampilkan daftar data yang sangat banyak atau yang bersumber dari array/API. Properti utamanya meliputi itemCount untuk menentukan jumlah data dan itemBuilder untuk membangun widget dari data tersebut.

## 5. ListView.separated
ListView.separated mirip dengan ListView.builder, tetapi memiliki fungsi tambahan untuk menaruh widget pembatas secara otomatis di antara setiap item list. Properti tambahannya adalah separatorBuilder yang biasanya diisi dengan widget Divider (garis pembatas) atau SizedBox (jarak kosong). Widget ini mempermudah pembuatan daftar list dengan pembatas tanpa harus menyelipkannya secara manual di dalam itemBuilder.

## 6. Stack
Stack adalah widget layout yang memungkinkan kita untuk menumpuk beberapa widget di atas satu sama lain secara bertingkat (sumbu z), mirip dengan tumpukan kartu. Stack sangat berguna untuk membuat UI kustom seperti menampilkan teks di atas gambar latar belakang atau menaruh foto profil bertumpuk. Untuk mengatur posisi elemen di dalam Stack secara spesifik, digunakan widget pembungkus bernama Positioned yang memiliki parameter top, bottom, left, dan right.
