#' caculate the correlatship ratio in pancancer
#'
#' @importFrom stats cor.test
#'
#' @param data  data.frame
#' @param gene1 charactor of gene name, e.g. "METTL3"
#' @param gene2 charactor of gene name, e.g. "SETD2"
#' @param cor.test.method cor.test method, one of
#' "pearson", "kendall", "spearman", default is "pearson"
#'
#' @examples
#' data(pancancer_small)
#' pancor(pancancer_small, "METTL3", "SETD2")
#'
#' @export
#'
#' @author Shipeng Guo, Zhougeng Xu
pancor <- function(data, gene1, gene2, cor.test.method = "pearson"){

  data1 <- split(data, data$type)

  df <- do.call(rbind,lapply(data1, function(x){
    dd  <- cor.test(as.numeric(x[,gene1]),
                    as.numeric(x[,gene2]),
                    method = cor.test.method)
    data.frame(type=x$type[1],cor=dd$estimate,p.value=dd$p.value )
  }))

  return(df)

}
