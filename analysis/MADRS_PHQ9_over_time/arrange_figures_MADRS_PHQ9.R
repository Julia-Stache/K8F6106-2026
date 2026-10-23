# ======================================================================
# Side-by-side MADRS and PHQ-9 figures for the Quarto report
# CAN ONLY BE RUN AFTER RUNNING THE (...)_figure.R scripts in this folder
# ======================================================================

# 1. Reuse the plots created by the existing MADRS & PHQ9 analysis scripts
source("analysis/MADRS_PHQ9_over_time/MADRS_over_time_groups.R")
madrs_scores <- plot_scores
madrs_improvement <- plot_improvement

source("analysis/MADRS_PHQ9_over_time/PHQ9_over_time_groups.R")
phq9_scores <- plot_phq9_scores
phq9_improvement <- plot_phq9_improvement

# 2. Changes to labels
# Shorten x-axis labels
week_labels <- c(
  "Weeks 0–4" = "0–4",
  "Weeks 4–8" = "4–8",
  "Weeks 8–13" = "8–13"
)

# Update MADRS plot
madrs_scores <- madrs_scores +
  labs(
    title = "MADRS",
    x = "Weeks since randomization"
  ) +
  scale_x_discrete(labels = week_labels)

# Update PHQ-9 plot
phq9_scores <- phq9_scores +
  labs(
    title = "PHQ-9",
    x = "Weeks since randomisation"
  ) +
  scale_x_discrete(labels = week_labels)

# 3. Combine plots using patchwork
combined_scores <- patchwork::wrap_plots(
  madrs_scores,
  phq9_scores,
  ncol = 2,
  guides = "collect",
  axis_titles = "collect_x"
) +
  patchwork::plot_annotation(
    title = "Depressive symptom severity over time",
    theme = theme(
      plot.title = element_text(face = "bold", size = 15)
    )
  )

# Display
print(combined_scores)

# 4. Save
ggsave(
  "report/figures/madrs_phq9_scores_side_by_side.png",
  combined_scores,
  width = 12,
  height = 5,
  dpi = 300
)