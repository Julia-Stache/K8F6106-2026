# ===============================================
# Visualisation of depressive symptoms over time
# ===============================================

plot_madrs <- ggplot(summary_table,
                     aes(x = visit_period, y = mean_madrs,
                         group = randomized_arm, color = randomized_arm)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2.5) +
  labs(x = "Number of weeks since randomisation", y = "Mean MADRS score",
       color = "Group", title = "Depressive symptoms during the trial") +
  theme_minimal(base_size = 12)
# Display plot & save
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
# Display plot & save
print(plot_phq9)
ggsave("figures/phq9_over_time.png", plot_phq9,
       width = 7, height = 4.5, dpi = 300)