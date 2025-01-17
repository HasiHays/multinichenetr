% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotting.R
\name{make_ggraph_signaling_path}
\alias{make_ggraph_signaling_path}
\title{make_ggraph_signaling_path}
\usage{
make_ggraph_signaling_path(signaling_graph_list, colors, ligands_all, receptors_all, targets_all)
}
\arguments{
\item{signaling_graph_list}{Output of `nichenetr::get_ligand_signaling_path_with_receptor`}

\item{colors}{Named vector of colors associated to each node type: Example: colors <- c("ligand" = "indianred2", "receptor" = "orange", "target" = "steelblue2", "mediator" = "grey25").}

\item{ligands_all}{Name of the ligand(s)}

\item{receptors_all}{Name of the receptor(s)}

\item{targets_all}{Name of the target(s)}
}
\value{
ggraph and tidygraph objec of signaling paths between predefined LR-->Target links
}
\description{
\code{make_ggraph_signaling_path} Visualize the Ligand-Receptor to target signaling paths
}
\examples{
\dontrun{
library(dplyr)
weighted_networks = readRDS(url("https://zenodo.org/record/3260758/files/weighted_networks.rds"))
ligand_tf_matrix = readRDS(url("https://zenodo.org/record/3260758/files/ligand_tf_matrix.rds"))
lr_network = readRDS(url("https://zenodo.org/record/3260758/files/lr_network.rds"))
sig_network = readRDS(url("https://zenodo.org/record/3260758/files/signaling_network.rds"))
gr_network = readRDS(url("https://zenodo.org/record/3260758/files/gr_network.rds"))
ligands_all = "COL1A1" # this can be a list of multiple ligands if required
receptors_all = "ITGB1"
targets_all = c("S100A1","SERPINE1")
active_signaling_network = nichenetr::get_ligand_signaling_path_with_receptor(ligand_tf_matrix = ligand_tf_matrix, ligands_all = ligands_all, receptors_all = receptors_all, targets_all = targets_all, weighted_networks = weighted_networks, top_n_regulators = 2)
data_source_network = nichenetr::infer_supporting_datasources(signaling_graph_list = active_signaling_network,lr_network = lr_network, sig_network = sig_network, gr_network = gr_network)
active_signaling_network_min_max = active_signaling_network
active_signaling_network_min_max$sig = active_signaling_network_min_max$sig \%>\% mutate(weight = ((weight-min(weight))/(max(weight)-min(weight))) + 0.75)
active_signaling_network_min_max$gr = active_signaling_network_min_max$gr \%>\% mutate(weight = ((weight-min(weight))/(max(weight)-min(weight))) + 0.75)
colors = c("ligand" = "indianred2", "receptor" = "orange", "target" = "steelblue2", "mediator" = "grey75")
ggraph_signaling_path = make_ggraph_signaling_path(active_signaling_network_min_max, colors)#' colors = c("ligand" = "indianred2", "receptor" = "orange", "target" = "steelblue2", "mediator" = "grey25")

}

}
