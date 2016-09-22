#########################################
# Exercise 2.14 - Cattle Feed
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Daniel Ware, University of Central Oklahoma
#########################################

########################
# SETS                 #
########################

set INGREDIENTS;
set NUTRIENTS;

########################
# PARAMETERS           #
########################

# The amount of nutrient j in ingredient i (in % of RDA per ton)
param Nutrition {INGREDIENTS, NUTRIENTS} >= 0;

# The cost of each ingredient (in $ per ton)
param Cost {INGREDIENTS} >= 0;

# The minimum amount of each nutrient that must be in 1 ton of feed (in % of RDA)
param MinNutrition {NUTRIENTS} >= 0 <= 100;

# The maximum amount of each nutrient that must be in 1 ton of feed (in % of RDA)
param MaxNutrition {NUTRIENTS} >= 0;

########################
# VARIABLES            #
########################

var 

########################
# OBJECTIVE            #
########################

#minimize TotalCost:

#########################
# CONSTRAINTS           #
#########################

