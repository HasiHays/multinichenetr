% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pipeline.R
\name{multi_nichenet_analysis}
\alias{multi_nichenet_analysis}
\title{multi_nichenet_analysis}
\usage{
multi_nichenet_analysis(sender_receiver_separate = TRUE, ...)
}
\arguments{
\item{sender_receiver_separate}{Indicates whether the user gives as input one separate SingleCellExperiment object with sender cell types and one with receiver cell types (TRUE) or whether only one SingleCellExperiment object with both sender and receiver cell types of interest (FALSE).
TRUE calls the function `multi_nichenet_analysis_separate`, FALSE calls the function `multi_nichenet_analysis_combined`. Default: TRUE.}

\item{...}{Arguments to `multi_nichenet_analysis_separate` or `multi_nichenet_analysis_combined`.}
}
\value{
List containing different types of information and output of the MultiNicheNet analysis. 
See `multi_nichenet_analysis_separate` and `multi_nichenet_analysis_combined` for more information.
}
\description{
\code{multi_nichenet_analysis}  Perform a MultiNicheNet analysis. See `multi_nichenet_analysis_separate` and `multi_nichenet_analysis_combined` for more information.
}
\examples{
\dontrun{
library(dplyr)
lr_network = readRDS(url("https://zenodo.org/record/3260758/files/lr_network.rds"))
lr_network = lr_network \%>\% dplyr::rename(ligand = from, receptor = to) \%>\% dplyr::distinct(ligand, receptor)
ligand_target_matrix = readRDS(url("https://zenodo.org/record/3260758/files/ligand_target_matrix.rds"))
sample_id = "tumor"
group_id = "pEMT"
celltype_id = "celltype"
batches = NA
covariates = NA
contrasts_oi = c("'High-Low','Low-High'")
contrast_tbl = tibble(contrast = c("High-Low","Low-High"), group = c("High","Low"))
output = multi_nichenet_analysis(
     sce = sce, 
     celltype_id = celltype_id, 
     sample_id = sample_id, 
     group_id = group_id,
     batches = batches,
     covariates = covariates,
     lr_network = lr_network, 
     ligand_target_matrix = ligand_target_matrix, 
     contrasts_oi = contrasts_oi, 
     contrast_tbl = contrast_tbl, 
     sender_receiver_separate = FALSE
     )
}

}
