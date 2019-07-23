
#Rscript libCheck.R > libCheck.log 2>&1

#library('tidyquant')
library('tibbletime')
library(DiagrammeR)
library('cowplot')
library('recipes')
library('rsample')
library('yardstick') 
library(knitr)
library(rmarkdown)
library(pander) #Nice Table ouput for Markdown
library('latex2exp')
library(reshape2)
library(GGally)
library(htmlwidgets)
library(devtools)
library('ggthemes')
library(formatR)
library(pracma) #Functions from numerical analysis and linear algebra 
library('moments')#Moments, cumulants, skewness, kurtosis and related tests
library(outliers)
library(RColorBrewer)
library(foreach)
library(doMC) # - Linux Parallel
#library(doSNOW) # Another Parallel Package
library(Kendall)
library(corrplot)
library(compare)
library(pracma)
library(e1071) #You would not know this but this is the SVM in R
library(caret)
library(glmnet)
library(ROCR)
library(scatterplot3d)
library(rgl)
library(tsne)
library(Rtsne)
library(neuralnet)
library(class)
library(rpart)  #Decision Tree Algorithm
library(randomForest)
library(gbm)
library(mlbench)
library(ggmap)
library(corrgram)
library(leaflet)
#library(doSNOW) #Windows Parallel
library(mixtools)
library(hexbin)
library(bnlearn) #Graphical Models
library(devtools)
library(rattle)		#tree plot
library(rpart.plot)				# Enhanced tree plots
library(party)				# Alternative decision tree algorithm
library(partykit)				# Convert rpart object to Binary
library(Matrix)
library(igraph)   #In addition to Arpack - this has an exensive collection of graph functionality
library(RcppEigen)
library(expm)
library(markovchain)
library(diagram)
library(sqldf)
library(data.table)
library(rjags)
library(runjags)
library(rstan)
library(shinystan)
library(rstanarm)
library(choroplethr) #Mapping
library(choroplethrMaps)
library(sf)
library(modeest) # MAP estimate for univariate data 
library(rethinking)
library(greta)
library(bayesplot)