#########################################
# Exercise 2.12 - Mammoth Oil
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Daniel Ware, University of Central Oklahoma
#########################################

########################
# SETS                 #
########################

set GASOLINES;
set CRUDEOILS;

########################
# PARAMETERS           #
########################

# The price of a barrel of crude oil (in $/barrel) 
param PurchasePrice {CRUDEOILS} >= 0;

# The octane rating of each type of crude
param OctaneRating {CRUDEOILS} >= 0;

# The quality rating of each type of crude
param QualityRating {CRUDEOILS} >= 0;

# The maximum amount of each crude available (in barrels)
param MaxAvailable {CRUDEOILS} >= 0;

# The minimum octane rating required for each gasoline
param MinOctaneRequired {GASOLINES} >= 0;

# The minimum quality rating of each gasoline
param MinQualityRequired {GASOLINES} >= 0;

# The amount of each gasoline that has already been ordered.
param GasDemanded {GASOLINES} >= 0;

# The total capacity of the refinery (in barrels)
param RefineryCapacity >= 0;

# The cost of refining crude (in $/barrel)
param RefiningCost >= 0;


########################
# VARIABLES            #
########################

# The ratio of crude i that goes into making gas j
var crudeToGasRatio {CRUDEOILS, GASOLINES} >= 0;

# The amount of each crude that we purchase each day in barrels
var purchasedCrude {CRUDEOILS} >= 0;

# the amount of each gas that we refine each day in barrels
var gasRefined {GASOLINES} >= 0;

########################
# OBJECTIVE            #
########################

# The objective is to minimize the total cost of creating the required gases
minimize TotalCost: sum {i in CRUDEOILS} purchasedCrude[i] * PurchasePrice[i] - sum {j in GASOLINES} gasRefined[j] * RefiningCost;

#########################
# CONSTRAINTS           #
#########################


# the crude ratio for each gas must be added up to 1
subject to crudeToGasRatioConstraint {j in GASOLINES}: sum {i in CRUDEOILS} crudeToGasRatio[i, j] = 1;

# the crude ratio must make the gas meet min octane rating
subject to minOctaneConstraint {j in GASOLINES}: sum {i in CRUDEOILS} crudeToGasRatio[i,j] * OctaneRating[i] >= MinOctaneRequired[j]; 

# the crude ratio must make the gas meet min quality rating
subject to minQualityConstraint {j in GASOLINES}: sum {i in CRUDEOILS} crudeToGasRatio[i,j] * QualityRating[i] >= MinQualityRequired[j];

# the amount of gas produced must meet required min each day
subject to refiningMinConstraint {j in GASOLINES}: gasRefined[j] >= GasDemanded[j];

# we cannot refine more oil than the factory max each day
subject to refiningCapacityConstraint: sum {j in GASOLINES} gasRefined[j] <= RefineryCapacity;

# we cannot purchase more than the max amount of barrels available each day
subject to maxCrudeAvailableConstraint {i in CRUDEOILS}: purchasedCrude[i] <= MaxAvailable[i]; 

# one barrel of crude make one barrel of gas
subject to gasToCrudeRefiningConstraint {i in CRUDEOILS}: sum {j in GASOLINES} crudeToGasRatio[i,j] * purchasedCrude[i] = gasRefined[j];


