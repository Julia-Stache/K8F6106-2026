##Clean Data script

#Import data
participants <- read.csv("data/ssri_rct_participants.csv")
assessments <- read.csv("data/ssri_rct_repeated_assessments.csv")

## Explore data
print(dim(participants))
print(dim(assessments))

# Summary statistics 
summary(participants)
summary(assessments)

# Participants per treatment group
print(table(participants$randomized_arm))

# Assessments per menstrual phase
print(table(assessments$phase)) #Category name misspellt once 'late folicular'

#Filter out outliers


