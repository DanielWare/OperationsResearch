##########################################################
# Exercise 2.22 - Fitness Sneaker Company - MODEL
# From Deterministic Operations Research by David J. Rader
# AMPL model by Daniel Ware, University of Central Oklahoma
##########################################################

########################
# SETS                 #
########################

# NO SETS REQUIRED

########################
# PARAMETERS	       #
########################

# The number of months in the planning horizon
param Months >= 1 integer;

# The demand (in pairs) for sneakers in each month which MUST be met
param Demand {1..Months} >= 0;

# The time taken (in minutes per pair) for one worker to produce one pair of sneakers
param SneakerProductionTime >= 0;

# The number of regular hours that each worker can work each month (hours per worker per month)
param WorkerRegularHours >= 0;

# The maximum number of overtime hours that each worker can work per month (hours per worker per month)
param WorkerMaxOvertimeHours >= 0;

# The workers' salary (in dollars per month per worker) for the regular hours
param WorkerSalary >= 0;

# The workers' overtime pay rate (in dollars per hour per worker)
param OvertimeRate >= 0;

# The cost of hiring a worker (in dollars per worker)
param HiringCost >= 0;

# The cost of firing a worker (in dollars per worker)
param FiringCost >= 0;

# The capacity of storage (in pairs of sneakers)
param InventoryCapacity >= 0;

# The cost of storing sneakers (in dollars per pair per month)
param StorageCost >= 0;

# Inventory at the beginning of the planning period (in pairs of sneakers)
param InitialStorage >= 0;

# Workers at the beginning of the planning period (in workers)
param InitialWorkers >= 0;

#########################
# VARIABLES		#
#########################



#########################
# OBJECTIVE		#
#########################



#########################
# CONSTRAINTS		#
#########################

