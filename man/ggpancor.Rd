% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotting.R
\name{ggpancor}
\alias{ggpancor}
\title{pancor result plot}
\usage{
ggpancor(data, dot.szie = 6, dot.fill = "purple",
  dot.color = "black")
}
\arguments{
\item{data}{data return from pancor}

\item{dot.szie}{= 6,}

\item{dot.fill}{dot fill color, purple}

\item{dot.color}{outside color, black}
}
\value{
a ggplot object
}
\description{
pancor result plot
}
\examples{
data(pancancer_small)
df <- pancor(pancancer_small, "METTL3", "SETD2")
p <- ggpancor(df)
print(p)

}
\author{
Shipeng Guo, Zhougeng Xu
}
