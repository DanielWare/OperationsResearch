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
# VARIABLES #
#########################

# Produced shoes
var producedShoes {1..Months} >= 0;

# stored shoes
var storedShoes {1..Months} >= 0 integer;

# number of employees
var employees {1..Months} >= 0 integer;

# number of overtime hours used
var overtime {1..Months} >= 0;

# hired employees
var hired {1..Months} >= 0 integer;

# fired employees
var fired {1..Months} >= 0 integer;

#########################
# OBJECTIVE #
#########################

# the objective is to minimize the cost of shoe production
# the cost is calculated from employee hours worked * salary + hired * hiring cost + fired * fired cost
# plus overtime hours * overtime rate + stored shoes * storage costs
minimize Cost: 	sum{m in 1..Months}employees[m] * WorkerSalary 
				+ sum{m in 1..Months}hired[m] * HiringCost
				+ sum{m in 1..Months}fired[m] * FiringCost
				+ sum{m in 1..Months}overtime[m] * OvertimeRate
				+ sum{m in 1..Months}storedShoes[m] * StorageCost;

 
#########################
# CONSTRAINTS #
#########################

# employees hired - fired + employees from last month = employees for the month
	#first month
subject to firstMonthEmployees: InitialWorkers + hired[1] - fired[1] = employees[1];
	#rest of the months
subject to restMonthsEmployees{m in 2..Months}: employees[m-1] + hired[m] - fired[m] = employees[m];

# demand for the month must be met
	#first month
subject to firstMonthDemand: InitialStorage + producedShoes[1] - storedShoes[1] >= Demand[1];
	#rest of the months
subject to restMonthsDemand{m in 2..Months}: storedShoes[m-1] + producedShoes[m] - storedShoes[m] >= Demand[m];

# storage capacity
subject to storageCapacity{m in 1..Months}: storedShoes[m] <= InventoryCapacity;

# max overtime hours
subject to maxOvertimeHours{m in 1..Months}: overtime[m] <= WorkerMaxOvertimeHours;

# shoes produced cannont exceed employee production per month
subject to shoeToEmployeeRatio{m in 1..Months}: producedShoes[m] <= ((employees[m] * WorkerRegularHours) + overtime[m]) * (60/SneakerProductionTime);


