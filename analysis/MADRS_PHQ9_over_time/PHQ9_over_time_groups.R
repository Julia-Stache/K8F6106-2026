# ==============================================================
# PHQ-9 improvement over time: sertraline versus placebo
# Run from the project root (containing analysis/, data/, report/).
# ==============================================================

# This script creates repeated_measurements_data, including baseline_phq9
# and visit_period (Weeks 0–4, Weeks 4–8, Weeks 8–13).
source("analysis/prep_data_for_analysis/joined_datasets.R")

# 1. One PHQ-9 average for each participant in each follow-up period.
# A participant with more visits should not count more heavily.
phq9_participant_period <- repeated_measurements_data |>
  filter(!is.na(phq9), !is.na(baseline_phq9), !is.na(visit_period)) |>
  mutate(group = if_else(as.character(randomized_arm) == "SSRI",
                         "Sertraline", "Placebo")) |>
  group_by(participant_id, group, visit_period, .drop = TRUE) |>
  summarise(
    period_phq9 = mean(phq9),
    baseline_phq9 = first(baseline_phq9),
    .groups = "drop"
  ) |>
  mutate(
    improvement = baseline_phq9 - period_phq9,
    group = factor(group, levels = c("Placebo", "Sertraline"))
  )

# Positive improvement means a reduction in depressive symptoms.

# 2. Group summaries and approximate 95% confidence intervals.
phq9_summary <- phq9_participant_period |>
  group_by(group, visit_period, .drop = TRUE) |>
  summarise(
    n = n(),
    mean_phq9 = mean(period_phq9),
    mean_improvement = mean(improvement),
    se_phq9 = sd(period_phq9) / sqrt(n()),
    se_improvement = sd(improvement) / sqrt(n()),
    .groups = "drop"
  )

print(phq9_summary)