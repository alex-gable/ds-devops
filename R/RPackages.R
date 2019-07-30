local({r <- getOption("repos") r["CRAN"] <- "http://cran.r-project.org"  options(repos=r)})

if(!require(devtools)){install.packages( "devtools" ) }
devtools::install_github("r-dbi/odbc")

if(!require(base64enc)){install.packages( "base64enc" ) }
if(!require(profvis)){install.packages( "profvis" ) }
if(!require(profmem)){install.packages( "profmem" ) }
if(!require(MASS)){install.packages( "MASS" ) }
if(!require(car)){install.packages( "car" ) }
if(!require(plyr)){install.packages( "plyr" ) }
if(!require(xtable)){install.packages( "xtable" ) }
if(!require(ggplot2)){install.packages( "ggplot2" ) }
if(!require(dplyr)){install.packages( "dplyr" ) }
if(!require(tidyr)){install.packages( "tidyr" ) }
if(!require(readr)){install.packages( "readr" ) }
if(!require(purrr)){install.packages( "purrr" ) }
if(!require(tibble)){install.packages( "tibble" ) }
if(!require(stringr)){install.packages( "stringr" ) }
if(!require(forcats)){install.packages( "forcats" ) }
if(!require(glue)){install.packages( "glue" ) }
if(!require(forcats)){install.packages( "forcats" ) }
if(!require(timetk)){install.packages( "timetk" ) }
if(!require(tidyquant)){install.packages( "tidyquant" ) }
if(!require(tibbletime)){install.packages( "tibbletime" ) }
if(!require(styler)){install.packages( "styler" ) }
if(!require(DiagrammeR)){install.packages( "DiagrammeR" ) }
if(!require(cowplot)){install.packages( "cowplot" ) }
if(!require(recipes)){install.packages( "recipes" ) }
if(!require(rsample)){install.packages( "rsample" ) }
if(!require(yardstick)){install.packages( "yardstick" ) }
if(!require(knitr)){install.packages( "knitr" ) }
if(!require(rmarkdown)){install.packages( "rmarkdown" ) }
if(!require(pander)){install.packages( "pander" ) }
if(!require(latex2exp)){install.packages( "latex2exp" ) }
if(!require(reshape2)){install.packages( "reshape2" ) }
if(!require(GGally)){install.packages( "GGally" ) }
if(!require(htmlwidgets)){install.packages( "htmlwidgets" ) }
if(!require(devtools)){install.packages( "devtools" ) }
if(!require(ggthemes, dependencies = TRUE)){install.packages( "ggthemes" ) }
if(!require(formatR)){install.packages( "formatR" ) }
if(!require(pracma)){install.packages( "pracma" ) }
if(!require(moments)){install.packages( "moments" ) }
if(!require(outliers)){install.packages( "outliers" ) }
if(!require(RColorBrewer)){install.packages( "RColorBrewer" ) }
if(!require(foreach)){install.packages( "foreach" ) }
if(!require(doMC)){install.packages( "doMC" ) }
if(!require(Kendall)){install.packages( "Kendall" ) }
if(!require(corrplot)){install.packages( "corrplot" ) }
if(!require(compare)){install.packages( "compare" ) }
if(!require(pracma)){install.packages( "pracma" ) }
if(!require(e1071)){install.packages( "e1071" ) }
if(!require(caret)){install.packages( "caret" ) }
if(!require(glmnet)){install.packages( "glmnet" ) }
if(!require(ROCR)){install.packages( "ROCR" ) }
if(!require(scatterplot3d)){install.packages( "scatterplot3d" ) }
if(!require(tsne)){install.packages( "tsne" ) }
if(!require(Rtsne)){install.packages( "Rtsne" ) }
if(!require(neuralnet)){install.packages( "neuralnet" ) }
if(!require(class)){install.packages( "class" ) }
if(!require(rpart)){install.packages( "rpart" ) }
if(!require(rattle)){install.packages( "rattle" ) }
if(!require(rpart.plot)){install.packages( "rpart.plot" ) }
if(!require(party)){install.packages( "party" ) }
if(!require(partykit)){install.packages( "partykit" ) }
if(!require(randomForest)){install.packages( "randomForest" ) }
if(!require(gbm)){install.packages( "gbm" ) }
if(!require(mlbench)){install.packages( "mlbench" ) }
if(!require(ggmap)){install.packages( "ggmap" ) }
if(!require(corrgram)){install.packages( "corrgram" ) }
if(!require(leaflet)){install.packages( "leaflet" ) }
if(!require(mixtools)){install.packages( "mixtools" ) }
if(!require(hexbin)){install.packages( "hexbin" ) }
if(!require(bnlearn)){install.packages( "bnlearn" ) }
if(!require(Matrix)){install.packages( "Matrix" ) }
if(!require(igraph)){install.packages( "igraph" ) }
if(!require(RcppEigen)){install.packages( "RcppEigen" ) }
if(!require(expm)){install.packages( "expm" ) }
if(!require(markovchain)){install.packages( "markovchain" ) }
if(!require(diagram)){install.packages( "diagram" ) }
if(!require(sqldf)){install.packages( "sqldf" ) }
if(!require(data.table)){install.packages( "data.table" ) }
if(!require(rjags)){install.packages( "rjags" ) }
if(!require(runjags)){install.packages( "runjags" ) }
if(!require(rstan)){install.packages( "rstan" ) }
if(!require(shinystan)){install.packages( "shinystan" ) }
if(!require(rstanarm)){install.packages( "rstanarm" ) }
if(!require(choroplethr)){install.packages( "choroplethr" ) }
if(!require(choroplethrMaps)){install.packages( "choroplethrMaps" ) }
if(!require(sf)){install.packages( "sf" ) }
if(!require(modeest)){install.packages( "modeest" ) }
if(!require(FedData)){install.packages( "FedData" ) }
if(!require(rethinking)){install.packages( "rethinking" ) }
if(!require(greta)){install.packages( "greta" ) }
if(!require(bayesplot)){install.packages( "bayesplot" ) }
if(!require(bayesm)){install.packages( "bayesm" ) }
if(!require(fractal)){install.packages( "fractal" ) }
if(!require(fractaldim)){install.packages( "fractaldim" ) }
if(!require(Rwave)){install.packages( "Rwave" ) }
if(!require(ifultools)){install.packages( "ifultools" ) }
if(!require(wmtsa)){install.packages( "wmtsa" ) }
if(!require(xml2)){install.packages( "xml2" ) }
if(!require(aws.s3)){install.packages( "aws.s3" ) }
if(!require(cluster)){install.packages( "cluster" ) }
if(!require(anocva)){install.packages( "anocva" ) }
if(!require(formula.tools)){install.packages( "formula.tools" ) }
if(!require(leaps)){install.packages( "leaps" ) }
if(!require(stargazer)){install.packages( "stargazer" ) }
if(!require(xgboost)){install.packages( "xgboost" ) }
if(!require(Ckmeans.1d.dp)){install.packages( "Ckmeans.1d.dp" ) }
if(!require(lme4)){install.packages( "lme4" ) }
if(!require(pscl)){install.packages( "pscl" ) }
if(!require(ggmcmc)){install.packages( "ggmcmc" ) }
if(!require(brms)){install.packages( "brms" ) }
if(!require(maptools)){install.packages( "maptools" ) }
if(!require(spdep)){install.packages( "spdep" ) }
if(!require(rgdal)){install.packages( "rgdal" ) }
if(!require(reshape2)){install.packages( "reshape2" ) }
if(!require(papeR)){install.packages( "papeR" ) }
if(!require(rARPACK)){install.packages( "rARPACK" ) }
if(!require(stargaze)){install.packages( "stargaze" ) }
if(!require(roxygen)){install.packages( "roxygen" ) }
if(!require(roxygen2)){install.packages( "roxygen2" ) }
if(!require(fs)){install.packages( "fs" ) }
if(!require(tidygraph)){install.packages( "tidygraph" ) }
if(!require(usethis)){install.packages( "usethis" ) }
if(!require(pkgdown)){install.packages( "pkgdown" ) }

install.packages("revealjs", type = "source")
install.packages("INLA", repos=c(getOption("repos"), INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)

#Rwave dependency viewer.  Really helpful for R development
install.packages("Rwave")
library(Rwave)
devtools::install_github("datastorm-open/DependenciesGraphs")
#library(DependenciesGraphs)
# Prepare data
# dep <- envirDependencies("package:Rwave")
# # visualization
# plot(dep)

# #OR - run the shiny app interactively
# launch.app()

#List all user installed packages
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
print(ip, row.names=FALSE)
