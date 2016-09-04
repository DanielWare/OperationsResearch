#########################################
# Exercise 2.4 - Wood Built Bookshelves
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Daniel Ware, University of Central Oklahoma
#########################################


### Declare variables

# The number of unstained Model A bookshelves produced
var UnstainedA >= 0;

# The number of stained Model A bookshelves produced
var StainedA >= 0;

# The number of unstained Model B bookshelves produced
var UnstainedB >= 0;

# The number of stained Model B bookshelves produced
var StainedB >= 0;

# The number of unstained Model C bookshelves produced
var UnstainedC >= 0;

# The number of stained Model C bookshelves produced
var StainedC >= 0;


### Objective Function

# The objective here is to maximize profit
# The profit (in dollars) can be found by taking the revenue, minus the cost,
# multiplied by the number of each

maximize TotalProfit: 	30*UnstainedA + 60*StainedA 
						+ 20*UnstainedB + 40*StainedB
						+ 40*UnstainedC + 75*StainedC;


### Constraints

# The min on model B produced
subject to ModelBMin: UnstainedB + StainedB >= 20;

# The limit on unstained bookshelves produced
subject to UnstainedModelsLimit: UnstainedA + UnstainedB + UnstainedC <= 50;

# The limit on cutting labor
subject to CuttingLaborLimit: 	1*(UnstainedA + StainedA) + 0.5*(UnstainedB + StainedB)
								+ 2*(UnstainedC + StainedC) <= 200;

# The limit on assembling labor
subject to AssemblingLaborLimit:	4*(UnstainedA + StainedA) + 3*(UnstainedB + StainedB)
									+ 6*(UnstainedC + StainedC) <= 700;

# The limit on staining labor
subject to StainingLaborLimit: 	7*StainedA + 5*StainedB + 8*StainedC <= 550;



