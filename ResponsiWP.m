%mengimport data dari excel dengan cara membaca nya
x = readtable('Real estate valuation data set.xlsx'); 
data=x;
%mengambil data khieteria yg digunakan dan mengkonversi ke array
excel = [data(1:50,3) data(1:50,4) data(1:50,5) data(1:50,8)];
x = table2array(excel);

k = [0,0,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan  0= atribut biaya
w = [3,5,4,1];%Nilai bobot tiap kriteria

%tahapan pertama, perbaikan bobot
%inisialisasi ukuran x /menghitung size dari x nya
[m n]=size (x);
%normalisasi data bobot
%membagi bobot per kriteria dengan jumlah total seluruh bobot
w=w./sum(w); 

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
%mengalikan seluruh kriteria bagi sebuah alternatif dengan bobot 
%sekalian di ubah yang tadi 0 menjadi -1 
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;

%tahapan ketiga proses perangkingan membagi seluruh s
V = S/sum(S);
%kemudian kita mencari index alternatif tertinggi
tinggi=max(V);
%menampilkan index alternatif tertinggi
alternatif=find(V == tinggi);
disp (" Real estate yang menjadi alternatif terbaik untuk investasi jangka panjang alternatif  "+ alternatif);
