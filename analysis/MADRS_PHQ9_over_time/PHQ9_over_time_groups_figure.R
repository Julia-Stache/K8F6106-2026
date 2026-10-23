# ==============================================================
# PHQ9 improvement over time: sertraline versus placebo visualisation
# Uses the cleaned data joined by analysis/joined_datasets.R
# RUN PHQ9_over_time_groups.R FIRST
# ==============================================================

# 1. PHQ-9 mean symptom severity by period (95% CI error bars).
plot_phq9_scores <- ggplot(
  phq9_summary,
  aes(x = visit_period, y = mean_phq9, color = group, group = group)
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  geom_errorbar(
    aes(ymin = mean_phq9 - 1.96 * se_phq9,
        ymax = mean_phq9 + 1.96 * se_phq9),
    width = 0.12
  ) +
  labs(
    title = "PHQ-9 scores over time",
    x = "Follow-up period",
    y = "Mean PHQ-9 score",
    color = "Treatment group"
  ) +
  theme_minimal()

# 2. PHQ-9 mean reduction relative to baseline by period (95% CI).
plot_phq9_improvement <- ggplot(
  phq9_summary,
  aes(x = visit_period, y = mean_improvement, color = group, group = group)
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  geom_errorbar(
    aes(ymin = mean_improvement - 1.96 * se_improvement,
        ymax = mean_improvement + 1.96 * se_improvement),
    width = 0.12
  ) +
  labs(
    title = "Improvement in PHQ-9 scores over time",
    x = "Follow-up period",
    y = "Mean reduction from baseline (PHQ-9 points)",
    color = "Treatment group"
  ) +
  theme_minimal()

# 3. Save both figures for Quarto and display in Positron.
dir.create("report/figures", recursive = TRUE, showWarnings = FALSE)
ggsave("report/figures/phq9_scores_over_time.png",
       plot_phq9_scores, width = 7, height = 4.5, dpi = 300)
ggsave("report/figures/phq9_improvement_over_time.png",
       plot_phq9_improvement, width = 7, height = 4.5, dpi = 300)

print(plot_phq9_scores)
print(plot_phq9_improvement)