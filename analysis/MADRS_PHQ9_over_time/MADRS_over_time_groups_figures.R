# ==============================================================
# MADRS improvement over time: sertraline versus placebo visualisation
# Uses the cleaned data joined by analysis/joined_datasets.R
# RUN MADRS_over_time_groups.R FIRST
# ==============================================================

# 1. Plot and save a figure showing average MADRS severity over time.
plot_scores <- ggplot(
  madrs_summary,
  aes(x = visit_period, y = mean_madrs, color = group, group = group)
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  geom_errorbar(
    aes(ymin = mean_madrs - 1.96 * se_madrs,
        ymax = mean_madrs + 1.96 * se_madrs),
    width = 0.12
  ) +
  labs(
    title = "MADRS scores over time",
    x = "Follow-up period",
    y = "Mean MADRS score",
    color = "Treatment group"
  ) +
  theme_minimal()

# 2. Plot and save figure showing change from baseline.
plot_improvement <- ggplot(
  madrs_summary,
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
    title = "Improvement in MADRS scores over time",
    x = "Follow-up period",
    y = "Mean reduction from baseline (MADRS points)",
    color = "Treatment group"
  ) +
  theme_minimal()

dir.create("report/figures", recursive = TRUE, showWarnings = FALSE)
ggsave("report/figures/madrs_scores_over_time.png",
       plot_scores, width = 7, height = 4.5, dpi = 300)
ggsave("report/figures/madrs_improvement_over_time.png",
       plot_improvement, width = 7, height = 4.5, dpi = 300)

print(plot_scores)
print(plot_improvement)