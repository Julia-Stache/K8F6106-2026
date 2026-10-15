##Clean Data script

#Import data
participants <- read.csv("data/ssri_rct_participants.csv")
assessments <- read.csv("data/ssri_rct_repeated_assessments.csv")

# Explore data 
print(dim(participants))
print(dim(assessments))

# Summary statistics 
summary(participants) #invalid age
summary(assessments)

# Participants per treatment group
print(table(participants$randomized_arm))

# Assessments per menstrual phase
print(table(assessments$phase)) #Category name misspellt once 'late folicular'
print(table(assessments$treatment))

# Correct misspelled menstrual phase & check again
assessments$phase[
  assessments$phase == "Late folicular"
] <- "Late follicular"

print(table(assessments$phase)) 

#Missing values

missing_ass <- data.frame(
  Variable = names(assessments),
  Missing = colSums(is.na(assessments))
)

print(missing_ass)

#Clean data
# Replace invalid ages with NA (we only include ppl between 18-45 y.o)
participants$age_years[
  participants$age_years < 18 |
  participants$age_years > 45
] <- NA

summary(participants$age_years) #looks good

# Replace impossible MADRS scores with NA (valid between 0-60)
assessments$madrs[
  assessments$madrs < 0 |
  assessments$madrs > 60
] <- NA

summary(assessments$madrs)

# Replace impossible PHQ-9 scores with NA (valid between 0-27)
assessments$phq9[
  assessments$phq9 < 0 |
  assessments$phq9 > 27
] <- NA

summary(assessments$phq9)

#Estradiol nrs outside of range
assessments$estradiol_pg_ml[
  assessments$estradiol_pg_ml > 1000
] <- NA

summary(assessments$estradiol_pg_ml)

# Summarise cleaned data
# Age by treatment group
print(aggregate(age_years ~ randomized_arm,
                data = participants, FUN = mean))

# Depression severity by treatment group
print(aggregate(madrs ~ randomized_arm,
                data = assessments, FUN = mean))

# Depression severity by menstrual phase
print(aggregate(madrs ~ phase,
                data = assessments, FUN = mean))

# Missing values after cleaning
print(colSums(is.na(assessments)))

# 6. SAVE CLEANED DATA
write.csv(participants,
          "data/participants_clean.csv",
          row.names = FALSE)

write.csv(assessments,
          "data/assessments_clean.csv",
          row.names = FALSE)