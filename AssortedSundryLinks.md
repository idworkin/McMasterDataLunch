# Assorted and sundry from DataLunch (reverse chronological order)

## Sept 11th, 2020 (MF presenting on wanting to start some multivariate analysis on a series of morphometrics data.

 - Suggested to MF to consider the dimensions (length vs. area vs. volume/mass) of variables and also scale before using these together.
 - Common to log transform variables (in common dimensions) before using the PCA. check to see if PC1 is mostly size (all loadings the same size, approximatitely equal in magnitude, and whether it strongly correlates with length or mass).
 
 Output from chat window
 13:08:32	 From ID : Some basics of fitting multivariate linear models and multivariate mixed models in this tutorial
13:08:34	 From ID : https://mac-theobio.github.io/QMEE/Multivariate_responses.html
13:09:45	 From BB : To (possibly) make life harder: can you say a little bit more about experimental design details, i.e. how are fish raised in batches?  Presumably every egg doesn't have separate temperature control
13:12:08	 From BB : so 100% pseudoreplicated ...
13:12:50	 From RL(he/him) : Hmmm, I'm not thinking we should NOW adjust the covariate. I still get mixed up about direct and total effects; here we want to compare treatments after adjusting for hatch date, so that'd be using covariate in the standard way.
13:13:12	 From BB : +1 to RL
13:14:27	 From ID : https://github.com/DworkinLab/VirtualMorphoMeetup/blob/master/VirtualMorphMeet_April29_2020.md. this one is for using pairwise in RRPP (an extension of permmanova from adonis) that allows much more flexibility for multivariate linear models, including pulling out coefficients easily, R^2 etc..
13:15:24	 From BB : Consider looking at other PCs, e.g. PC1 vs PC3? I know smaller PCs are more likely to be just noise, but it's also a little scary that 95% of the time people look *only* at PC1 vs PC2 ...
13:17:58	 From BB: Josh Starmer, youtube, statsquest
13:18:43	 From BB: if you're interested in linear algebra per se (i.e. what's an eigenvector), look for 3blue1brown (youtube???)

13:19:50	 From ML : Cool. Excellent data-lunch to start off the term! 
13:20:32	 From ML : Have a good weekend!
13:20:38	 From RL (he/him) : Enjoyable - thanks
13:20:39	 From BB : bye!


## August 21st 2020 (JCSz presenting on Lord's Paradox)

1. Slides [here](https://jcszamosi.github.io/LordsParadox/)
2. Judea Pearl's explanation [here](https://ftp.cs.ucla.edu/pub/stat_ser/r436.pdf)

## August 7th 2020 (MS presenting on social vs asocial fish and intelligence)

1. We discussed using (instead of sum to zero or treatment contrasts) the successive difference contrast coding which is available in the MASS library. See [here](https://www.rdocumentation.org/packages/MASS/versions/7.3-51.6/topics/contr.sdif)

## July 31st 2020 (JCSz presenting on swimming data).

1. We discussed the difference between transformations of the response data (like a log transformation of raw responses) and the use of link functions. [Here is a useful link discussing the difference](https://www.theanalysisfactor.com/the-difference-between-link-functions-and-data-transformations/).
2. We learned that the `plot.merMod()` method takes a `col=` argument, which allows you to colour the plot by a column of your data
3. We learned that the `ranef()` method of lme4 model objects can return a data frame for use with ggplot2.

## July 24th 2020 (CS presenting about comparing trap types for fish)

1. We discussed how to get contrasts of various kinds out of a binomial model using emmeans. [Here is a link to the relevant place in the documentation](https://cran.r-project.org/web/packages/emmeans/vignettes/interactions.html#contrasts).

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
