# ==============================================================
# MADRS improvement over time: sertraline versus placebo
# Uses the cleaned data joined by analysis/joined_datasets.R
# ==============================================================

# Run from the project root (the folder containing analysis/ and data/).
source("analysis/prep_data_for_analysis/joined_datasets.R")

# Check treatment coding in the uploaded datasets:
# randomized_arm = "SSRI" means sertraline; "Placebo" means placebo.
stopifnot(all(
  unique(as.character(repeated_measurements_data$randomized_arm)) %in%
    c("SSRI", "Placebo")
))

# 1. Calculate one average MADRS score per participant and period.
# This avoids giving extra weight to people with more assessments.
participant_period <- repeated_measurements_data |>
  filter(!is.na(madrs), !is.na(baseline_madrs), !is.na(visit_period)) |>
  mutate(group = if_else(as.character(randomized_arm) == "SSRI",
                         "Sertraline", "Placebo")) |>
  group_by(participant_id, group, visit_period, .drop = TRUE) |>
  summarise(
    period_madrs = mean(madrs),
    baseline_madrs = first(baseline_madrs),
    .groups = "drop"
  ) |>
  mutate(
    improvement = baseline_madrs - period_madrs,
    group = factor(group, levels = c("Placebo", "Sertraline"))
  )

# Positive improvement means MADRS decreased from baseline.

# 2. Summarise results for each group and follow-up period.
madrs_summary <- participant_period |>
  group_by(group, visit_period, .drop = TRUE) |>
  summarise(
    n = n(),
    mean_madrs = mean(period_madrs),
    mean_improvement = mean(improvement),
    se_madrs = sd(period_madrs) / sqrt(n()),
    se_improvement = sd(improvement) / sqrt(n()),
    .groups = "drop"
  )

print(madrs_summary)