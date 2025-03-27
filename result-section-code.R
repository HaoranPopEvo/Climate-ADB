setwd("G:\\MPhil")
AMR <- read.csv("AMR.csv")
AMD <- read.csv("AMD.csv")


# 3.2. Climate-disease Relationships
summary(lm(AMR ~ I(T35^2) + T35, data = AMR)) 
summary(lm(AMR ~ I(T68max^2) + T68max, data = AMR)) 
summary(lm(AMR ~ P35, data = AMR)) 
summary(lm(AMR ~ P68, data = AMR)) 

summary(lm(AMR ~ P35, data = AMR[AMR$Age.Group=="young",])) 
summary(lm(AMR ~ P35, data = AMR[AMR$Age.Group=="adult",])) 
summary(lm(AMR ~ P68, data = AMR[AMR$Age.Group=="young",])) 
summary(lm(AMR ~ P68, data = AMR[AMR$Age.Group=="adult",])) 

summary(lm(AMD ~ T35, data = AMD)) 
summary(lm(AMD ~ T68max, data = AMD)) 
summary(lm(AMD ~ P35, data = AMD)) 
summary(lm(AMD ~ P68, data = AMD)) 


summary(lm(AMR ~ T911, data = AMR)) 
summary(lm(AMR ~ T911, data = AMR[AMR$Age.Group=="young",])) 
summary(lm(AMR ~ T911, data = AMR[AMR$Age.Group=="adult",])) 
summary(lm(AMR ~ T122min, data = AMR))
summary(lm(AMR ~ T122min, data = AMR[AMR$Age.Group=="young",])) 
summary(lm(AMR ~ T122min, data = AMR[AMR$Age.Group=="adult",])) 
summary(lm(AMD ~ T911, data = AMD)) 
summary(lm(AMD ~ T911, data = AMD[AMD$Age.Group=="young",])) 
summary(lm(AMD ~ T911, data = AMD[AMD$Age.Group=="adult",])) 
summary(lm(AMD ~ T122min, data = AMD)) 
summary(lm(AMD ~ T122min, data = AMD[AMD$Age.Group=="young",])) 
summary(lm(AMD ~ T122min, data = AMD[AMD$Age.Group=="adult",])) 
