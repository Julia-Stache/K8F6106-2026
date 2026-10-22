# K8F6106-2026
This is my repo for the course Open Science in Practice: Collaborative Research with Git.

For this course, I used ChatGPT to generate an imaginary dataset to investigate how drug effectiveness may fluctuate across the menstrual cycle in adult women with unipolar depression. Unfortunately, I ended up spending a lot of time on intricate study designs and formulating hypotheses, leaving little time to focus on learning how to use github. I ended up settling for a much more basic imaginary study design using my already generated data to leave just enough room to fight with pull requests. 

*Overview of the repository*

This repository contains R scripts for data cleaning, statistical analysis, and visualisation of simulated data from a fictional study investigating antidepressant treatment effectiveness. The dataset was not generated using a single prompt but through an ongoing back and forth with ChatGPT. Therefore, I'm unable to provide a prompt or seed for the dataset. 

The repository is organised as follows:

```text
K8F6106-2026/
│
├── analysis/                            # Data processing and analysis
│   │
│   ├── DEPENDENCIES.md                  # Required software and R packages -> READ THIS B4 RUNNING THE ANALYSIS
│   │
│   ├── prep_data_for_analysis/          # Data preparation
│   │   ├── clean_data.R                 # Data cleaning
│   │   └── joined_datasets.R           # Combining cleaned datasets
│   │
│   ├── MADRS_PHQ9_over_time/            # Main outcome analyses
│   │   ├── MADRS_over_time_groups.R     # MADRS analysis by treatment group
│   │   ├── MADRS_over_time_groups_figures.R
│   │   │                                 # MADRS visualisations
│   │   ├── PHQ9_over_time_groups.R      # PHQ-9 analysis by treatment group
│   │   ├── PHQ9_over_time_groups_figure.R
│   │   │                                 # PHQ-9 visualisations
│   │   └── arrange_figures_MADRS_PHQ9.R
│   │                                     # Combined MADRS and PHQ-9 figures
│   │
│   └── additional_analysis/             # Additional analyses
│       ├── MADRS_PHQ9_over_time_figures.R
│       │                                 # Additional outcome visualisations
│       ├── MADRS_PHQ9_over_time_table.R
│       │                                 # Outcome summary tables
│       │
│       ├── estradiol_treatment_interaction/
│       │   ├── estradiol_treatment_lmer.R
│       │   │                             # Mixed-effects interaction analysis
│       │   └── estradiol_treatment_figure.R
│       │                                 # Interaction visualisation
│       │
│       └── menstrualcycle_MADRS/
│           ├── menstrualcycle_MADRS_lmer.R
│           │                             # Menstrual-cycle mixed-effects model
│           ├── menstrualcycle_MADRS_pairwise.R
│           │                             # Pairwise comparisons
│           └── menstrualcycle_MADRS_figure.R
│                                         # Menstrual-cycle visualisation
│
├── report/                              # Research report
│   ├── report.qmd                       # Quarto source file
│   └── report.html                      # Rendered HTML report
│
├── .gitignore                           # Files excluded from version control
├── README.md                            # Project overview and documentation
└── flowchart.drawio                     # Project flowchart
```
*Guide to using the repository*
How to use:
    1. Request my simulated data
    2. Go to the analysis folder -> prep_data_for_analysis
    3. READ THE DEPENDENCIES.md file
    4. Install missing libraries (if applicable)
    5. Load required R packages.
    3. Inside the folder, run the clean_data.R script first.
    4. After running the clean_data.R script, run the joined_datasets.R script
    5. Run any of the other analysis scripts.

**Note:** The `data/` folder contains the simulated datasets used in the analyses but is excluded from version control using `.gitignore`.
