print("hello world") # this greetings as string
print(10+5) # this operational as sum
print(8-9-2020) # numerikal
print("8-9-2020")# date as string
a = 30 # as variable
print(a) #show a
print("a")
b = c(1:10) # save by vector for numerical jika berurutan
print(b)
c = c(2,5,7,9,11) #idem
print(c)
d = c("farich","al","dyan","syah") #save by vector for character
print(d)
summary(b) # descriptive analysis or representation of data
print(c[3]) # take data from index as accessor
print(d[4]) #idem
random <- list("farich", 21, "jakarta", 8) # data list
print(random)
print(b[3:9]) # take data from index 3 to 9
nilai <- list(statistika=89, fisika=90, bindo=88) #data list
print(nilai["fisika"]) 
nilai1 <- c(bindo=88, bing=90, mtk=95) #data vector
print(nilai["bindo"])

#build dataframe as tabular
PTN <- c("ITS","ITB","UI","UGM","IPB")
mahasiswa <- c(200, 250, 230, 160, 300)
lokasi <- c("surabaya","bandung","depok","jogja","bogor")
info <- data.frame(PTN,mahasiswa,lokasi)
print(info)
print(info$PTN) # take colom PTN from dataframe info
print(info$PTN[3]) # take UI from colom PTN 

# build a visualitazion
library(ggplot2)
gambar = ggplot(info, aes(x=PTN, y=mahasiswa, fill=PTN)) #make a plot
gambar = gambar + geom_bar(width=1, stat="identity") #make a histogram
print(gambar)
gambar = gambar + ggtitle("jumlah mahasiswa per PTN") #make title
gambar = gambar + xlab("nama PTN") #make word in sb.x
gambar = gambar +ylab("jumlah mahasiswa")
print(gambar)

# read file EXCEL
library(openxlsx)
data = read.xlsx("https://academy.dqlab.id/dataset/mahasiswa.xlsx",sheet = "Sheet 1")
print(data)
print(data$Fakultas)
print(data$Fakultas[2])
print(names(data)) #show name of column

gambar = ggplot(data, aes(x=ANGKATAN, y=JUMLAH, fill=ANGKATAN)) #make a plot
gambar = gambar + geom_bar(width=1, stat="identity") #make histogram
print(gambar)

data <- aggregate(x=data$JUMLAH, by=list(Kategori=data$Fakultas,angkatan=data$ANGKATAN), FUN=sum)
#make aggregate for JUMLAH from fakultas and angkatan, min contains 3 variable
data <- setNames(data, c("fakultas","tahun", "jumlah"))
#change name from column in aggregate
print(data)
str(data)
data$fakultas = as.factor(data$fakultas) #merubah data menjadi factor
str(data)
data= data[data$fakultas %in% c("Bisnis","ICT"),] # MEMFILTER DATA ICT DAN BISNIS PD KOLOM FAKULTAS
data = ggplot(data, aes(x=fakultas, y=jumlah, fill=fakultas)) + geom_bar(width=0.8, stat="identity", position = position_dodge(width=0.8)) + theme_classic()
data # membandingkan 2 data kategorik antar bisnis dan ICT

#missing value
print(NA) #tipe missing value yang atomik/ konstanta
print(typeof(NA))
x = 3 #banding nilai atomik
x==3 # membuktikan
x==6
x = NA # TIDAK BERLAKU UNTUK NA walupun termasuk atomik
x==NA
y = NA #untuk membandingkan dengan is.na
is.na(y)
a = c(1,3,5,NA)
length(a) #NA merupakan element
a = c(1,3,5, TRUE) #mengisi nilai missing value untuk 1 dgn TRUE
print(a)
b = c(2,4,6,8,FALSE) #mengisi nilai missing value untuk 0 dgn FALSE
print(b)
huruf = c("a","b",NA_character_) #mengisi missing value NA jika jenis data karakter
print(huruf)
angka = c(1,3,5,7, NA_integer_)#mengisi missing value NA jika jenis data integer
print(angka)
angka1 = c(1,3,5,7,8,9,NA)
lapply(angka1, typeof)
is.na(angka1)

#missing object/ undefined object (NULL)
isi <- c(1,2,3,NA, NULL) #NULL tidak kebaca pada tipe data vector
print(isi)
print(length(isi))
a = list("a",1,"c",9)
print(a[5]) #akan hasil NULL krn undefined object pd list
b = list(1, "c","f", 7, NA, NULL)#semua akan tercetak didalam list
print(b)

#infinite/ inf
5/0 #semua angka buakn 0 dibagi 0 akan inf

#not a number NAN, tipe data yg gbs diwakilkan oleh angka apapun
B = 0/0 #INI NaN
C = NA
log(-9)
is.nan(B) #KRN NAN TIPE DATA LOGICAL SAMA SEPERTI NA hanya dia gbs diwakilkan oleh angka apapun
is.na(B) #idem
is.na(C) #hasil true KRN NA tipe data logical  
is.nan(C) # HASIL FALSE KRN is.nan untuk OBJEK MISSING
isi.vector <- c(1,2,NA, 3, NaN) 
is.na(isi.vector) #cek missing value
sum(is.na(isi.vector))#jumlah missing value
list = list(1, NA, NaN, NULL, 5)
print(list)
sum(is.na(list)) #NULL GAMASUK MISSING VALUE

#FACTOR 
BULAN = factor(c("jan","feb","mar"))
print(BULAN)
attributes(BULAN)
as.integer(BULAN)#ingin liat index pada levels untuk isinya
levels(BULAN)[1] <- "januari" #ubah nama jan jadi januari UNTUK LEVELS
levels(BULAN)[2] <- "febuari"
levels(BULAN)[3] <- "maret"
print(BULAN)
umur = factor(c(12, 14, 8, 6))
print(umur) #angka udah otomatis terurut
aa = factor(c("a","b",NA, NaN, NULL))#OUTPUT MISSING HANYA NA & NaN
print(aa) #OUPUT LEVELS HANYA NaN
AB = factor(c(1,3,5,NA, NaN, NULL))
print(AB)
length(aa)
#menyusun levels dari awal
bulan = factor(c("feb","jan","mar","apr"), levels=c("jan","feb","mar","apr"))
print(bulan)
as.integer(bulan)
levels(bulan)[1] <- "januari"
levels(bulan)[2] <- "febuari"
levels(bulan)[3] <- "maret"
levels(bulan)[4] <- "april"
print(bulan)

#membaca dataset csv
penduduk <- read.csv("https://academy.dqlab.id/dataset/dkikepadatankelurahan2013.csv", sep=",",check.names=FALSE)
print(penduduk)
names(penduduk) #cek nama kolom
str(penduduk) #informasi pada kolom
summary(penduduk) #deskriptif analitik
names(penduduk)[1] <- "year" #merubah nama kolom tahun pada index 1 dgn year
names(penduduk)
penduduk <- penduduk[,!names(penduduk)%in% c("")]#filter yg bukan kolom kosong("")
names(penduduk)
perempuan <- grep(pattern="perempuan",x=names(penduduk),ignore.case=TRUE)#cari nama kolom yg mengandung kata peempuan
names(penduduk[perempuan])
penduduk$perempuan35keatas = rowSums(penduduk[grep(pattern="perempuan",x=names(penduduk),ignore.case=TRUE)])#menambahkan kolom baru 35keatas
print(penduduk$perempuan35keatas)
print(names(penduduk))
library(reshape2)
penduduk.tranform = melt(data=penduduk, id.vars=c("NAMA PROVINSI","NAMA KECAMATAN"),measure.vars=c("35-39 Perempuan","35-39 Laki-Laki"),variable.name="demografik",value.name="jumlah")
print(penduduk.tranform)

#SPLIT FIELD
split.kolom=penduduk.tranform[c("umur","jenis kelamin")] <- colsplit(penduduk.tranform$demografik, " ",c("umur","jenis kelamin"))
split.kolom
penduduk.tranform$demografik <- NULL #MENGHILANGKAN KOLOM DEMOGRAFIK
penduduk.tranform

#data konsumen
data_intro <- read.csv("https://academy.dqlab.id/dataset/data_intro.csv",sep=";") 
print(data_intro)
str(data_intro)
summary(data_intro)
data_intro$ID.Pelanggan <- as.character(data_intro$ID.Pelanggan) #rubah tipe data krn id tidak perlu dianalis
str(data_intro$ID.Pelanggan)
data_intro$Nama <- as.factor(data_intro$Nama)#teledor, nama dari awal udah factor
data_intro$Produk <- as.factor(data_intro$Produk)
str(data_intro$Nama)
str(data_intro$Produk)
library(pracma) #package untuk ukuran pemusatan data
median(data_intro$Harga)
mean(data_intro$Harga)
mode(data_intro$Produk)
max(data_intro$Pendapatan)-min(data_intro$Pendapatan) #range
var(data_intro$Pendapatan)#varians
sd(data_intro$Pendapatan)#std.deviasi
hist(data_intro$Pendapatan)#hist untuk integer
plot(data_intro$Jenis.Kelamin)#plot untuk factor
plot(data_intro$Pendapatan, data_intro$Total)#terlihat korelasi kuat positif
cor.test(data_intro$Pendapatan, data_intro$Total)#liat korelasi, terbukti korelasi kuat positif
t.test(data_intro$Pendapatan, data_intro$Total)#use t.test bcs antar numerik
table(data_intro$Produk, data_intro$Tingkat.Kepuasan) #lakukan tabulasi krn 22nya kategorik
data_intro$Tingkat.Kepuasan <- as.factor(data_intro$Tingkat.Kepuasan)
str(data_intro$Tingkat.Kepuasan)
str(data_intro$Produk)
chisq.test(data_intro$Produk, data_intro$Tingkat.Kepuasan)#uji chisqr krn antar kategorik
boxplot(Total~Jenis.Kelamin, data=data_intro)
t.test(Total~Jenis.Kelamin, data=data_intro)



