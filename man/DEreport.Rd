\name{DEreport}
\alias{DEreport}
\title{Produce interactive DE reports.}
\author{
David Barrios and Carlos Prieto. Bioinformatics Service of Nucleus, University
of Salamanca. See \url{http://bioinfo.usal.es/}
}
\value{
The function creates a folder in your computer with an HTML document named
index.html which contains the graph. This file can be directly opened with your
browser.
}

\usage{
DEreport(DE, counts = NULL, groups = NULL,
    cutoff = 0.05, normalized = NULL, genes = NULL, pvalue = NULL,
    padj = NULL, stat = NULL, baseMean = NULL, log2FoldChange = NULL,
    directory = "DEreport")
}
\arguments{
\item{DE}{a data.frame or object resulting from a differential expression
method (DESeq2, edgeR or limma).}
\item{counts}{a matrix of counts.}
\item{groups}{a vector of groups.}
\item{cutoff}{a value to match significant results.}
\item{normalized}{a matrix of normalized counts.
    \code{counts} parameter will be ignored.}
\item{genes}{name of the column with genes in the DE and counts tables. It will
take rownames by default}
\item{pvalue}{name of the column with p value in the DE data. "pvalue" by
default.}
\item{padj}{name of the column with adjust p value in the DE data. "padj" by
default.}
\item{stat}{name of the column with statistic in the DE data. "stat" by
default.}
\item{baseMean}{name of the column with base mean in the DE data. "baseMean" by
default.}
\item{log2FoldChange}{name of the column with log 2-fold change in the DE data.
"log2FoldChange" by
default.}
\item{directory}{a "character" string representing the directory where the
graph will be saved.}
}
\description{
\code{DEreport} produce interactive graphs of the given DE results.
}
\examples{
library("airway")
data("airway")
se <- airway
se$dex <- relevel(se$dex, ref="untrt")
countdata <- assay(se)

library("DESeq2")
dds <- DESeqDataSet(se, design = ~ cell + dex)
dds <- DESeq(dds)
dr <- results(dds, independentFiltering = FALSE)

DEreport(dr, countdata, se$dex)

}
