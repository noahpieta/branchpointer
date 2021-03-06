% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predictBranchpoints.R
\name{predictBranchpoints}
\alias{predictBranchpoints}
\title{Predict branchpoint probability scores}
\usage{
predictBranchpoints(query, uniqueId = "test", queryType,
  workingDirectory = ".", genome = NA, bedtoolsLocation = NA,
  BSgenome = NULL, useParallel = FALSE, cores = 1, rmChr = FALSE)
}
\arguments{
\item{query}{branchpointer query GenomicRanges}

\item{uniqueId}{unique string identifier for intermediate .bed and .fa files.}

\item{queryType}{type of branchpointer query. "SNP" or "region".}

\item{workingDirectory}{directory where intermediate .bed and .fa are located}

\item{genome}{.fa genome file location}

\item{bedtoolsLocation}{bedtools binary location (which bedtools)}

\item{BSgenome}{BSgenome object}

\item{useParallel}{use parallelisation to speed up code?}

\item{cores}{number of cores to use in parallelisation (default = \code{1})}

\item{rmChr}{remove "chr" before chromosome names before writing bed file.
Required if genome sequence names do not contain "chr"}
}
\value{
GenomicRanges object with branchpoint probaility scores for each site in query
}
\description{
predicts branchpoint probability scores for each query site.
}
\examples{
smallExons <- system.file("extdata","gencode.v24.annotation.small.gtf",
package = "branchpointer")
exons <- gtfToExons(smallExons)
genome <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38

querySNP <- system.file("extdata","SNP_example.txt", package = "branchpointer")
query <- readQueryFile(querySNP,queryType = "SNP")
query <- getQueryLoc(query,queryType = "SNP",exons = exons, filter = FALSE)
predictions <- predictBranchpoints(query,queryType = "SNP",BSgenome = genome)
}
\author{
Beth Signal
}
