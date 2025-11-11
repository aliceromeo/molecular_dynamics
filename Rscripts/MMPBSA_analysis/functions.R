## Plot MMPBSA/MMGBSA energies as a function of time 
# TOTAL, EEL, VDW, SOLV
plot_energies <- function(file, protein, ligand, energy, xlim, ylim, plot_type) {
  
  # Load energy files
  df <- read.csv(file, sep = ",", skip = 765, header = F)
  colnames(df) <- c("Frame #","BOND","ANGLE","DIHED","UB","IMP","CMAP",
                    "VDWAALS","EEL","1-4 VDW","1-4 EEL","EPB","ENPOLAR",
                    "EDISPER","DELTA G gas","DELTA G solv","DELTA TOTAL")
  
  # plot_type (hist / scatter)
  # energies (TOTAL, EEL, VDW, SOLV)
  
  if (plot_type == "hist") {
  
    if (energy == "TOTAL") {
      
      hist(df$`DELTA TOTAL`, xlim = xlim, breaks = 20, ylim = ylim,
           xlab = "Total energy (kcal/mol)", ylab = "Density", main = paste0(protein, " - ", ligand))
      
    } else if (energy == "EEL") {
      
      hist(df$EEL, xlim = xlim, breaks = 20, ylim = ylim,
           xlab = "EEL energy (kcal/mol)", ylab = "Density", main = paste0(protein, " - ", ligand))
      
    } else if (energy == "VDW") {
      
      hist(df$VDWAALS, xlim  = xlim, breaks = 20, ylim = ylim,
           xlab = "VdW energy (kcal/mol)", ylab = "Density", main = paste0(protein, " - ", ligand))
      
    } else if (energy == "SOLV") {
      
      hist(df$`DELTA G solv`, xlim = xlim, breaks = 20, ylim = ylim,
           xlab = "Solvation energy (kcal/mol)", ylab = "Density", main = paste0(protein, " - ", ligand))
      
    }
    
  } else if (plot_type == "scatter") {
    
    if (energy == "TOTAL") {
    
      plot(df$`DELTA TOTAL`, type = "l", xlim = xlim, ylim = ylim,
          xlab = "Frames", ylab = "Total energy (kcal/mol)", main = paste0(protein, " - ", ligand))
    
    } else if (energy == "EEL") {
      
      plot(df$EEL, type = "l", xlim = xlim, ylim = ylim,
           xlab = "Frames", ylab = "EEL energy (kcal/mol)", main = paste0(protein, " - ", ligand))
      
    } else if (energy == "VDW") {
      
      plot(df$VDW, type = "l", xlim = xlim, ylim = ylim,
           xlab = "Frames", ylab = "VdW energy (kcal/mol)", main = paste0(protein, " - ", ligand))
      
    } else if (energy == "SOLV") {
      
      plot(df$`DELTA G solv`, type = "l", xlim = xlim, ylim = ylim,
           xlab = "Frames", ylab = "Solvation energy (kcal/mol)", main = paste0(protein, " - ", ligand))
      
  }
  }
}
