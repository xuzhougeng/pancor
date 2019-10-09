#' download exprSet data
#'
#' @param file  one of pancancer_mRNA_exprSet.Rdata
#' panCCLE_mRNA_exprSet.Rdata  panGTEX_mRNA_exprSet.Rdata
#' @param url ftp url
#' @param user ftp user
#' @param password ftp password
#' @param dir ftp directory
#'
#' @examples
#' temp_dir <- tempdir()
#' getExprSet(file = "welcome.txt", dir = temp_dir)
#'
#' \dontrun{
#' getExprSet(file = "pancancer_mRNA_exprSet.Rdata")
#' }
#'
#' @export
#' @author Zhougeng Xu
getExprSet <- function(file = "", outdir = ".", dir = "pub",
                     url = NULL,
                     user = NULL,
                     password = NULL){
  if ( ! file %in% c("pancancer_mRNA_exprSet.Rdata",
                        "panCCLE_mRNA_exprSet.Rdata",
                        "panGTEX_mRNA_exprSet.Rdata",
                        "test.txt") ){
    stop("file is not existed in server")

  }

  if (is.null(url)){
    url <- "119.29.67.25"
  }

  if (is.null(user)){
    file_url <- sprintf("ftp://%s/%s/%s", url, dir, file)
  } else{
    file_url <- sprintf("ftp://%s::%s@%s/%s/%s",
                        user, password, url, dir, file)
  }

  download.file(file_url, file.path(outdir,file))
}

