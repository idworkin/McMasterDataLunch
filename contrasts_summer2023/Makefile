ALL: ContrastsDataLunch.html

%.html: %.Rmd
	Rscript -e "rmarkdown::render(\"$<\")"
