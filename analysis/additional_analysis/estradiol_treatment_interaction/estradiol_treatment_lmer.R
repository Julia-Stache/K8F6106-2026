# =================================
# Treatment response and estradiol
# =================================

# Does estradiol modify the SSRI association?
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
  data = repeated_measurements_data,
  REML = FALSE
)

summary(model_main)

