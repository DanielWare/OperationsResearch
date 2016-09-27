##########################################################
# Exercise 2.20 - Garbage Can Production - MODEL
# From Deterministic Operations Research by David J. Rader
# AMPL model by Daniel Ware, University of Central Oklahoma
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

# the amount of Cans (CANS) we produce each month (1..Months)
var producedCans{CANS, 1..Months} >= 0;

# the amoung of Cans (CANS) we store in month (1..Months)
var storedCans {CANS, 1..Months} >= 0;

#########################
# OBJECTIVE		#
#########################

# the objective is to minimize the cost of producing and storing cans while meeting the minimum production demands
# we calculate the cost by summing the production cost * produced cans plus the storage cost * storedCans
minimize Cost: sum{c in CANS, m in 1..Months} producedCans[c,m] * ProductionCost[c] + sum{c in CANS, m in 1..Months} storedCans[c,m] * StorageCost[c];

#########################
# CONSTRAINTS		#
#########################

## the monthly demand must be met
subject to firstMonthDemandConstraint{c in CANS}: producedCans[c, 1] + InitialStorage[c] - storedCans[c,1] >= Demand[c, 1];

subject to afterFirstMonthDemandConstraint{c in CANS, m in 2..Months}: storedCans[c,m-1] + producedCans[c,m] - storedCans[c,m] >= Demand[c,m];

## the monthly storage capacity cannot be exceeded
subject to monthlyStorageCapacity{m in 1..Months}: sum {c in CANS} storedCans[c,m] * StorageSize[c] <= StorageCapacity;

## we cant use more plastic per month than available
subject to plasticConstraint{m in 1..Months}: sum{c in CANS} producedCans[c,m] * PlasticRequired[c] <= PlasticAvailable;

## we cant use more hours than available
subject to hoursAvailableConstraint{m in 1..Months, p in PROCESSES}: sum {c in CANS} producedCans[c,m] * ProductionTime[c,p] <= TimeAvailable[p];







