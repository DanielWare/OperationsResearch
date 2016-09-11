#########################################
# Exercise 2.1 - CT Furniture Company
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Dr. Brad Paynter, University of Central Oklahoma
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
maximize TotalProfit: (55 - 10 * 2)*FinishedChairs + (30 - 10 * 2)*UnfinishedChairs
				+ (120 - 25 * 2)*FinishedTables + (80 - 25 * 2)*UnfinishedTables;


### Constraints

# Limit on available lumber (in board-feet)
subject to LumberLimit: 10*(FinishedChairs + UnfinishedChairs) 
				+ 25*(FinishedTables + UnfinishedTables) <= 10000;

# Limit on available labor (in manhours)
subject to LaborLimit: (2 + 6)*FinishedChairs + 2*UnfinishedChairs 
				+ (4 + 8)*FinishedTables + 4*UnfinishedTables <= 2500;

# Ratio restriction
subject to Ratio: FinishedChairs + UnfinishedChairs >= 2*(FinishedTables + UnfinishedTables);

# Special orders on chairs and tables
subject to ChairOrders: FinishedChairs + UnfinishedChairs >= 450;
subject to TableOrders: FinishedTables + UnfinishedTables >= 200;
