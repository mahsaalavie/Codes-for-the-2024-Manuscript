data = as.matrix(Finaldata)
express = matrix(as.numeric(data) , ncol = ncol(data))
Dist <- dist(express, method ="euclidean")
clusterobj <- hclust(Dist , method ="average")
nc <- 2
cluster <- cutree(clusterobj , nc)
stab <- matrix(0, nrow=ncol(express) , ncol =4)
colnames(stab)<- c("APN" , "AD" , "ADM" , "FOM")
for (del in 1:ncol(express)){
  matDel <- express[,-del]
  DistDel <- dist(matDel, method="euclidean")
  clusterobjDel <- hclust(DistDel , method = 'average')
  clusterDel <-cutree(clusterobjDel, nc)
  stab[del,] <- stability(express , Dist , del , cluster , clusterDel)
}
colMeans(stab)
plot(stab)
