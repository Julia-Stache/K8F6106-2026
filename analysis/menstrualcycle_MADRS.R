# ==========================================
# Menstrual-cycle phase and depression severity
# ==========================================

# Convert menstrual-cycle phase to a factor
repeated_measurements_data$phase <- factor(
  repeated_measurements_data$phase,
  levels = c(
    "Early follicular",
    "Late follicular",
    "Mid luteal",
    "Late luteal"
  )
)

# Fit mixed-effects model
model_phase <- lmer(
  madrs ~ phase + randomized_arm +
    week_since_randomization +
    baseline_madrs +
    (1 | participant_id),
  data = repeated_measurements_data,
  REML = FALSE
)

# Test whether menstrual-cycle phase is significant
anova(model_phase)