# ==========================================
# Pairwise comparisons between menstrual-cycle phases
# ==========================================

# Calculate estimated marginal means
phase_means <- emmeans(model_phase, ~ phase)

# Compare all menstrual-cycle phases
phase_comparisons <- pairs(phase_means, adjust = "tukey")

# Display results
summary(phase_comparisons)