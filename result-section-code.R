setwd("G:\\MPhil")
AMR <- read.csv("AMR.csv")
AMD <- read.csv("AMD.csv")
AMD$T1gt0 <- AMD$T1min>0

# 3.2. Climate-disease Relationships
summary(lm(AMR ~ I(T78max^2) + T78max, data = AMR)) 
summary(lm(AMR ~ P456, data = AMR)) 
summary(lm(AMR ~ P78, data = AMR)) 
summary(lm(AMR ~ T1min, data = AMR))

summary(lm(AMD ~ P78, data = AMD)) 
summary(lm(AMD ~ P456, data = AMD)) 
summary(lm(AMD ~ T78max, data = AMD)) 
summary(lm(AMD ~ T1min, data = AMD))

summary(lm(AMR ~ P78 + Age.Group, data = AMR)) 
summary(lm(AMR ~ I(T78max^2) + T78max + Age.Group, data = AMR)) 
summary(lm(AMR ~ T1min + Age.Group, data = AMR))
summary(lm(AMR ~ P456 + Age.Group, data = AMR)) 

summary(lm(AMD ~ P78 + Age.Group, data = AMD)) 
summary(lm(AMD ~ T78max + Age.Group, data = AMD))
summary(lm(AMD ~ T1min + Age.Group, data = AMD))
summary(lm(AMD ~ P456 + Age.Group, data = AMD))

# Temperature-only model
#   AMR ~ T78max² + T78max
#   AMD ~ T78max + T1min[>0]
summary(lm(AMR ~ I(T78max^2) + T78max, data = AMR)) 
summary(lm(AMD ~ T78max + T1gt0, data = AMD)) 

# Temperature-precipitation model
# AMR ~ T78max² + T78max + P456 + P78
# AMD ~ T78max + T1min[>0] + P456 + P78
summary(lm(AMR ~ I(T78max^2) + T78max + P456 + P78, data = AMR)) 
summary(lm(AMD ~ T78max + T1gt0 + P456 + P78, data = AMD)) 

