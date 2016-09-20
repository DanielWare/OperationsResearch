#########################################
# Exercise 2.1B - CT Furniture Company (Set version)
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Dr. Brad Paynter, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research 1 - Fall 2016
#########################################

########################
# SETS                 #
########################

# The set of different kinds of furniture
set FURNITURE;

# The set of different types of finishes
set FINISH;

########################
# PARAMETERS	       #
########################

# The amount of lumber needed to make each furniture type (in board-feet)
param LumberRequired {FURNITURE} >= 0;

# The amount of lumber available (in board-feet)
param LumberAvailable >= 0;

# The cost of lumber (in dollars per board-foot)
param LumberCost >= 0;

# The amount of time required to make each product incl finishing (in hours)
param LaborRequired {FURNITURE, FINISH} >= 0;

# The amount of time available (in hours)
param LaborAvailable >= 0;

# The price each piece of furniture can be sold for
param SalesPrice {FURNITURE, FINISH} >= 0;

# The demand for each type of furniture
param Demand {FURNITURE} >= 0;


#########################
# VARIABLES		#
#########################

# The number of each type of furniture and finish that CT must make
var Produce {FURNITURE, FINISH} >= 0;

#########################
# OBJECTIVE		#
#########################

# The objective is to maximize profit. 
# The profit for each item is calculated by subtracting the cost of lumber from the selling price.
# This is then summed to find the total profit
maximize TotalProfit: 
	sum {i in FURNITURE, j in FINISH} 
		  (SalesPrice[i,j] - LumberCost*LumberRequired[i]) * Produce[i,j];


#########################
# CONSTRAINTS		#
#########################

# Limit on available lumber (in board-feet)
subject to LumberLimit: 
	sum {i in FURNITURE, j in FINISH} 
		LumberRequired[i]*Produce[i,j]
	<= LumberAvailable;

# Limit on available labor (in manhours)
subject to LaborLimit: 
	sum {i in FURNITURE, j in FINISH}
		LaborRequired[i,j]*Produce[i,j]
	<= LaborAvailable;

# Ratio restriction
subject to Ratio: sum {j in FINISH} Produce['Chair',j] >= 2*sum {j in FINISH} Produce['Table',j];

# Special orders on chairs and tables
subject to Orders {i in FURNITURE}: sum {j in FINISH} Produce[i,j] >= Demand[i];
