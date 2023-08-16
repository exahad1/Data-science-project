# Load a dataset
ahad <- read.csv("D:/bodyfat.csv",header=TRUE,sep=",")




remove<-na.omit(ahad)



scaled_data <- scale(ahad)
k<-2




# Determine the optimal number of clusters using the elbow method
wss <- NULL
for (i in 1:10) {
  kmeans_fit <- kmeans(ahad, centers = i, nstart = 10)
  wss[i] <- kmeans_fit$tot.withinss
}
plot(1:10, wss, type = "b", xlab = "Number of clusters", ylab = "Within-cluster sum of squares")




#Perform k-means clustering with 3 clusters
kmeans_fit <- kmeans(ahad, centers = 3, nstart = 10)



# View the cluster assignments
kmeans_fit$cluster





kmeans_result<- kmeans(scaled_data,k)
fviz_cluster(kmeans_result,data=scaled_data)