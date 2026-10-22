# Dependencies

This project uses R for data cleaning, statistical analysis, and visualisation of simulated data.

## Software

- R (version 4.6.1)
- Quarto (to render the `report.qmd` report)
- Positron (optional; used as the development environment)
- Git (for version control)

## R packages

The following packages are used in the project:

| Package | Purpose |
|---|---|
| `dplyr` | Data manipulation, joining datasets, and calculating summary statistics |
| `ggplot2` | Creating MADRS and PHQ-9 figures |
| `patchwork` | Arranging MADRS and PHQ-9 plots side by side |
| `gtsummary` | Creating participant summary statistics tables |
| `gt` | Formatting and exporting tables |
| `emmeans` | Estimating marginal means and performing pairwise comparisons |

The additional analysis found in the 'additional_analysis' folder also require `lme4`.

## Installation

Install the packages in R with:

```r
install.packages(c(
  "dplyr", "ggplot2", "patchwork",
  "gtsummary", "gt", "emmeans"
))
```

For additional analysis, also install:

```r
install.packages(c("lme4", "lmerTest"))
```
## Loading packages

Before running the analysis scripts, start an R session and load the packages:

```r
library(dplyr)
library(ggplot2)
library(patchwork)
library(gtsummary)
library(gt)
library(emmeans)
```

## Notes

- The project uses simulated data.
- Raw data files are excluded from the GitHub repository using `.gitignore`.
