# A totally made up example of code to illustate it

# for the example we did on Friday, October 27th, 2023.


# MeHg - MethylMercury amount or concentration or whatever it was
# dN15.c - the amount of nitrogen in the organism. This predictor variable has been centred. quantitative predictor
# Beaver - upstream or downstream of dam (2 level factor)
# Harvest - field site harvested or not (2 level factor)
# site - random location (each with a beaver dam). (I think this had 6 levels)

mod1 <- lmer(MeHg ~ dN15.c*Beaver*Harvest
                          + (1 + dN15.c | site), 
                          data = dat)


# first, this. More for providing scaffolding to understand how to look at changes in slopes for an easier situation. 
# It is the next bit of code you actually want.
slope_values <- emtrends(mod1, ~ Harvest|Beaver, var = "dN15.c")

contrast(slope_values, method = "trt.vs.ctrl1") # should give you harvested site differences, by upstream or downstream of Beaver dam. 


# What you actually want I believe the contrast of contrast. In other words, how much is the difference (between upstream and downstream of the dam) in slopes changing by harvested VS unharvested sites.
slope_values2 <- emtrends(mod1, pairwise ~ Harvest*Beaver, var = "dN15.c")

slope_changes <- contrast(slope_values2[[1]],
                          interaction = c(Harvest = "trt.vs.ctrl1", Beaver = "trt.vs.ctrl1"),
                          by = NULL)

slope_changes
confint(slope_changes)
# note, since Harvest and Beaver only have two levels each, you could use "pairwise" for the contrast method in the interaction statement.
# If this works you should get one row of numbers, with the estimate (the difference of differences in the slope), standard error on this, etc.. The estimate and confidence interval should be the clearest.

