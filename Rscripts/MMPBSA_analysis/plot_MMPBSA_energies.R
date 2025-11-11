################################################### #
# Plot MMPBSA/MMGBSA energies as a function of time #
# from AmberTools MMPBSA.py output                  #
#####################################################

library(ggplot2)
library(dplyr)
library(tidyr)

setwd("AnalysisMD/Rscripts/MMPBSA_analysis")

source("functions.R")

# Results directories should be ordered as:
# - MMPBSA
#   - PROTEIN
#     - LIGAND
#       - ENERGY_MMPBSA.dat
# (Same for MMGBSA)

## 1. Load input files

# Define one or more ligands
ligands <- c("L1", "L2","L3")

# Define one or more proteins
proteins <- c("P1", "P2")

# Load MMPBSA / MMGBSA results into a list
analysis <- "MMPBSA" # other options is: MMGBSA
results <- list()
for (protein in proteins) {}
  results[[protein]] <- as.character(lapply(ligands, 
                                     function(ligand) paste0(analysis, "/", protein, "/",  
                                                        ligand, "/ENERGY_", analysis,".dat")))

# Extract and plot TOTAL, EEL, VDW and SOLVATION energies as a function of time
  
# Determine number of subplots
nlig <- length(ligands)
nrows <- ceiling(sqrt(nlig))
ncols <- ceiling(nlig / nrows)
  
paste0("Plots ordered in ", nrows, " rows and ", ncols, " columns")  

# Histograms of energies
for (protein in proteins) {
  
  # define plot type (scatter / hist)
  plot_type <- "hist"
  
  # define plots organization and xlim/ylim for each set
  
  # TOTAL energy
  par(mar = c(5, 4, 2, 2), mfrow = c(nrows, ncols))
  xlim = c(-10,-60)
  ylim = c(0, 50)
  lapply(1:length(ligands), function(ligand) 
    plot_energies(results[[protein]][ligand], protein, ligands[ligand], "TOTAL", xlim, ylim, plot_type))
  
  # EEL energy
  par(mar = c(5, 4, 2, 2), mfrow = c(nrows, ncols))
  xlim = c(0, -25)
  ylim = c(0, 50)
  lapply(1:length(ligands), function(ligand) 
    plot_energies(results[[protein]][ligand], protein, ligands[ligand], "EEL", xlim, ylim, plot_type))
  
  # VDW energy
  par(mar = c(5, 4, 2, 2), mfrow = c(nrows, ncols))
  xlim  = c(-20,-60)
  ylim = c(0, 50)
  lapply(1:length(ligands), function(ligand) 
    plot_energies(results[[protein]][ligand], protein, ligands[ligand], "VDW", xlim, ylim, plot_type))
  
  # Solvation energy
  par(mar = c(5, 4, 2, 2), mfrow = c(nrows, ncols))
  xlim = c(0,35)
  ylim = c(0, 50)
  lapply(1:length(ligands), function(ligand) 
    plot_energies(results[[protein]][ligand], protein, ligands[ligand], "SOLV", xlim, ylim, plot_type))
}

# Scatterplot of energies
for (protein in proteins) {
  
  # define plot type (scatter / hist)
  plot_type <- "scatter"
  
  # xlim is the same in scatterplots
  xlim <- c(0,250)
  
  # define plots organization and xlim/ylim for each set
  
  # TOTAL energy
  par(mar = c(5, 4, 2, 2), mfrow = c(nrows, ncols))
  ylim = c(0,-60)
  lapply(1:length(ligands), function(ligand) 
    plot_energies(results[[protein]][ligand], protein, ligands[ligand], "TOTAL", xlim, ylim, plot_type))
  
  # EEL energy
  par(mar = c(5, 4, 2, 2), mfrow = c(nrows, ncols))
  ylim = c(0, -25)
  lapply(1:length(ligands), function(ligand) 
    plot_energies(results[[protein]][ligand], protein, ligands[ligand], "EEL", xlim, ylim, plot_type))
  
  # VDW energy
  par(mar = c(5, 4, 2, 2), mfrow = c(nrows, ncols))
  ylim  = c(-20,-60)
  lapply(1:length(ligands), function(ligand) 
    plot_energies(results[[protein]][ligand], protein, ligands[ligand], "VDW", xlim, ylim, plot_type))
  
  # Solvation energy
  par(mar = c(5, 4, 2, 2), mfrow = c(nrows, ncols))
  ylim = c(0,35)
  lapply(1:length(ligands), function(ligand) 
    plot_energies(results[[protein]][ligand], protein, ligands[ligand], "SOLV", xlim, ylim, plot_type))
}


  