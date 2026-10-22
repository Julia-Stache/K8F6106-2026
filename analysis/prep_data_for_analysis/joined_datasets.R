# ==============================================================
# Combine repeated assessments with baseline depression severity
# ==============================================================

# 1. Load cleaned data
participants <- read.csv("data/participants_clean.csv")
assessments <- read.csv("data/assessments_clean.csv")

# 2. Join datasets
repeated_measurements_data <- assessments |>
  left_join(
    participants |> select(participant_id, baseline_madrs),
    by = "participant_id"
  ) |>
  mutate(
    randomized_arm = factor(randomized_arm, levels = c("Placebo", "SSRI")),
    participant_id = factor(participant_id),
    estradiol_per_100 = estradiol_pg_ml / 100
  )