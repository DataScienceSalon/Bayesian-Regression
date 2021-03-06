% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualization.R
\name{groupBarPlot}
\alias{groupBarPlot}
\title{groupBarPlot}
\usage{
groupBarPlot(data, plotTitle = NULL, values = FALSE)
}
\arguments{
\item{data}{Data frame containing 4 columns: The group parameter; the 
subgoup variable; the mean value, and the length of the confidence interval.}

\item{plotTitle}{Capital case character string for the title of the plot}

\item{values}{Logical. If true, values will be rendered on bar plots}
}
\value{
Grouped bar plot with confidence / credible interval lines.
}
\description{
\code{groupBarPlot} Renders a grouped bar plot with confidence interval bars.
}
\seealso{
Other visualization functions: \code{\link{pieChart}},
  \code{\link{plotBar2}}, \code{\link{plotBar}},
  \code{\link{plotBox}}, \code{\link{plotCIBars}},
  \code{\link{plotCorr}}, \code{\link{plotFreqProp}},
  \code{\link{plotHist}}, \code{\link{plotLine}},
  \code{\link{plotQQ}}, \code{\link{plotResFit}},
  \code{\link{plotResQQ}}, \code{\link{plotScatter}},
  \code{\link{plotStackedBar}}
}
\author{
John James, \email{jjames@datasciencesalon.org}
}
