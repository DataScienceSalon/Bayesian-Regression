% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualization.R
\name{pieChart}
\alias{pieChart}
\title{pieChart}
\usage{
pieChart(data, xLab, plotTitle = NULL)
}
\arguments{
\item{data}{Data frame or vector containing a single categorical factor variable}

\item{xLab}{Capital case character string containing the name of the variable x variable}

\item{plotTitle}{Capital case character string for the title of the plot}

\item{yLab}{Capital case character string describing the y variable}
}
\value{
Bar plot
}
\description{
\code{pieChart} Renders a pie plot
}
\seealso{
Other visualization functions: \code{\link{groupBarPlot}},
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
