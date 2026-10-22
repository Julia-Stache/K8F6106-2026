# SSRI trial: treatment response and estradiol
# Run from the project root, after clean_data.R.
# Install once if needed: install.packages(c("dplyr", "ggplot2", "lmerTest"))

library(dplyr)
library(ggplot2)
library(lmerTest)

# 1. Load cleaned data
participants <- read.csv("data/participants_clean.csv")
assessments <- read.csv("data/assessments_clean.csv")

# 2. Join baseline depression severity to repeated measurements
study <- assessments |>
  left_join(
    participants |> select(participant_id, baseline_madrs),
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

# 3. Descriptive table: mean MADRS by treatment and study period
summary_table <- study |>
  group_by(randomized_arm, visit_period) |>
  summarise(
    n_visits = sum(!is.na(madrs)),
    mean_madrs = round(mean(madrs, na.rm = TRUE), 1),
    sd_madrs = round(sd(madrs, na.rm = TRUE), 1),
    .groups = "drop",
    mean_phq9 = mean(phq9, na.rm = TRUE),
    sd_phq9 = round(sd(phq9, na.rm = TRUE), 1)
  )
print(summary_table)

# 4. Figure: depressive symptoms over time
plot_madrs <- ggplot(summary_table,
                     aes(x = visit_period, y = mean_madrs,
                         group = randomized_arm, color = randomized_arm)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  labs(x = "Number of weeks since randomisation", y = "Mean MADRS score",
       color = "Group", title = "Depressive symptoms during the trial") +
  theme_minimal(base_size = 12)

print(plot_madrs)
dir.create("figures", showWarnings = FALSE)
ggsave("figures/madrs_over_time.png", plot_madrs,
       width = 7, height = 4.5, dpi = 300)

plot_phq9 <- ggplot(summary_table,
                     aes(x = visit_period, y = mean_phq9,
                         group = randomized_arm, color = randomized_arm)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  labs(x = "Number of weeks since randomisation", y = "Mean PHQ-9 score",
       color = "Group", title = "PHQ-9 scores during the trial") +
  theme_minimal(base_size = 12)

# Display plot
print(plot_phq9)
ggsave("figures/phq9_over_time.png", plot_phq9,
       width = 7, height = 4.5, dpi = 300)

# 5. Main analysis: does estradiol modify the SSRI association?
# A participant-level random intercept accounts for repeated observations.
# Time and baseline MADRS are adjustment variables.

#1. Randomized_arm * e2_100: Does the relationship between estradiol and depression severity differ between 
# the SSRI and placebo groups?
#2. randomized_arm * week_since_randomization: Does the change in depression severity over time differ 
# between the SSRI and placebo groups?
# 3. baseline_madrs: Accounts for differences in depression severity at baseline
# 4. (1 | participant_id): Accounts for repeated measurements within participants

model_main <- lmer(
  madrs ~ randomized_arm * e2_100 +
    randomized_arm * week_since_randomization +
    baseline_madrs +
    (1 | participant_id),
  data = study,
  REML = FALSE
)

summary(model_main)

