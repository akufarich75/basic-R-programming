library(ggplot2) #dasar visualisasi
gambar = ggplot()+labs(title="nilai judul",x="sb.x",y="sb.y")
print(gambar)

#visualisasi use data penduduk shape = point
data = read.csv("https://academy.dqlab.id/dataset/dkikepadatankelurahan2013.csv", sep=",")
names(data)
plot.dki = ggplot(data=data, aes(x=LUAS.WILAYAH..KM2.,y=KEPADATAN..JIWA.KM2.,color=NAMA.KABUPATEN.KOTA))
gambar = plot.dki + geom_point()+ theme(plot.title=element_text(hjust=0.5))+labs(title="persebaran penduduk",x="kepadatan jiwa/ km2",y="luas wilayah/km2", color="red")
gambar = gambar + facet_wrap(~NAMA.KABUPATEN.KOTA, ncol=3)#membagi kolom per kota dri scatterplot
print(gambar)

#visualisai use data penduduk dki shape=histogram
str(data)
plot.dki1 = ggplot(data=data, aes(x=KEPADATAN..JIWA.KM2.,color=NAMA.KABUPATEN.KOTA))
gambar1 = plot.dki1 + geom_histogram(binwidth=1000)#buat histogram
gambar1

#visualisai use data penduduk dki shape=line chart
inflasi_IndSng=read.csv("https://academy.dqlab.id/dataset/inflasi.csv",sep=",")
inflasi_IndSng
names(inflasi_IndSng)
str(inflasi_IndSng)
inflasi_IndSng$Bulan = factor(inflasi_IndSng$Bulan, levels=c("Jan-2017","Feb-2017","Apr-2017","May-2017","Jun-2017","Jul-2017","Aug-2017","Sep-201","Oct-2017"))
gambar1 = ggplot(data=inflasi_IndSng, aes(x=Bulan, y=Inflasi, color=Negara,group=Negara))
gambar1 = gambar1 + geom_line()+geom_text(aes(label=Inflasi),hjust=-0.2,vjust=-0.5)
gambar1

#barchart
data = read.csv("https://academy.dqlab.id/dataset/datakependudukandki-dqlab.csv",sep=",")
names(data)
gambar2 = ggplot(data=data, aes(x=NAMA.KABUPATEN.KOTA, y=JUMLAH, fill=NAMA.KABUPATEN.KOTA))
gambar2 = gambar2 + geom_bar(stat="identity")
gambar2

#barchart bersisian
gambar3 = ggplot(data=data, aes(x=JENIS.KELAMIN, y=JUMLAH, fill=JENIS.KELAMIN))
gambar3 = gambar3 + geom_bar(stat="identity",position="dodge")
gambar3
data$JUMLAH
data = aggregate(x=data$JUMLAH, by=list(kabupaten=data$NAMA.KABUPATEN.KOTA, jenis_kelamin=data$JENIS.KELAMIN),FUN=sum)
data1 = setNames(data, c("kabupaten","jenis_kelamin","jumlah"))
data1
gambar3 = ggplot(data=data, aes(x=kabupaten, y=jumlah, fill=jenis_kelamin,label=jumlah))
gambar3 = gambar3 + geom_bar(stat="identity",position="dodge")
gambar3 = gambar3 + labs(title="pesebaran penduduk",x="kota",y="jumlah penduduk")
gambar3 = gambar3 + theme(axis.text.x=element_text(angle=45, vjust=0.5), plot.title=element_text(hjust=0.5))
gambar3 = gambar3 + geom_text(position=position_dodge(1.5))
gambar3

