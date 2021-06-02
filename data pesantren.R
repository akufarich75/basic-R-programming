##data klasifikasi decision tree
library(openxlsx)
data1 = read.xlsx("c://data//data klasifikasi.xlsx")
head(data1)#melihat 6 data teratas
View(data1)#melihat data secara keseluruhan

str(data1)#melihat kondisi data (jenis data, jumlah, dan status)
summary(data1)#melihat statistika deskriptif

pairs(data1[,c(3:10)])#melihat sebaran data
cor(data1[,c(3:10)])#melihat korelasi data
library(ggplot2)
colSums(sapply(data1, is.na))#cek missing value


plot(data1$Umur, data1$Umur)#untuk melihat arah korelasi(hubungan antar numerik dengan plot
cor.test(data1$Umur, data1$Umur)#uji korelasi

table(data1$JK, data1$Layak.Bantuan)#melakukan tabulasi karena keduanya kategorik
chisq.test(table(data1$JK, data1$Layak.Bantuan))#uji square

boxplot(Umur~JK, data=data1)#sebelum menguji data numerik dengan kategorik lakukan boxplot
t.test(Umur~JK, data=data1)#uji t

data1$Jenis.Tinggal = as.factor(data1$Jenis.Tinggal)
data1$Penerima.KPS = as.factor(data1$Penerima.KPS)
data1$Penghasilan.Orangtua = as.factor(data1$Penghasilan.Orangtua)
data1$Penerima.KIP = as.factor(data1$Penerima.KIP)
data1$Layak.Bantuan = as.factor(data1$Layak.Bantuan)
str(data1)

#cara pertama
drop_column = c("No", "Nama","Layak.Bantuan")
datafeed = data1[, !(names(data1) %in% drop_column)]
library("C50")
model = C5.0(datafeed, as.factor(data1$Layak.Bantuan))
summary(model)
plot(model)


#cara kedua
column = c("JK","Umur","Jenis.Tinggal",
                "Penerima.KPS", "Penghasilan.Orangtua","Penerima.KIP",
                "Layak.PIP.(usulan.dari.sekolah)")
datafeed = data1 [, column]
str(datafeed)
data1$Layak.Bantuan = as.factor(data1$Layak.Bantuan)#merubah tipe data menjadi factor
set.seed(100)
sample_train = sample(62, 43)# set jumlah training data
input_training = datafeed[sample_train, ]
class_training = data1[sample_train, ]$Layak.Bantuan
input_test = datafeed[-sample_train,]

str(input_training)
str(input_test)
str(class_training)

library("C50")
pred = C5.0(input_training, class_training)
summary(pred)
plot(pred)
model = C5.0 (datafeed, as.factor(data1$Layak.Bantuan))
summary(model)
plot(model)

