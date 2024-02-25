
install.packages("ggplot2")
install.packages("ggpubr")
library(ggplot2)
library(ggpubr)
library("ggthemes")


data <- read.csv("data.csv")


options(repr.plot.width = 4.5, repr.plot.height = 3)

data <- na.omit(data)
model <- lm(overvalue ~ FHSZ, data = data)

summary(model)

theme_void()
p <- ggplot(data, aes(x = FHSZ, y = overvalue)) +
  geom_smooth(method = "lm", se = TRUE, color = "black", fill = "grey", alpha = 1, size = 0.5) +
  labs(x = "FHSZ", y = "Housing price (%)") +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  annotate("text", x = mean(data$FHSZ + 0.1, na.rm = TRUE), y = mean(data$overvalue - 0.0035, na.rm = TRUE), 
           label = paste("Sample mean:", round(mean(data$FHSZ, na.rm = TRUE), 2)), 
           vjust = 1, hjust = 0, color = "black",
           family = "Arial", size = 4) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey", size = 0.2) +
  geom_vline(xintercept = mean(data$FHSZ), linetype = "dashed", color = "black", size = 0.2) +
  theme_classic() +
  theme(axis.text = element_text(size = 10, family = "Arial", color = "black"), 
        axis.title = element_text(size = 10, family = "Arial", color = "black"))

print(p)

ggsave("【240115】eps/driving-FHSZ.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)







install.packages("mgcv")
library(mgcv)
install.packages("nlme")
library(nlime)


options(repr.plot.width = 4.5, repr.plot.height = 3)
data <- na.omit(data)
gam_model3 <- mgcv::gam(overvalue ~ s(hospital), data = data, method = "REML")

summary(gam_model3)

theme_void()
p <- ggplot(data, aes(x = hospital, y = overvalue)) +
  geom_smooth(method = "gam", formula = y ~ s(x),
              method.args = list(family = gaussian), se = TRUE, color = "black", fill = "grey", alpha = 1, size = 0.5) +
  labs(x = "Distance to nearest hospital (mi)", y = "Housing price (%)") +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  annotate("text", x = mean(data$hospital + 0.005, na.rm = TRUE), y = mean(data$overvalue - 0.03, na.rm = TRUE), 
           label = paste("Sample mean:", round(mean(data$hospital, na.rm = TRUE), 2)), 
           vjust = 1, hjust = 0, color = "black",
           family = "Arial", size = 3.5) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey", size = 0.2) +
  geom_vline(xintercept = mean(data$hospital), linetype = "dashed", color = "black", size = 0.2) +
  theme_classic() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"),  
        axis.title = element_text(size = 10, family = "Arial", color = "black"))

print(p)

ggsave("【240115】eps/driving-hospital.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)


options(repr.plot.width = 4.5, repr.plot.height = 3)
data <- na.omit(data)


ggplot(data, aes(y = hospital)) +
  geom_boxplot() +
  theme_minimal()

Q1 <- quantile(data$hospital, 0.25, na.rm = TRUE)
Q3 <- quantile(data$hospital, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

data <- data[data$hospital >= lower_bound & data$hospital <= upper_bound, ]


gam_model3 <- mgcv::gam(overvalue ~ s(hospital), data = data, method = "REML")

summary(gam_model3)

theme_void()
p <- ggplot(data, aes(x = hospital, y = overvalue)) +
  geom_smooth(method = "gam", formula = y ~ s(x),
              method.args = list(family = gaussian), se = TRUE, color = "black", fill = "grey", alpha = 1, size = 0.5) +
  labs(x = "Distance to nearest hospital (mi)", y = "Housing price (%)") +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  annotate("text", x = mean(data$hospital + 0.005, na.rm = TRUE), y = mean(data$overvalue - 0.03, na.rm = TRUE), 
           label = paste("Sample mean:", round(mean(data$hospital, na.rm = TRUE), 2)), 
           vjust = 1, hjust = 0, color = "black",
           family = "Arial", size = 3.5) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey", size = 0.2) +
  geom_vline(xintercept = mean(data$hospital), linetype = "dashed", color = "black", size = 0.2) +
  theme_classic() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"),  
        axis.title = element_text(size = 10, family = "Arial", color = "black"))

print(p)

ggsave("【240115】eps/driving-hospital.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)



data <- read.csv("data.csv")



options(repr.plot.width = 4.5, repr.plot.height = 3)
data <- na.omit(data)


ggplot(data, aes(y = firestation)) +
  geom_boxplot() +
  theme_minimal()

Q1 <- quantile(data$firestation, 0.25, na.rm = TRUE)
Q3 <- quantile(data$firestation, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

data <- data[data$firestation >= lower_bound & data$firestation <= upper_bound, ]

gam_model4 <- mgcv::gam(overvalue ~ s(firestation), data = data, method = "REML")

summary(gam_model4)

theme_void()
p <- ggplot(data, aes(x = firestation, y = overvalue)) +
  geom_smooth(method = "gam", formula = y ~ s(x),
              method.args = list(family = gaussian), se = TRUE, color = "black", fill = "grey", alpha = 1, size = 0.5) +
  labs(x = "Distance to nearest firestation (mi)", y = "Housing price (%)") +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) +
  annotate("text", x = mean(data$firestation + 0.005, na.rm = TRUE), y = mean(data$overvalue - 0.01, na.rm = TRUE), 
           label = paste("Sample mean:", round(mean(data$firestation, na.rm = TRUE), 2)), 
           vjust = 1, hjust = 0, color = "black",
           family = "Arial", size = 3.5) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey", size = 0.2) +
  geom_vline(xintercept = mean(data$firestation), linetype = "dashed", color = "black", size = 0.2) +
  theme_classic() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"),  
        axis.title = element_text(size = 10, family = "Arial", color = "black"))

print(p)

ggsave("【240115】eps/driving-firestation.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)







data <- read.csv("Lacking plu.csv")


options(repr.plot.width = 4.5, repr.plot.height = 3)

data <- na.omit(data)
gam_model2 <- mgcv::gam(overvalue ~ s(Lackingplu2), data = data, method = "REML")

summary(gam_model2)

theme_void()
p <- ggplot(data, aes(x = Lackingplu2, y = overvalue)) +
  geom_smooth(method = "gam", formula = y ~ s(x),
              method.args = list(family = gaussian), se = TRUE, color = "black", fill = "grey", alpha = 1, size = 0.5) +
  labs(x = "Lacking plumbing (%)", y = "Housing price (%)") +
  scale_y_continuous(labels = function(x) paste0(x * 100, "%")) + 
  annotate("text", x = mean(data$Lackingplu2 + 0.1, na.rm = TRUE), y = mean(data$overvalue + 0.05, na.rm = TRUE), 
           label = paste("Sample mean:", round(mean(data$Lackingplu2, na.rm = TRUE), 2)), 
           vjust = 1, hjust = 0, color = "black",
           family = "Arial", size = 3.5) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "grey", size = 0.2) +
  geom_vline(xintercept = mean(data$Lackingplu2), linetype = "dashed", color = "black", size = 0.2) +
  theme_classic() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text = element_text(size = 10, family = "Arial", color = "black"),  
        axis.title = element_text(size = 10, family = "Arial", color = "black"))

print(p)

ggsave("【240115】eps/driving-plumbing.eps", p, width = 4.5, height = 3, device = "eps")

options(repr.plot.width = NULL, repr.plot.height = NULL)






