# K8F6106-2026
This is my repo for the course Open Science in Practice: Collaborative Research with Git.

For this course, I used ChatGPT to generate an imaginary dataset to investigate the following research question: 'Does menstrual-cycle phase alter the effectiveness of SSRI medication in adult women suffering from unipolar depression?'

*Overview of the repository*

This repository contains R scripts for data cleaning, statistical analysis, and visualisation of simulated data from a fictional study investigating antidepressant treatment effectiveness.

The repository is organised as follows:

K8F6106-2026/
│
├── analysis/                         # Data processing and analysis
│   │
│   ├── DEPENDENCIES.md               # Required software and R packages
│   ├── clean_data.R                  # Data exploration and cleaning
│   ├── joined_datasets.R             # Combines cleaned datasets
│   ├── main_analysis.R               # Main statistical analysis
│   ├── main_analysis_figures.R       # Visualisation of model results
│   ├── summary_stats_table           # Participant summary statistics
│   │
│   └── menstrualcycle_MADRS/         # Menstrual-cycle analyses
│       ├── menstrualcycle_MADRS_lmer.R
│       │                             # Linear mixed-effects model
│       ├── menstrualcycle_MADRS_pairwise.R
│       │                             # Pairwise phase comparisons
│       └── menstrualcycle_MADRS_figure.R
│                                     # Visualisation of MADRS by phase
│
├── report/                           # Research report
│   ├── report.qmd                     # Quarto report source
│   └── report.html                    # Rendered HTML report
│
├── .gitignore                        # Files excluded from version control
├── README.md                         # Project description and documentation
└── flowchart.drawio                   # Project flowchart

Note: The data/ folder contains the simulated datasets used in the analyses but is excluded from version control using .gitignore.
