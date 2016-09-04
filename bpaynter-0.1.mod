#########################################
# Exercise 0.1 - Whitt Window Company
# AMPL model by Dr. Brad Paynter, University of Central Oklahoma
#########################################

### Declare variables

# The number of wood-framed windows WWC must make per day
var WoodWindows >= 0;

# The number of aluminum windows WWC must make per day
var AluminumWindows >= 0;

### Objective Function

# The objective is to maximize daily profit. 
# The profit for each item is calculated by 
# multiplying the unit profit by the number of units produced
# This is then summed to find the total profit
maximize DailyProfit: 180*WoodWindows + 90*AluminumWindows;


### Constraints

# Doug's Production Limit
subject to WoodFrames: WoodWindows <= 6;

# Linda's Production Limit
subject to AluminumFrames: AluminumWindows <= 4;

# Bob's Production Limit
subject to Glass: 6*WoodWindows + 8*AluminumWindows <= 48;












