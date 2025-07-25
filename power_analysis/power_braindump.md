## power analysis/sample size brain dump

* underpowered vs overpowered (http://bbolker.github.io/bbmisc/thesis_stats.html#6)
* 'seat of pants'/power calculation by supervisor
   * OK if supervisor doesn't HARK ...
* power is really a proxy for precision
   * adequate power → adequate precision → null results will imply that effects are small, not just unclear
* expected effect size usually optimistic; use SESOI instead
   * effect sizes from literature could be dicey if file-drawer effect is in play
* sample sizes are approximate; consider order of magnitude, OK to simplify analysis for power-calc purposes
* can adjust many aspects besides sample size (http://bbolker.github.io/bbmisc/thesis_stats.html#11)
* (don't do post hoc power, e.g. [Gelman](https://statmodeling.stat.columbia.edu/2019/01/13/post-hoc-power-calculation-like-shit-sandwich/)
* how should you estimate residual variance or the equivalent?
    * pilot studies are probably too noisy
* do power calculations over a range of assumptions for noise etc.?
* multilevel designs: more groups (subjects etc.) vs more subjects per group?
    * depends on where the most variance is (between or within groups)
    * classical formulas, e.g. Sokal and Rohlf (https://archive.org/details/biometryprincipl00soka_0,  section 10.4)
    * or simulate!


Gelman

* ["When anyone claims 80% power, I'm skeptical"](https://statmodeling.stat.columbia.edu/2018/08/24/anyone-claims-80-power-im-skeptical/)
* [Yes on design analysis, No on “power,” No on sample size calculations](https://statmodeling.stat.columbia.edu/2019/03/04/yes-design-analysis-no-power-no-sample-size-calculations/)
  * "Increasing N is a very crude way of decreasing variance, and it doesn’t do anything about bias at all."
