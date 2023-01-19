library(ggplot2)
suppressWarnings( library(dplyr))
library(reshape2)
library(RColorBrewer)


plotSection4Results <- function() {
  df <- read.csv("sect4-results.dat", header=T)
  
  p <- ggplot(df, aes(x=Layer, y=Performance, color=Subtask, group=Subtask)) +
        geom_line(size=1.5) +
        geom_point(size=4, fill="white", shape=21) +
        scale_color_brewer(palette="Set1", "") +
        facet_grid(. ~ Algorithm) +
        xlab("") + ylab("Average Per-Layer Performance") +
        theme(text=element_text(size=16, family="Times"),
              legend.position="bottom")
              
  print(p)
  
  ggsave("sect4-results.pdf", width=8, height=5)
}


plotSection2Results <- function() {
  df <- read.csv("sect2-results.dat", header=T)
  df$Subtask <- factor(df$Subtask, levels=c("LO", "TZ", "LO*TZ"), ordered=T)
  
  p <- ggplot(df, aes(x=Layer, y=Performance, color=Subtask, group=Subtask)) +
    geom_line(size=1.5) +
    geom_point(size=4, fill="white", shape=21) +
    scale_color_brewer(palette="Set1", name="") +
    scale_y_continuous(breaks=seq(from=0,to=16,by=4), labels=paste(seq(from=0,to=16,by=4))) +
    xlab("") + ylab("Subtask Performance") +
    theme(text=element_text(size=16, family="Times"),
          legend.position="bottom")
  
  print(p)
  
  ggsave("sect2-results.pdf", width=8, height=5)
}
