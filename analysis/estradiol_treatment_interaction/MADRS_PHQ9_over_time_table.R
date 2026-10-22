# ===============================================
# Descriptive table: mean MADRS and PHQ9 by treatment and study period
# ===============================================

summary_table_MADRS_PHQ9 <- repeated_measurements_data |>
  group_by(randomized_arm, visit_period) |>
  summarise(
    n_visits = sum(!is.na(madrs)),
    mean_madrs = round(mean(madrs, na.rm = TRUE), 1),
    sd_madrs = round(sd(madrs, na.rm = TRUE), 1),
    .groups = "drop",
    mean_phq9 = mean(phq9, na.rm = TRUE),
    sd_phq9 = round(sd(phq9, na.rm = TRUE), 1)
  )
print(summary_table_MADRS_PHQ9)