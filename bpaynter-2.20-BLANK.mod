##########################################################
# Exercise 2.20 - Garbage Can Production - MODEL
# From Deterministic Operations Research by David J. Rader
# by 			, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research I - Fall 2015
##########################################################

########################
# SETS                 #
########################

# The set of garbage can sizes
set CANS;

# The set of manufacturing processes
set PROCESSES;

########################
# PARAMETERS	       #
########################

# The number of months in the planning horizon
param Months >= 1 integer;

# The initial number of each can in storage
param InitialStorage {CANS} >= 0;

# The storage requirements for each can (in storage units)
param StorageSize {CANS} >= 0;

# The amount of plastic used in manufacture
param PlasticRequired {CANS} >= 0;

# The cost of production (in dollars per can)
param ProductionCost {CANS} >= 0;

# The cost of storage (in dollars per can)
param StorageCost {CANS} >= 0;

# The demand for garbage cans
param Demand {CANS, 1..Months} >= 0;

# The time required to produce garbage cans (in hours per can)
param ProductionTime {CANS, PROCESSES} >= 0;

# The total amount of time available in each month (in hours)
param TimeAvailable {PROCESSES} >= 0;

# The storage capacity available (in storage units)
param StorageCapacity >= 0;

# The amount of raw material available each month (in pounds)
param PlasticAvailable >= 0;

#########################
# VARIABLES		#
#########################


#########################
# OBJECTIVE		#
#########################


#########################
# CONSTRAINTS		#
#########################

