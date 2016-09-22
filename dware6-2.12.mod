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

# The ratio of barrels of crudeoil that goes into making barrels of gas
var production {CRUDEOILS, GASOLINES} >= 0;

########################
# OBJECTIVE            #
########################

# The objective is to minimize the total cost of creating the required gases
minimize TotalCost: sum{c in CRUDEOILS} PurchasePrice[c] * sum{g in GASOLINES} production[c,g]
						+ RefiningCost * sum{g in GASOLINES} sum{c in CRUDEOILS} production[c,g];

#########################
# CONSTRAINTS           #
#########################

# the crude ratio must make the gas meet min octane rating
subject to minOctaneConstraint {g in GASOLINES}: sum {c in CRUDEOILS} production[c,g] * OctaneRating[c] >= MinOctaneRequired[g] * sum{c in CRUDEOILS} production[c,g]; 

# the crude ratio must make the gas meet min quality rating
subject to minQualityConstraint {g in GASOLINES}: sum {c in CRUDEOILS} production[c,g] * QualityRating[c] >= MinQualityRequired[g] * sum{c in CRUDEOILS} production[c,g];

# the amount of gas produced must meet required min each day
subject to refiningMinConstraint {g in GASOLINES}: sum{c in CRUDEOILS} production[c,g] >= GasDemanded[g];

# we cannot refine more oil than the factory max each day
subject to refiningCapacityConstraint: sum {c in CRUDEOILS, g in GASOLINES} production[c,g] <= RefineryCapacity;

# we cannot purchase more than the max amount of barrels available each day
subject to maxCrudeAvailableConstraint {c in CRUDEOILS}: sum {g in GASOLINES} production[c,g] <= MaxAvailable[c];



