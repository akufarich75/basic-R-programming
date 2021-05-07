A <- as.matrix(data.frame(c(9,12,8),c(-3,-4,-3),c(-4,-6,-3)))
A 
e = eigen(A)
e$values
e$vectors

B = as.matrix(data.frame(c(11.26,	9.41,	7.15,	3.38), 
c(9.41,	13.53,	7.38,	2.51),c(7.15,	7.38, 11.58,	2.62),
 c(3.38, 2.51, 2.62,	5.81)))
B
e = eigen(B)
e$values
e$vectors

b = c(-0.5773503, -0.5773503, -0.5773503)
b
length(b)

a = t(A)
a
e = eigen(a)
e$values
e$vectors

