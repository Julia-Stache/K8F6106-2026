# K8F6106-2026
This is my repo for the course Open Science in Practice: Collaborative Research with Git.

For this course, I used ChatGPT to generate an imaginary dataset to investigate how drug effectiveness may fluctuate across the menstrual cycle in menstruating women with unipolar depression. Unfortunately, I ended up spending a lot of time on intricate study designs and formulating hypotheses, leaving little time to focus on learning how to use github. I ended up settling for a much more basic imaginary study design using my already generated data to leave just enough room to fight with pull requests. 

*Overview of the repository*

This repository contains R scripts for data cleaning, statistical analysis, and visualisation of simulated data from a fictional study investigating antidepressant treatment effectiveness.

The repository is organised as follows:

```text
K8F6106-2026/
│
├── analysis/                         # Data processing and analysis
│   │
│   ├── DEPENDENCIES.md               # Required software and R packages
│   ├── clean_data.R                  # Data cleaning
│   ├── joined_datasets.R             # Combining datasets
│   ├── main_analysis.R               # Main statistical analysis
│   ├── main_analysis_figures.R       # Visualisation of results
│   ├── summary_stats_table           # Summary statistics
│   │
│   └── menstrualcycle_MADRS/         # Menstrual-cycle analyses
│       ├── menstrualcycle_MADRS_lmer.R
│       ├── menstrualcycle_MADRS_pairwise.R
│       └── menstrualcycle_MADRS_figure.R
│
├── report/                           # Research report
│   ├── report.qmd                     # Quarto source file
│   └── report.html                    # Rendered HTML report
│
├── .gitignore                        # Files ignored by Git
├── README.md                         # Project documentation
└── flowchart.drawio                   # Project flowchart
```

**Note:** The `data/` folder contains the simulated datasets used in the analyses but is excluded from version control using `.gitignore`.
