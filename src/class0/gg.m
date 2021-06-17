IO = imread('1.jpg'); %buka file
figure(1), imshow(IO) %menampilkan gambar asli

IG = rgb2gray(IO); %rgb to greyscale
figure(2), imshow(IG) %menampilkan gambar grayscale

IR = imresize (IG, [20 20] ) %ubah ukuran gambar ke 20x20 pixel
imshow(IR) %menampilkan gambar greyscale dengan ukuran 20x20

