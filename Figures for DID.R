install.packages("readxl")
library(readxl)
install.packages("ggplot2")
library(ggplot2)
install.packages("RColorBrewer")
library(RColorBrewer)
install.packages("scales")
library(scales)
install.packages("ggthemes")
install.packages("stringi")
library("ggthemes")




options(repr.plot.width = 4.5, repr.plot.height = 3)


excel_file1 <- "data.xlsx"
sheet_name1 <- "spatial DID"
data1 <- readxl::read_excel(excel_file1, sheet = sheet_name1)


color1 <- brewer.pal(3, name = "Set1")[1]
color2 <- brewer.pal(3, name = "Set1")[2]
color3 <- brewer.pal(3, name = "Set1")[3]


data1$area <- factor(data1$area, levels = c("In BA", "BA - 50mi", "50 - 100mi", "100 - 150mi"))
p1 <- ggplot(data1, aes(x = area, y = len, group = area, color = "Group")) + 
  geom_errorbar(aes(ymin = lci, ymax = rci), width = 0.1, position = position_dodge(width = 0.5)) + 
  geom_point(position = position_dodge(width = 0.5)) + 
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  labs(x = "Distance to burned area", y = "Housing price (%)") + 
  scale_color_manual(name = NULL, values = c(color2)) + 
  theme_classic() +
  theme(legend.title = element_text(size = 10, family = "Arial", color = "black"),
        axis.text = element_text(size = 10, family = "Arial", color = "black"),  
  coord_cartesian(ylim = c(-0.35, 0.1)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey")  


print(p1)


ggsave("【240115】eps/spatial DID2.eps", p1, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)







options(repr.plot.width = 4.5, repr.plot.height = 3)

excel_file2 <- "data.xlsx"
sheet_name2 <- "dynamic effect (3)"
data2 <- readxl::read_excel(excel_file2, sheet = sheet_name2)

data2$Period <- factor(data2$Period, levels = c("Post1", "Post2", "Post3"))

p2 <- ggplot(data2, aes(x = Period, y = len, group = area, color = factor(area, levels = c("In BA", "BA - 50mi")))) +
  geom_errorbar(aes(ymin = lci, ymax = rci), width = 0.2, position = position_dodge(width = 0.5)) + 
  geom_point(position = position_dodge(width = 0.5)) +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  labs(x = "Period", y = "Housing price (%)") +
  scale_color_brewer(palette = "Set1", breaks = c("In BA", "BA - 50mi")) +  
  theme_classic() +
  theme(legend.title = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"),  
        axis.title = element_text(size = 10, family = "Arial", color = "black")) +
  coord_cartesian(ylim = c(-0.4, 0.1)) +  
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey")

print(p2)

ggsave("【240115】eps/dynamic effect3.eps", p2, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)







options(repr.plot.width = 4.5, repr.plot.height = 3)
excel_file <- "data.xlsx"
sheet_name <- "Property value_bd"
data <- readxl::read_excel(excel_file, sheet = sheet_name)

data$Income <- factor(data$Income, levels = c("(0, 20)", "(20, 40)", "(40, 60)", "(60, 80)", "(80, 100)"))

p <- ggplot(data, aes(x = Income, y = len, ymin = lci, ymax = rci, color = Period)) +
  geom_point(position = position_dodge(0.5)) +  
  geom_errorbar(width = 0.5, position = position_dodge(0.5)) +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  labs(x = "Household income percenties", y = "Housing price (%)") +
  scale_color_brewer(palette = "Set1") +
  theme_classic() +
  theme(legend.title = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"),  
        axis.title = element_text(size = 10, family = "Arial", color = "black")) +
  coord_cartesian(ylim = c(-0.6, 0.05)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey") 

facet_grid(. ~ Income, scales = "free_x") +
  theme(axis.text.x.top = element_blank())

print(p)

ggsave("【240115】eps/housingpriceBD.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)







options(repr.plot.width = 4.5, repr.plot.height = 3)
excel_file <- "data.xlsx"
sheet_name <- "Property value_bd_50"
data <- readxl::read_excel(excel_file, sheet = sheet_name)

data$Income <- factor(data$Income, levels = c("(0, 20)", "(20, 40)", "(40, 60)", "(60, 80)", "(80, 100)"))

p <- ggplot(data, aes(x = Income, y = len, ymin = lci, ymax = rci, color = Period)) +
  geom_point(position = position_dodge(0.5)) + 
  geom_errorbar(width = 0.5, position = position_dodge(0.5)) +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  labs(x = "Household income percenties", y = "Housing price (%)") +
  scale_color_brewer(palette = "Set1") +
  theme_classic() +
  theme(legend.title = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"),  
        axis.title = element_text(size = 10, family = "Arial", color = "black")) +
  coord_cartesian(ylim = c(-0.05, 0.4)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey")


print(p)

ggsave("【240115】eps/housingpriceBD50.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)






## well-being (Inside the boundary)

options(repr.plot.width = 4.5, repr.plot.height = 3)
excel_file <- "data.xlsx"
sheet_name <- "well-being (2)"
data <- readxl::read_excel(excel_file, sheet = sheet_name)

data$Income <- factor(data$Income, levels = c("(0, 20)", "(20, 40)", "(40, 60)", "(60, 80)", "(80, 100)"))

p <- ggplot(data, aes(x = Income, y = Wb, ymin = lci2, ymax = rci2, color = Period)) +
  geom_point(position = position_dodge(0.5)) +
  geom_errorbar(width = 0.5, position = position_dodge(0.5)) +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  labs(x = "Household income percenties", y = "Well-being (%)") +
  scale_color_brewer(palette="Set1") +
  theme_classic() +
  theme(legend.title = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"),  
        axis.title = element_text(size = 10, family = "Arial", color = "black")) +
  coord_cartesian(ylim = c(-2.5, 0)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey") 


print(p)

ggsave("【240115】eps/wellbeingBD.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)






## well-being (Between the boundary and 50miles outward)

options(repr.plot.width = 4.5, repr.plot.height = 3)
excel_file <- "data.xlsx"
sheet_name <- "well-being (3)"
data <- readxl::read_excel(excel_file, sheet = sheet_name)

data$Income <- factor(data$Income, levels = c("(0, 20)", "(20, 40)", "(40, 60)", "(60, 80)", "(80, 100)"))

p <- ggplot(data, aes(x = Income, y = Wb, ymin = lci2, ymax = rci2, color = Period)) +
  geom_point(position = position_dodge(0.5)) +
  geom_errorbar(width = 0.5, position = position_dodge(0.5)) +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  labs(x = "Household income percenties", y = "Well-being (%)") +
  scale_color_brewer(palette="Set1") +
  theme_classic() +
  theme(legend.title = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"), 
        axis.title = element_text(size = 10, family = "Arial", color = "black")) +
  coord_cartesian(ylim = c(-0.2, 1.1)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey") 


print(p)

ggsave("【240115】eps/wellbeingBD50.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)







options(repr.plot.width = 5.5, repr.plot.height = 3)


excel_file1 <- "data.xlsx"
sheet_name1 <- "Parallel"
data1 <- readxl::read_excel(excel_file1, sheet = sheet_name1)


color1 <- brewer.pal(3, name = "Set1")[1]
color2 <- brewer.pal(3, name = "Set1")[2]
color3 <- brewer.pal(3, name = "Set1")[3]


data1$Period <- factor(data1$Period, levels = c("2 mth prior", "1 mth prior", "Current",
                                                "1 mth after", "2 mth after", "3 mth after"))
p1 <- ggplot(data1, aes(x = Period, y = len, group = Period)) + 
  geom_errorbar(aes(ymin = lci, ymax = rci), width = 0.1, position = position_dodge(width = 0.5)) + 
  geom_point(position = position_dodge(width = 0.5)) + 
  labs(x = "Month", y = "Coefficient of regression") + 
  scale_color_manual(name = NULL, values = c(color2)) +
  theme_classic() +
  theme(legend.title = element_text(size = 10, family = "Arial", color = "black"),
        axis.text = element_text(size = 10, family = "Arial", color = "black"), 
        axis.title = element_text(size = 10, family = "Arial", color = "black")) +
  coord_cartesian(ylim = c(-0.062, 0.03)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey")  


print(p1)


ggsave("【240115】eps/Parallel2.eps", p1, width = 5.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)







options(repr.plot.width = 4.5, repr.plot.height = 3)
excel_file <- "data.xlsx"
sheet_name <- "trading_bd"
data <- readxl::read_excel(excel_file, sheet = sheet_name)

data$Income <- factor(data$Income, levels = c("(0, 20)", "(20, 40)", "(40, 60)", "(60, 80)", "(80, 100)"))

p <- ggplot(data, aes(x = Income, y = trading, fill = Period)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Household income percenties", y = "Trading volume") +
  scale_fill_brewer(palette="Set1")+
  theme_classic() +
  theme(legend.title = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"), 
        axis.title = element_text(size = 10, family = "Arial", color = "black")) +
  coord_cartesian(ylim = c(0, 100))


print(p)

ggsave("【240115】eps/tradingBD.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)







options(repr.plot.width = 4.5, repr.plot.height = 3)
excel_file <- "data.xlsx"
sheet_name <- "trading_bd50"
data <- readxl::read_excel(excel_file, sheet = sheet_name)

data$Income <- factor(data$Income, levels = c("(0, 20)", "(20, 40)", "(40, 60)", "(60, 80)", "(80, 100)"))

p <- ggplot(data, aes(x = Income, y = trading, fill = Period)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Household income percenties", y = "Trading volume") +
  scale_fill_brewer(palette="Set1")+
  theme_classic() +
  theme(legend.title = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"), 
        axis.title = element_text(size = 10, family = "Arial", color = "black")) +
  coord_cartesian(ylim = c(0, 2200))


print(p)

ggsave("【240115】eps/tradingBD50.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)
