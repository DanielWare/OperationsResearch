#########################################
# Exercise 2.1 - CT Furniture Company
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by , University of Central Oklahoma
#########################################

### Declare variables

# The number of finished chairs CT must make
var FinishedChairs >= 0;

# The number of unfinished chairs CT must make
var UnfinishedChairs >= 0;

# The number of finished tables CT must make
var FinishedTables >= 0;

# The number of unfinished tables CT must make
var UnfinishedTables >= 0;



### Objective Function

# The objective is to maximize profit. 
# The profit for each item is calculated by subtracting the cost of lumber from the selling price.
# This is then summed to find the total profit
maximize TotalProfit: ;


### Constraints

# Limit on available lumber (in board-feet)
subject to LumberLimit: ;

# Limit on available labor (in manhours)
subject to LaborLimit: ;

# Ratio restriction
subject to Ratio: ;

# Special orders on chairs and tables
subject to ChairOrders: ;
subject to TableOrders: ;
