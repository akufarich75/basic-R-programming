#data unsupervise learning
library(openxlsx)
data = read.xlsx("c://data//Data Baru Pesantren.xlsx")
head(data)
View(data)
str(data)
summary(data)

#create plot k-means
library(ggplot2)
library(factoextra)
library(tidyverse)
data = na.omit(data) #untuk menghilangkan data missing
summary(data)


column = c("JK","Umur","Jenis.Tinggal",
                "Penerima.KPS", "Penghasilan.Orangtua","Penerima.KIP",
                "Layak.PIP.(usulan.dari.sekolah)")
datafeed = data1 [, column]
str(datafeed)

#melihat jumlah kluster
fviz_nbclust(datafeed, kmeans, method = "silhouette") # metode silhouete
fviz_nbclust(datafeed, kmeans, method = "wss") # metode elbow


set.seed(100)
segmentasi = kmeans(x=data[c("JK","Umur","Jenis.Tinggal",
                             "Penerima.KPS", "Penghasilan.Orangtua","Penerima.KIP",
                             "Layak.PIP.(usulan.dari.sekolah)")], centers = 4, nstart = 5)
segmentasi

#melihat bagian klaster
segmentasi$cluster
segmentasi$withinss





