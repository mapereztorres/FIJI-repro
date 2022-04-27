//Número de células, área e intensidad de núcleos

open();
rename("Imagen Muestra");
run("Split Channels");

selectWindow("Imagen Muestra (green)");
close();
selectWindow("Imagen Muestra (red)");
close();

selectWindow("Imagen Muestra (blue)");
run("Duplicate...", "title=[para segmentar]");
run("Set Measurements...", "integrated redirect=None decimal=5");
selectWindow("para segmentar");
run("Median...", "radius=2");
run("Threshold...");
setAutoThreshold("Default dark");
run("Convert to Mask");
run("Watershed");
run("Analyze Particles...", "exclude summarize add");
Table.rename("Summary", "número de células");

run("Set Measurements...", "area mean integrated redirect=None decimal=5");
selectWindow("Imagen Muestra (blue)");
roiManager("Show All");
roiManager("Measure");
Table.rename("Results", "Area e intensidad nucleos");