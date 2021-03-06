% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotBranchpointWindow.R
\name{plotBranchpointWindow}
\alias{plotBranchpointWindow}
\title{Plots branchpointer predictions}
\usage{
plotBranchpointWindow(queryName, predictions, probabilityCutoff = 0.5,
  plotMutated = FALSE, plotStructure = TRUE, exons)
}
\arguments{
\item{queryName}{query id used to identify the SNP or region}

\item{predictions}{Granges object generated by predictBranchpoints()}

\item{probabilityCutoff}{probability score cutoff value for displaying U2 binding energy}

\item{plotMutated}{plot alternative sequence predicitons alongside reference sequence predictions}

\item{plotStructure}{plot structures for gene and 3' exon containing and skipping isoforms}

\item{exons}{Granges containing exon co-ordinates.
Should be produced by gtfToExons()}
}
\value{
ggplot2 plot with branchpoint features in the specified intronic region
}
\description{
Plots branchpointer predictions
}
\examples{
smallExons <- system.file("extdata","gencode.v24.annotation.small.gtf",package = "branchpointer")
exons <- gtfToExons(smallExons)
genome <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38

querySNP <- system.file("extdata","SNP_example.txt", package = "branchpointer")
query <- readQueryFile(querySNP,queryType = "SNP")
query <- getQueryLoc(query,queryType = "SNP",exons = exons, filter = FALSE)

predictions <- predictBranchpoints(query,queryType = "SNP", BSgenome = genome)
plotBranchpointWindow(query$id[1], predictions,
plotMutated = TRUE, exons = exons)
}
\author{
Beth Signal
}
