library(readr)
library(greed)
library(ggpubr)

set.seed(3141)

adj_df <- read.csv("adjacency_matrix_new.csv", header = TRUE, row.names = 1)
adj_matrix <- as.matrix(adj_df)

sol_sbm <- greed(adj_matrix, model = Sbm(type="directed"))
ICL(sol_sbm)
sol_dcsbm <- greed(adj_matrix, model = DcSbm(type="directed"))
ICL(sol_dcsbm)

bl_sbm = plot(sol_sbm,type='blocks')
bl_dcsbm = plot(sol_dcsbm,type='blocks')
plot(ggarrange(bl_sbm,bl_dcsbm))