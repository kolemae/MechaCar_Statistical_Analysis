# load the dplyr package
library(dplyr)

# Import and read in csv
mecha_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_table)

# Determine the p-value and the r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_table))

# Import and read in csv
sus_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# get the mean, median, variance, and standard deviation of the suspension coil’s PSI column
total_summary <- sus_table %>% summarize(Mean_PSI=mean(PSI),
                                          Median_PSI=median(PSI),
                                          Var_PSI=var(PSI),
                                          Std_Dev_PSI=sd(PSI),
                                          Num_Coil=n(), .groups = 'keep')

# group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column
lot_summary <- sus_table  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                         Median_PSI=median(PSI),
                                                                         Var_PSI=var(PSI),
                                                                         Std_Dev_PSI=sd(PSI),
                                                                         Num_Coil=n(), .groups = 'keep')    

# determine if the PSI across all manufacturing lots is statistically different from the population mean
t.test(sus_table$PSI,mu=1500)

# Use subset() argument 3 times to determine if the PSI for each manufacturing lot
# is statistically different from the population mean
lot1 <- subset(sus_table, Manufacturing_Lot=="Lot1")
lot2 <- subset(sus_table, Manufacturing_Lot=="Lot2")
lot3 <- subset(sus_table, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)