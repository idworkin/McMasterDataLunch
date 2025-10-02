ALL: PowerAnalysisDataLunch.html

%.html: %.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "ioslides_presentation")'
