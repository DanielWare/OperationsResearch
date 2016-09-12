#########################################
# Exercise 2.4 - Wood Built Bookshelves
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Daniel Ware, University of Central Oklahoma
#########################################


########################
# SETS                 #
########################

# The set of bookshelf models
set MODELS;

# The set of finish types
set TYPES;

# The set of assembly departments
set DEPARTMENTS;

########################
# PARAMETERS           #
########################

# The amount of labor required from each department to build one bookshelf 
# by type and model (in hours)
param LaborRequired {TYPES, MODELS, DEPARTMENTS} >= 0;

# The amount of labor available over the next two weeks 
# by department (in hours)
param LaborAvailable {DEPARTMENTS} >= 0;

# The amount of profit earned from the manufacture and sale of one bookshelf
# by type and model (in dollars)
param Profit {TYPES, MODELS} >= 0;

# The minimum demand by model
param MinDemand {MODELS} >= 0;

# The maximum demand by type
param MaxDemand {TYPES} >= 0;

########################
# VARIABLES            #
########################

# the number of each type of model and type that we must make
var Produce {MODELS, TYPES} >= 0;

########################
# OBJECTIVE            #
########################

# The objective here is to maximize profit
# The profit (in dollars) can be found by taking the revenue, minus the cost,
# multiplied by the number of each Bookshelf

maximize TotalProfit: sum {i in MODELS, j in TYPES} Profit[j,i] * Produce[i,j];


#########################
# CONSTRAINTS           #
#########################

# The minimum amount of each model we can produce
subject to MinModelProduction{i in MODELS}: sum {j in TYPES} Produce[i,j] >= MinDemand[i];

# the Maximum amount of each type we can produce
subject to MaxTypeProduction{j in TYPES}: sum {i in MODELS} Produce[i,j] <= MaxDemand[j];

# the max amount of time each model and type can spend in each department
subject to DeptLaborTime{k in DEPARTMENTS}: sum {i in MODELS, j in TYPES} Produce[i,j] * LaborRequired[j,i,k] <= LaborAvailable[k];
