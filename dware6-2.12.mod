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


########################
# OBJECTIVE            #
########################


#########################
# CONSTRAINTS           #
#########################

