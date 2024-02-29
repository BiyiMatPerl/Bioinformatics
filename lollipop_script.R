# setwd () set working directory.
getwd()
chooseCRANmirror(ind=1)
library(tidyverse)
install.packages("tidyverse")
install.packages("hrbrthemes")
library(hrbrthemes)
install.packages("kableExtra")
library(kableExtra)

install.packages("patchwork")
library(patchwork)
data_hgmd<- read.table("HGMD_TPO.txt", header=TRUE)
data_hgmd
head(data_hgmd)
col_one<-data_hgmd$Mutations
col_two<-data_hgmd$HGMD_Phenotype
col_three<-data_hgmd$Foldx_DDG
dim(data_hgmd)
col_one

data_hgmd %>%
	ggplot(aes(x=col_two, y=col_three))+
	geom_point(size=4, color="blue", aes(color=))+
	theme(aspect.ratio=0.4,
	panel.border = element_blank(),
      panel.grid = element_blank(),
      strip.background = element_rect(color = "white", fill = "white"),
	axis.text.x = element_text(angle = 90))+
	geom_segment(aes(xend=col_two, yend=0), size=1.2)+
	geom_label(aes(col_two, label=col_one), color="red", nudge_x=0.3, size=3)+
	labs(y="Folding Energy Change (kcal/mol)", x= "HGMD Phenotypes")+
      coord_flip()

ggsave("TPO_lollipop.jpg", dpi=600)
	
