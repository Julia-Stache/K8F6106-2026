# ==============================================================
# Combine repeated assessments with baseline depression severity
# ==============================================================

# 1. Load cleaned data
participants <- read.csv("data/participants_clean.csv")
assessments <- read.csv("data/assessments_clean.csv")

# 2. Join baseline depression severity to repeated measurements
repeated_measurements_data <- assessments |>
  left_join(
    participants |> select(participant_id, baseline_madrs, baseline_phq9),
    by = "participant_id"
  ) |>
  mutate(
    randomized_arm = factor(randomized_arm, levels = c("Placebo", "SSRI")),
    participant_id = factor(participant_id),
    e2_100 = estradiol_pg_ml / 100,
    visit_period = cut(week_since_randomization,
                       breaks = c(-Inf, 4, 8, Inf),
                       labels = c("Weeks 0–4", "Weeks 4–8", "Weeks 8–13"))
  )