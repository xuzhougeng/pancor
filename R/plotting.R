#' pancor result plot
#'
#' @import ggplot2
#'
#' @param data data return from pancor
#' @param dot.szie = 6,
#' @param dot.fill dot fill color, purple
#' @param dot.color outside color, black
#'
#' @examples
#' data(pancancer_small)
#' df <- pancor(pancancer_small, "METTL3", "SETD2")
#' ggpancor(df)
#'
#' @export
#' @author Shipeng Guo, Zhougeng Xu
ggpancor <- function(data,
                     dot.szie = 6, dot.fill = "purple", dot.color = "black"){

  p <- ggplot(data, aes(-log10(p.value), cor))+
    ## dot
    geom_point(size=dot.szie, fill= dot.fill ,
               shape = 21,
               colour = dot.color,
               stroke = 2)+
    ## y
    scale_y_continuous(expand = c(0,0),
                       limits = c(-1,1),
                       breaks = seq(-1,1,0.2))+
    ## x
    scale_x_log10(expand = c(0,0),
                  limits = c(0.1, 1000),
                  breaks = c(0.1,10,1000))+
    ## hline
    geom_hline(yintercept = 0, size=1.5)+
    ## vline
    geom_vline(xintercept = -log10(0.5),size=1.5)+
    ## labs
    labs(x=bquote(-log[10]~italic("P")),y="Pearson correlation (r)")+
    theme(axis.title=element_text(size=20),
          axis.text = element_text(face = "bold",size = 16),
          axis.ticks.length=unit(.4, "cm"),
          axis.ticks = element_line(colour = "black", size = 1),
          panel.background = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black"),
          panel.border = element_rect(colour = "black", fill=NA, size=1.5),
          plot.margin = margin(1, 1, 1, 1, "cm"))
  print(p)
  return(p)

}

#' correlationship between two gene in single or all cancer
#'
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 geom_smooth
#' @importFrom ggplot2 geom_rug
#' @importFrom ggplot2 theme_minimal
#' @importFrom ggplot2 xlab
#' @importFrom ggplot2 ylab
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 element_text
#' @importFrom ggplot2 margin
#'
#' @param data data.frame
#' @param gene1 charactor of gene name, e.g. "METTL3"
#' @param gene2 charactor of gene name, e.g. "SETD2"
#' @param type a kind of cancer, like BRCA, default is ALL
#' @param cor.test.method cor.test method, one of
#' "pearson", "kendall", "spearman", default is "pearsson"
#'
#' @examples
#' data(pancancer_small)
#' ggcorplot(pancancer_small, "METTL3","SETD2")
#' ggcorplot(pancancer_small, "METTL3","SETD2", "BRCA")
#'
#' @export
#' @author Shipeng Guo, Zhougeng Xu
ggcorplot <- function(data, gene1, gene2,
                      type="ALL",
                      cor.test.method = "pearson"){

  if(type=="ALL"){
    plot_df <- data[,c(gene1, gene2)]
  }else{
    plot_df <- data[data$type %in% type,c(gene1, gene2)]
  }

  names(plot_df) <- c("geneA","geneB")
  p <- ggplot(plot_df, aes(geneA,geneB))+
    geom_point(col="#984ea3")+
    geom_smooth(method = lm, se=T,na.rm=T,
                fullrange=T,
                size=2,col="#fdc086")+
    geom_rug(col="#7fc97f")+
    theme_minimal()+
    xlab(paste0("Expression of ", gene1, " (log2(TPM))"))+
    ylab(paste0("Expression of ", gene2, " (log2(TPM))"))+
    labs(title = paste0(corr_eqn(plot_df$geneA,
                                 plot_df$geneB,
                                 cor.test.method = cor.test.method)))+
    theme(plot.title = element_text(hjust = 0.5),
          plot.margin = margin(1, 1, 1, 1, "cm"))
  print(p)
  return(p)
}

corr_eqn <- function(x, y,
                     digits=2,
                     cor.test.method = "person") {

  test <- cor.test(x,y, method = cor.test.method)
  paste(paste0("n = ",length(x)),
        paste0("r = ",round(test$estimate,digits),'"(', cor.test.method,')"'),
        paste0("p.value= ",round(test$p.value,digits)),
        sep = ", ")
}
