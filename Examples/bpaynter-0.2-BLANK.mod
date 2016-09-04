#########################################
# Exercise 0.2 - WorldLight Company
# AMPL model by Dr. Brad Paynter, University of Central Oklahoma
#########################################

### Declare variables

# The number of Product 1 that needs to be produced
var ;

# The number of Product 2 that needs to be produced
var ;

### Objective Function

# The objective is to maximize total profit. 
# The profit for each item is calculated by 
# multiplying the unit profit by the number of units produced
# This is then summed to find the total profit
maximize TotalProfit: ;


### Constraints

# Frame Parts
subject to FrameParts: ;

# Electrical Components
subject to ElectricalComponents: ;












