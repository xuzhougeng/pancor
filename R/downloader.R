#' download exprSet data
#'
#' @importFrom utils download.file
#' @param file  one of pancancer_mRNA_exprSet.Rdata
#' panCCLE_mRNA_exprSet.Rdata  panGTEX_mRNA_exprSet.Rdata
#' @param outdir data store directory
#' @param url ftp url
#' @param user ftp user
#' @param password ftp password
#' @param dir ftp directory
#'
#' @return a .Rdata file in working directory
#'
#' @examples
#' temp_dir <- tempdir()
#' getExprSet(file = "test.txt", outdir = temp_dir)
#'
#' \donttest{
#' # According to CRAN, function cannot modify user's home filespace,
#' # so when run the example, the data will save at the tempdir.
#' # You can remove the `outdir = tempdir()` to let the .Rdata save to
#' # your current directory
#' getExprSet(file = "pancancer_mRNA_exprSet.Rdata", outdir = tempdir())
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

