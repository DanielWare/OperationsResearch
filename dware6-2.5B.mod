#########################################
# Exercise 2.5 - Sycamore Basketball Company
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Daniel Ware, University of Central Oklahoma
#########################################

########################
# SETS                 #
########################

# The set of production departments
set DEPARTMENTS;

# The set of basketball hoop parts
set PARTS;

# The set of parts sources available to SBC
set SOURCES;

########################
# PARAMETERS           #
########################

# The total demand for basketball hoops
param Demand;

# The production time required by each part in each department 
# (in hours per part)
param ProductionTime {PARTS, DEPARTMENTS};

# The total amount of time available per department (in hours)
param TimeAvailable {DEPARTMENTS};

# The cost of obtaining each part from each source (in dollars)
param PartCost {PARTS, SOURCES};

# The number of each part available from each source
param PartsAvailable {PARTS, SOURCES};

########################
# VARIABLES            #
########################

# the amount of each part we produce for out bball goals
var Produce {PARTS, SOURCES} >= 0;

########################
# OBJECTIVE            #
########################

# The objective is to minimize the cost of producing basketball goals.
# the cost is calculated by summing the cost associated with acquiring
# each component times the number of each component we have
minimize TotalCost: sum {i in PARTS, j in SOURCES} Produce[i,j] * PartCost[i,j];

#########################
# CONSTRAINTS           #
#########################

# limit on the available hours in each department
subject to DeptLabor {k in DEPARTMENTS}: sum {i in PARTS} Produce[i, 'Make'] * ProductionTime[i,k] <= TimeAvailable[k];

#total demand on each part
subject to PartDemand {i in PARTS}: sum {j in SOURCES} Produce[i,j] >= Demand;

