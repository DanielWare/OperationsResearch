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

# the ratio of ingredients needed for creating a ton of feed
var feed {INGREDIENTS} >= 0;

########################
# OBJECTIVE            #
########################

# the objective is to minimize the total cost of creating a ton of feed that meets the RDA constraint
# the cost is calculated by multiplying the ratio of each ingredient times its cost
minimize TotalCost: sum {i in INGREDIENTS} feed[i] * Cost[i];

#########################
# CONSTRAINTS           #
#########################

# limit the amount of feed produced to 1 so that feed is a ratio and we only produce 1 ton
subject to ratio: sum{i in INGREDIENTS} feed[i] = 1;

# each nutrition should be greater than min nutrition required
subject to minNutritionConstraint {n in NUTRIENTS}: sum{i in INGREDIENTS} feed[i] * Nutrition[i, n] >= MinNutrition[n]; 

# each nutrition should be less than max nutrition required
subject to maxNutritionConstraint {n in NUTRIENTS}: sum{i in INGREDIENTS} feed[i] * Nutrition[i, n] <= MaxNutrition[n]; 








