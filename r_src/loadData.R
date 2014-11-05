library(igraph)

dat <- read.csv(file.choose(), header=F)
el <- as.matrix(dat)
el[,1] <- as.character(el[,1])
el[,2] <- as.character(el[,2])
g <- graph.edgelist(el, directed=T)

elP <- el[1:3000,]
gP <- graph.edgelist(elP, directed=T)

hist(log(degree(gP)+1), col='lightblue', xlab="Vertex Degree", ylab="Freqyency", main="Graph Degree Distribution")

for (i in 1:length(V(gP))){
  if(V(gP)[i]$name %in% elP[,1]){
    V(gP)[i]$type <- FALSE
  }
  if(V(gP)[i]$name %in% elP[,2]){
    V(gP)[i]$type <- TRUE
  }
}

for (i in 1:length(V(g))){
  if(V(g)[i]$name %in% el[,1]){
    V(g)[i]$type <- FALSE
  }
  if(V(g)[i]$name %in% el[,2]){
    V(g)[i]$type <- TRUE
  }
}

bP <- bipartite.projection(gP)

plot(gP, vertex.size=3, vertex.label=NA, edge.arrow.size=0.1)
hist(degree(bP$proj1), col='lightblue', xlab="Vertex Degree", ylab="Freqyency", main="Projection Graph Degree Distribution")

library(network)
library(sna)

A <- get.adjacency(bP$proj1, sparse=FALSE)
bPc <- network::as.network.matrix(A)
sna::gplot.target(bPc, betweenness(bPc), main="Betweenness", circ.lab = FALSE, circ.col="skyblue", usearrows = FALSE, vertex.col=c("blue", rep("red", 32), "yellow"), edge.col="darkgray")

sna::gplot.target(bP$proj1, transitivity(bP$proj1), main="Betweenness", circ.lab = FALSE, circ.col="skyblue", usearrows = FALSE, vertex.col=c("blue", rep("red", 32), "yellow"), edge.col="darkgray")

len <- ecount(gP)
deg <- log(degree(gP)+1)
maxd <- ceiling(max(deg))
l <- get.edgelist(gP)
output <- matrix(0, maxd, maxd)
for (i in 1:len){
  v1 <- l[i,1]
  v2 <- l[i,2]
  d1 <- round(deg[v1])
  d2 <- round(deg[v2])
  
  output[d1, d2] <- .5 + output[d1,d2]
  output[d2, d1] <- .5 + output[d2,d1]
}
heatmap(output, Rowv = NA, Colv = NA, scale = "column", main = "Joint Degree Distribution")

edges <- igraph.sample(1, length(E(gP)), length(E(gP))*.5)
ge <- subgraph.edges(gP, edges)
plot(ge, vertex.size=3, vertex.label=NA, edge.arrow.size=0.1)

for (i in 1:length(V(ge))){
   if(V(ge)[i]$name %in% elP[,1]){
         V(ge)[i]$type <- FALSE
   }
   if(V(ge)[i]$name %in% elP[,2]){
         V(ge)[i]$type <- TRUE
   }
}
bPe <- bipartite.projection(ge)
plot(bpe$proj1, vertex.size=3, vertex.label=NA, edge.arrow.size=0.1)

library(network)
library(sna)

A <- get.adjacency(bPe$proj1, sparse=FALSE)
bPc <- network::as.network.matrix(A)
sna::gplot.target(bPc, betweenness(bPc), main="Edge Based Betweenness", circ.lab = FALSE, circ.col="skyblue", usearrows = FALSE, vertex.col=c("blue", rep("red", 32), "yellow"), edge.col="darkgray")

hist(transitivity(bPv$proj1, "local"), col='lightblue', xlab="Clustering Coefficient", ylab="Freqyency", main="Edge Based Clustering Coefficient")

verts <- igraph.sample(1, length(V(gP)), length(V(gP))*.5)
gv <- induced.subgraph(gP, verts)
plot(gv, vertex.size=3, vertex.label=NA, edge.arrow.size=0.1, main="Vertex Based Graph")

for (i in 1:length(V(gv))){
  if(V(gv)[i]$name %in% elP[,1]){
    V(gv)[i]$type <- FALSE
  }
  if(V(gv)[i]$name %in% elP[,2]){
    V(gv)[i]$type <- TRUE
  }
}
bPv <- bipartite.projection(gv)
plot(bPv$proj1, vertex.size=3, vertex.label=NA, edge.arrow.size=0.1, main="Vertex Based Projection")

library(network)
library(sna)

A <- get.adjacency(bPv$proj1, sparse=FALSE)
bPc <- network::as.network.matrix(A)
sna::gplot.target(bPc, betweenness(bPc), main="Vertex Based Betweenness", circ.lab = FALSE, circ.col="skyblue", usearrows = FALSE, vertex.col=c("blue", rep("red", 32), "yellow"), edge.col="darkgray")

hist(transitivity(bPv$proj1, "local"), col='lightblue', xlab="Clustering Coefficient", ylab="Freqyency", main="Vertex Based Clustering Coefficient")