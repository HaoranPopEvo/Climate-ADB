library(ggplot2)
library(cowplot)

AMD <- read.csv("AMD.csv")
AMR <- read.csv("AMR.csv")

theme1 <- theme_bw()+
  theme(axis.text.x=element_text(size=16,angle=0,colour="black"),
        axis.text.y=element_text(size=16,angle=0,colour="black"),
        axis.title=element_text(size=18),
        axis.line=element_line(linetype=1,color="black",size=0.1),
        axis.ticks = element_line(colour="black"),
        panel.grid.major = element_blank(), #change the major and minor grid lines, 
        panel.grid.minor = element_blank(), #if want to change, check this parameters, I think it's easier to dao that
        #strip.background = element_rect(colour = "black",size = 0.8),
        #panel.background = element_rect(colour="black", fill="white"),
        #panel.border = element_blank(),
        panel.border = element_rect(colour = "black",fill=NA,size = 1.2),
        plot.title=element_text(size=14,angle=0,colour="black", face = "italic"),
        plot.tag=element_text(size=14,angle=0,colour="black", face = "bold"),
        plot.caption=element_text(size=14,angle=0,colour="black",face = "italic"),
        axis.title.y=element_text(vjust=1.9),
        axis.title.x=element_text(vjust=0.5),
        legend.text=element_text(colour="black",size=14),
        legend.background= element_rect(fill = "transparent", color = NA),
        #legend.position = "bottom",
        legend.title = element_text(colour="black", size=14,angle=0))

#Figure 2
plot_grid(
  ggplot(data = AMR, aes(x = T68max, y = AMR)) + xlab("T68max (°C)") + ylab("AMR (%/yr)") +
    geom_point() + geom_smooth(method = "loess") + theme1,
  ggplot(data = AMR, aes(x = P68, y = AMR)) + xlab("P68 (mm)") + ylab("AMR (%/yr)") +
    geom_point() + geom_smooth(method = "loess") + theme1 + 
    theme(axis.text.x = element_text(hjust = 0.8)),
  ggplot(data = AMR, aes(x = T35, y = AMR)) + xlab("T35 (°C)") + ylab("AMR (%/yr)") +
    geom_point() + geom_smooth(method = "loess") + theme1,
  ggplot(data = AMR, aes(x = P35, y = AMR)) + xlab("P35 (mm)") + ylab("AMR (%/yr)") +
    geom_point() + geom_smooth(method = "loess") + coord_cartesian(ylim = c(-2, 20)) + theme1
)

#Figure 3
plot_grid(
  ggplot(data = AMD, aes(x = T68max, y = AMD)) + xlab("T68max (°C)") + ylab("AMD (%/yr)") +
    geom_point() + geom_smooth(method = "loess") + ylim(0,20) + theme1,
  ggplot(data = AMD, aes(x = P68, y = AMD)) + xlab("P68 (mm)") + ylab("AMD (%/yr)") + 
    geom_point() + geom_smooth(method = "loess") + ylim(0,20)  + theme1 +
    theme(axis.text.x = element_text(hjust = 0.8)),
  ggplot(data = AMD, aes(x = T35, y = AMD)) + xlab("T35 (°C)") + ylab("AMD (%/yr)") + 
    geom_point() + geom_smooth(method = "loess") + ylim(0,20)  + theme1,
  ggplot(data = AMD, aes(x = P35, y = AMD)) + xlab("P35 (mm)") + ylab("AMD (%/yr)") +
    geom_point() + geom_smooth(method = "loess") + coord_cartesian(ylim = c(0, 20)) +theme1
)

#Supplementary Figure S1
plot_grid(
  ggplot(data = AMR, aes(x = T911, y = AMR)) + xlab("T911 (°C)") + ylab("AMR (%/yr)") + 
    geom_point() + geom_smooth(method = "loess") + coord_cartesian(ylim = c(0, 20)) + theme1,
  ggplot(data = AMR, aes(x = T122min, y = AMR)) + xlab("T122min (°C)") + ylab("AMR (%/yr)") +
    geom_point() + geom_smooth(method = "loess") + ylim(0,20)  + theme1 +
    theme(axis.text.x = element_text(hjust = 0.8)),
  ggplot(data = AMD, aes(x = T911, y = AMD)) + xlab("T911 (°C)") + ylab("AMD (%/yr)") + 
    geom_point() + geom_smooth(method = "loess") + ylim(0,20)  + theme1,
  ggplot(data = AMD, aes(x = T122min, y = AMD)) + xlab("T122min (°C)") + ylab("AMD (%/yr)") + 
    geom_point() + geom_smooth(method = "loess") + coord_cartesian(ylim = c(0, 20)) +theme1
)

#Supplementary Figure S2
age_legend <- get_legend(ggplot(data = AMR, aes(x = T68max, y = AMR, color = Age.Group)) + 
                           geom_point() + 
                           geom_smooth(method = "loess") + theme1 + 
                           scale_color_manual(values = c("young" = "red", "adult" = "blue")) + labs(color = "Age"))

plot_grid(
  plot_grid(
    ggplot(data = AMR, aes(x = T68max, y = AMR, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess") + theme1 + 
      theme(legend.position = "none") + xlab("T68max (°C)") + ylab("AMR (%/yr)") +
      scale_color_manual(values = c("young" = "red", "adult" = "blue")),
    ggplot(data = AMR, aes(x = P68, y = AMR, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess") + theme1 +
      theme(axis.text.y = element_text(vjust = 0.8))+
      theme(legend.position = "none") + xlab("P68 (mm)") + ylab("AMR (%/yr)") +
      theme(axis.text.x = element_text(hjust = 0.8)) +
      scale_color_manual(values = c("young" = "red", "adult" = "blue")),
    ggplot(data = AMR, aes(x = T35, y = AMR, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess") + theme1 +
      theme(legend.position = "none") + xlab("T35 (°C)") + ylab("AMR (%/yr)") +
      scale_color_manual(values = c("young" = "red", "adult" = "blue")),
    ggplot(data = AMR, aes(x = P35, y = AMR, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess") + coord_cartesian(ylim = c(-2, 20)) + theme1 +
      theme(legend.position = "none") + xlab("P35 (mm)") + ylab("AMR (%/yr)") +
      scale_color_manual(values = c("young" = "red", "adult" = "blue"))
  ),
  age_legend,
  ncol = 2,
  rel_widths = c(5, 1)
)


#Supplementary Figure S3
plot_grid(
  plot_grid(
    ggplot(data = AMD, aes(x = T68max, y = AMD, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess") + ylim(0,20) + theme1 +
      theme(legend.position = "none") + xlab("T68max (°C)") + ylab("AMD (%/yr)") +
      scale_color_manual(values = c("young" = "red", "adult" = "blue")),
    ggplot(data = AMD, aes(x = P68, y = AMD, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess") + ylim(0,20)  + theme1 +
      theme(legend.position = "none") + xlab("P68 (mm)") + ylab("AMD (%/yr)") +
      theme(axis.text.x = element_text(hjust = 0.8)) +
      scale_color_manual(values = c("young" = "red", "adult" = "blue")),
    ggplot(data = AMD, aes(x = T35, y = AMD, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess") + ylim(0,20)  + theme1 +
      theme(legend.position = "none") + xlab("T35 (°C)") + ylab("AMD (%/yr)") +
      scale_color_manual(values = c("young" = "red", "adult" = "blue")),
    ggplot(data = AMD, aes(x = P35, y = AMD, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess") + coord_cartesian(ylim = c(0, 20)) +theme1 +
      theme(legend.position = "none") + xlab("P35 (mm)") + ylab("AMD (%/yr)") +
      scale_color_manual(values = c("young" = "red", "adult" = "blue"))
  ),
  age_legend,
  ncol = 2,
  rel_widths = c(5, 1)
)

#Supplementary Figure S4
plot_grid(
  plot_grid(
    ggplot(data = AMR, aes(x = T911, y = AMR, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess")  + coord_cartesian(ylim = c(0, 25)) + theme1 +
      theme(legend.position = "none") + xlab("T911 (°C)") + ylab("AMR (%/yr)") +
      scale_color_manual(values = c("young" = "red", "adult" = "blue")),
    ggplot(data = AMR, aes(x = T122min, y = AMR, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess")  + coord_cartesian(ylim = c(0, 25)) + theme1 +
      theme(legend.position = "none") + xlab("T122min (°C)") + ylab("AMR (%/yr)") +
      theme(axis.text.x = element_text(hjust = 0.8)) +
      scale_color_manual(values = c("young" = "red", "adult" = "blue")),
    ggplot(data = AMD, aes(x = T911, y = AMD, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess")  + coord_cartesian(ylim = c(0, 25)) + theme1 +
      theme(legend.position = "none") + xlab("T911 (°C)") + ylab("AMD (%/yr)") +
      scale_color_manual(values = c("young" = "red", "adult" = "blue")),
    ggplot(data = AMD, aes(x = T122min, y = AMD, color = Age.Group)) + 
      geom_point() + geom_smooth(method = "loess")  + coord_cartesian(ylim = c(0, 25)) + theme1 +
      theme(legend.position = "none") + xlab("T122min (°C)") + ylab("AMD (%/yr)") +
      scale_color_manual(values = c("young" = "red", "adult" = "blue"))
  ),
  age_legend,
  ncol = 2,
  rel_widths = c(5, 1)
)