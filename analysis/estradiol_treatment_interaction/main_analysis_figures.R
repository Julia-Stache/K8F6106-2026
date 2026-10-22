
# ==========================================
# Estradiol x treatment interaction
# ==========================================

# Create data for model predictions
estradiol_predictions <- expand.grid(
  randomized_arm = c("Placebo", "SSRI"),
  e2_100 = seq(
    min(study$e2_100, na.rm = TRUE),
    max(study$e2_100, na.rm = TRUE),
    length.out = 100
  ),
  week_since_randomization = mean(study$week_since_randomization),
  baseline_madrs = mean(study$baseline_madrs)
)

# Calculate predicted MADRS scores
estradiol_predictions$predicted_madrs <- predict(
  model_main,
  newdata = estradiol_predictions,
  re.form = NA
)

# Create figure
plot_estradiol <- ggplot(
  estradiol_predictions,
  aes(
    x = e2_100 * 100,
    y = predicted_madrs,
    color = randomized_arm
  )
) +
  geom_line(linewidth = 1.2) +
  scale_color_manual(
    values = c("Placebo" = "#999999",
               "SSRI" = "#D87093")
  ) +
  labs(
    title = "Estradiol and depressive symptom severity",
    subtitle = "Model-predicted MADRS scores by treatment group",
    x = "Estradiol concentration (pg/mL)",
    y = "Predicted MADRS score",
    color = "Treatment group"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    legend.position = "bottom"
  )

# Display figure
print(plot_estradiol)

# Save figure
ggsave(
  "figures/estradiol_treatment_interaction.png",
  plot_estradiol,
  width = 7,
  height = 4.5,
  dpi = 300
)