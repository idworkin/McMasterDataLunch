---
title: "Using Simulations for power analysis"
author: "Ian Dworkin"
date: "2025-08-01"
output:
  html_document:
    toc: true
    toc_float: true
    number_sections: true
    code_folding: hide
    df_print: paged
    keep_md: true
  pdf_document:
    toc: true
editor_options:
  chunk_output_type: console
---




``` r
library(lattice)
```


## tools in `R`
>- Many libraries in `R` to use, depending on purposes.
>- in base `R`, there is `power.t.test()`, `power.anova.test()`, `power.prop.test()`
>- `pwr` is an `R` package that does many simple types of statistical models (proportions, 1-way ANOVA, regression, $\chi^2$, glm)
>- See the [CRAN TASK VIEWS on experimental design](https://cran.r-project.org/web/views/ExperimentalDesign.html) for a list (and description) of more.
>- See this [draft task view for power](https://github.com/statisfactions/ctv-power/blob/main/ctv-power.md)

## Sometimes you just need to do your own simulations though.

There are some packages which can help with this as well, such as [`simr`](https://cran.r-project.org/web/packages/simr/index.html) and [`simpr`](https://cran.r-project.org/web/packages/simpr/index.html) (the latter uses tidyverse verb syntax which can be helpful). 



## Monte carlo power analysis example

### using a for loop

``` r
N = 1000  # Number of simulations for inner loop. You generally want this to be >1000. 

minimum_value = rep(NA, N) # initializing the vector to store the minimum value from your estimates
#Global Parameter values

minimum_threshold = 0.2 # The minimum value of interest

a = 0.5 # intercept

b <- seq(from = 0.2, to = 0.8, by = 0.05) # slope magnitudes to try

sample_size <- seq(from = 10, to = 100, by = 10)  # Incremently increasing sample size 

power_size <- numeric(length(sample_size)) # initializing the vector to store the "power" at each sample size for the outer for loop.

### initialize the matrix to store all of the "power" estimates
power_b <- matrix(NA, length(sample_size), length(b))
```

### Now the actual for loop

``` r
for (k in 1:length(b))  # across the different effect sizes
 {
  
  b_b <- b[k]
  
   for (j in 1:length(sample_size))  # looping through the different sample_sizes

    {
   
      s_s = sample_size[j]
      for (i in 1:N)
      {
       x <- rnorm(s_s, mean = 20, sd = 3)  # simulate values of predictor
       y_det <- a + b_b*x             # deterministic part of model
       y_sim <- rnorm(s_s, mean = y_det, sd = 2)  # Simulate y|x values
       lm1 <- lm(y_sim ~ x)                    # fit model given simulation 
       minimum_value[i] <- confint(lm1)[2,1] # You may want to extract a different value from the model. Lower bound of 95% CI
	  
     }
    
      power_size[j] <- length(minimum_value[minimum_value >= minimum_threshold])/N   # How many estimates are greater than the relevant threshold
   }
   
    power_b[,k] <- power_size 
}
```


### Plotting results from a power analysis

``` r
par(mfrow = c(1,1))

filled.contour(z = power_b, x = sample_size, y = b, 
    ylim = c(min(b), max(b)), xlim = c(min(sample_size), max(sample_size)), 
    xlab = "Sample Size", ylab = "slope", color = topo.colors,
    key.title = title(main = "power"))
```

![](ExamplePowerSimulations_files/figure-html/contour_plot-1.png)<!-- -->

### Plotting results from a power analysis

``` r
persp(y = b, x = sample_size, z = power_b, col = rgb(0, 0, 1, 0.45), theta = -45, 
    shade = 0.75, ltheta = 45, ylab = "slope", xlab = "Sample Size", 
    lphi = 30, zlim = c(0,1.25), ticktype = "detailed")
```

![](ExamplePowerSimulations_files/figure-html/surface_plot-1.png)<!-- -->

### Plotting results from a power analysis


![](ExamplePowerSimulations_files/figure-html/xyplot-1.png)<!-- -->


### monte carlo simulation in a more Rish way


Here we will use the base R functions

``` r
a = 0.5 # intercept

b <- seq(from = 0.2, to = 0.8, by = 0.05) #slope

std_dev = 2 # standard deviation of response

sample_size <- seq(from = 10,to = 100, by = 10)

N <- 1000 # number of replicate simulations for each combination
```

We will use `expand.grid` to get all combinations of b and sample_size


```
## [1] 130   2
```


We perform the simulation in a very similar way 

``` r
SimulatePower <- function(sample_size, b_b, a, std_dev){
	x <- rnorm(sample_size, mean = 20, sd = 3)
	y_det <- a + b_b*x
  y_sim <- rnorm(sample_size, mean = y_det, sd = std_dev)
  lm1 <- lm(y_sim ~ x)
  minimum_value <- confint(lm1)[2,1]
 }
```


Let's make sure it works

``` r
check_it_works <- replicate(N, 
                            SimulatePower(sample_size = 100,
                                          b_b = 0.4, a = 0, 
                                          std_dev = 2))
hist(check_it_works, freq = T, main = NULL)
```

![](ExamplePowerSimulations_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

       
To go through all the particular combination of sample sizes and slopes (once each), it would look like this



``` r
min_values <- mapply(SimulatePower, 
    sample_size  = b_N$sample_size, b_b = b_N$b, 
    MoreArgs = list(a = 0, std_dev = 2))
```

However since we want to do this many times for each combination we use `replicate`


``` r
rep_p <- replicate(N, mapply(SimulatePower, 
    sample_size  = b_N$sample_size, b_b = b_N$b, 
    MoreArgs=list(a = 0, std_dev = 2)) ) 
```



```
## [1]  130 1000
```


Now we can compute the "power" to confidently (95%) assess whether our effects are at least as large as a minimum magnitude of interest


``` r
power_lev <- apply(rep_p, MARGIN = 1, 
    function(x) length(x[x >= minimum_threshold])/length(x)) 
```


``` r
grid_matrix <- matrix(data = power_lev, 
                      nrow = length(b),
                      ncol = length(sample_size))
```


``` r
filled.contour(z = t(grid_matrix), x = sample_size, y = b,
               ylim = c(min(b), max(b)),
               xlim = c(min(sample_size), max(sample_size)), 
               xlab = "Sample Size", ylab = "slope", color = topo.colors)
```

![](ExamplePowerSimulations_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

