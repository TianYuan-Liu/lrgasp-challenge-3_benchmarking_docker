generatePDFreport = function() 
  {
  pdf(file=pdf.report.file, width = 6.5, height = 6.5)

  #cover
  grid.newpage()
  cover <- textGrob("LRGASP Challenge 3\ncomparison report",
                    gp=gpar(fontface="italic", fontsize=40, col="orangered"))
  grid.draw(cover)

  
  # Plot Table 1 
  #grid.arrange(t1.1)
  print(pt1.1)
  # Plot Table 1.2 (UJC collapsed)
  #grid.arrange(t1.2)
  print(pt1.2)
  
  # Gene Characterization
  #s <- textGrob("Gene Characterization", gp=gpar(fontface="italic", fontsize=17), vjust = 0)
  #grid.arrange(s)
  #print(p1.1)
  print(p1.2)
  #print(p2)
  
  # length distribution
  print(p6)

  
  # Distances to TSS and TTS of FSM and ISM
  #s <- textGrob("Distance to annotated TSS and TTS", gp=gpar(fontface="italic", fontsize=17), vjust = 0)
  #grid.arrange(s)
  #print(p4.1)
  #print(p4.2)
  #print(p5.1)
  #print(p5.2)
  # Jaccard Index
  s <- textGrob("Presence/absence analysis \nof UJC across pipelines", gp=gpar(fontface="italic", fontsize=17), vjust = 0)
  grid.arrange(s)
  corrplot(jac_index_mat, order="hclust", is.corr = F, method = "circle", tl.col = "black",
           title="Pair-wise Jaccard index between submissions", mar = c(2,1.5,1.5,1.5),
           col = COL2("RdBu", 100 ))
  print(p12)
  print(p12.1)
  #print(p12.2)
  
  
  # Intersections
  if (opt$upset){
    s <- textGrob("Intersection regarding to UJC", gp=gpar(fontface="italic", fontsize=17), vjust = 0)
    grid.arrange(s)
    print(p10)
    print(p10.1)
  }

  # Strandard Deviation of TSS and TTS
  s <- textGrob("Standard Deviation of TSS and TTS", gp=gpar(fontface="italic", fontsize=17), vjust = 0)
  grid.arrange(s)
  print(p13)
  print(p14)

  
  s <- textGrob("LRGASP metrics Comparison", gp=gpar(fontface="italic", fontsize=17), vjust = 0)
  grid.arrange(s)
  # SIRVs
  #grid.arrange(t3)
  for (i in 1:length(pt3)) {
    print(pt3[[i]])
  }
  # Rest of transcripts
  #grid.arrange(t4.1)
  for (i in 1:length(pt4.1)) {
    print(pt4.1[[i]])
  }
  #grid.arrange(t4.2)
  for (i in 2:(length(pt4.2))) {
    if (!(i %in% c(3,11))){
      print(pt4.2[[i]])
    }
  }

  # BUSCO analysis
  for (i in 1:length(pt5.1)) {
    print(pt5.1[[i]])
  }
  
  
  dev.off()
  
  print("SQANTI3 report successfully generated!")
}
