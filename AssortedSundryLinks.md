# Assorted and sundry from DataLunch (reverse chronological order)

## July 31st 2020 (JCS presenting on swimming data).

We discussed the difference between transformations of the response data (like a log transformation of raw responses) and the use of link functions. [Here is a useful link discussing the difference](https://www.theanalysisfactor.com/the-difference-between-link-functions-and-data-transformations/).


## April 16th 2015. M. Belyk presented on data for the meta-analysis of neuro-imaging data (??)

### Stuff from ID:
 
Packages mentioned:

1. The `MCMCglmm()` in the [MCMCglmm](http://cran.r-project.org/web/packages/MCMCglmm/index.html) package that allows you to fit multivariate mixed models which may be useful if you want to fit study as a random effect (if you can not aggregate measures within study).  The `plotsubspace()` may be useful for visual inspection of whether the covariance structures across your treatments are similar. You can also model seperate residual covariance structures in `MCMCglmm`.
2. Someone mentioned the `adonis()` function in [vegan](http://cran.r-project.org/web/packages/vegan/index.html). Allows distance based 'MANOVA' like models assessing uncertainly with resampling.
3. The [geomorph](http://cran.r-project.org/web/packages/geomorph/index.html) package, while specifically designed for geometric morphometrics (shape) has a wide variety of functions for multivariate analysis. They have lots of information on their [website](http://www.geomorph.net/). They have also have a couple of blog posts that I thought would be useful to you:
    - http://www.geomorph.net/2015/03/geomorph-and-multivariate-datasets.html
    - http://www.geomorph.net/2015/04/anovas-and-geomorph.html
4. I have absolutely no idea if they are useful, but I do know that there are some packages designed for neuroimaging data. 
    - [fslr](http://cran.r-project.org/web/packages/fslr/index.html)
    - [ANTsR](https://github.com/stnava/ANTsR)
    - I have seen a few blog posts about them (but since it is way outside my field,I have no idea if they are useful):
        - https://hopstat.wordpress.com/2015/04/09/a-small-neuroimage-interactive-plotter/
        - https://github.com/muschellij2/HopStat/tree/gh-pages/White_Matter_Segmentation_in_R

5. For some of the resampling approaches (now mostly included in geomorph) we have written our custom functions. It may be easiest to speak directly so I can get you the right source files, but various iterations of these are in our source scripts and can be found on github or dryad:
    - http://datadryad.org/resource/doi:10.5061/dryad.nh53j
    - http://datadryad.org/resource/doi:10.5061/dryad.55j7t
    - http://datadryad.org/resource/doi:10.5061/dryad.r43k1
 
### From B.B.

googling "R isosurface" gets the misc3d package (which is what I had
in mind) and http://www.jstatsoft.org/v28/i01/paper, which refers to the
contour3d function in the misc3d package.  It even has a brain PET scan
example ..

B.B. also mentioned the paper by Paul Murtaugh [SIMPLICITY AND COMPLEXITY IN ECOLOGICAL DATA ANALYSIS](http://www.esajournals.org/doi/abs/10.1890/0012-9658(2007)88%5B56:SACIED%5D2.0.CO;2)
