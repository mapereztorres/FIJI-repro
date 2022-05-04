open("/tmp/cells-example01-8bits.tif");
run("Subtract Background...", "rolling=12");
setThreshold(72, 255, "raw");
setOption("BlackBackground", true);
run("Make Binary");
run("Fill Holes");
run("Convert to Mask");
run("Watershed");
run("Analyze Particles...", "  show=Nothing display");
saveAs("Results", "/tmp/results-cells-example01.csv");

