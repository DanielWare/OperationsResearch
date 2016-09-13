#########################################
# Exercise 2.3B - Film Packaging
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Daniel Ware, University of Central Oklahoma
#########################################

########################
# SETS                 #
########################

# The set of film types
set FILMS;

#The set of machines for processing film
set MACHINES;

########################
# PARAMETERS	       #
########################

# The number of hours each machine is available each week
param MachineTimeAvailable {MACHINES} >= 0;

# The revenue (in dollars per square yard) for each film type
param Revenue {FILMS} >= 0;

# The raw material cost (in dollars per square yard) for each type of film
param RawMaterialCost {FILMS} >= 0;

# The processing cost (in dollars per hour) for each machine
param ProcessingCost {MACHINES} >= 0;

# The amount of time required on each machine by each type of film (in minutes per square yard)
param ProcessingTime {FILMS, MACHINES} >= 0;

# The maximum demand for each type of film (in square yards per week)
param Demand {FILMS} >= 0;

#########################
# VARIABLES	            #
#########################


# The amount of each film type to be produced each week
var Manufactored {FILMS} >= 0;

#########################
# OBJECTIVE	            #
#########################


# The objective here is to maximize profit
# The profit (in dollars) can be found by taking the revenue, minus the cost, 
# minus the variable cost which itself can be calculated by multiplying the 
# labor cost by the required time.
# sum of film * (revenue - mat costs) - sum of machine minutes * costs/minutes
maximize TotalProfit: sum {i in FILMS} Manufactored[i] * (Revenue[i] - RawMaterialCost[i]
					-  sum {j in MACHINES} ProcessingCost[j]/60 * ProcessingTime[i,j]);

#########################
# CONSTRAINTS	        #
#########################

# The limit of each machine's time
# time each machine is used for each film
subject to MachineTimeLimit {j in MACHINES}:sum {i in FILMS} ProcessingTime[i,j] * Manufactored[i] 
												<= MachineTimeAvailable[j] * 60;

# The maximum amount of each film we can produce a week
subject to ProductionMinimums {i in FILMS}: Manufactored[i] <= Demand[i];
