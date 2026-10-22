# ===========================================================
# Visualisation of MADRS scores across menstrual-cycle phases
# ===========================================================

# Estimated marginal means for menstrual-cycle phase
phase_emmeans <- emmeans(model_phase, ~ phase)

# Turn results into a data frame
phase_plot_data <- as.data.frame(phase_emmeans)

# Create figure
plot_phase <- ggplot(
  phase_plot_data,
  aes(x = phase, y = emmean, group = 1)
) +
  geom_line(linewidth = 0.8, color = "#D87093") +
  geom_point(size = 3, color = "#D87093") +
  geom_errorbar(
    aes(ymin = lower.CL, ymax = upper.CL),
    width = 0.15,
    color = "#D87093"
  ) +
  labs(
    title = "Adjusted MADRS scores across menstrual-cycle phases",
    x = "Menstrual-cycle phase",
    y = "Adjusted mean MADRS score"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 20, hjust = 1)
  )

# Display figure
print(plot_phase)

# Save figure
ggsave(
  "figures/madrs_by_phase.png",
  plot_phase,
  width = 7,
  height = 4.5,
  dpi = 300
)