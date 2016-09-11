#########################################
# Exercise 2.4 - Wood Built Bookshelves
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Dr. Brad Paynter, University of Central Oklahoma
#########################################

### Declare variables

# The number of unstained Model A bookshelves to be produced
var UnstainedA >= 0;
# The number of unstained Model B bookshelves to be produced
var UnstainedB >= 0;
# The number of unstained Model C bookshelves to be produced
var UnstainedC >= 0;

# The number of stained Model A bookshelves to be produced
var StainedA >= 0;
# The number of stained Model B bookshelves to be produced
var StainedB >= 0;
# The number of stained Model C bookshelves to be produced
var StainedC >= 0;


### Objective Function

# We want to maximize total profit
maximize TotalProfit: 
	60*StainedA + 40*StainedB + 75*StainedC
		+ 30*UnstainedA + 20*UnstainedB + 40*UnstainedC;


### Constraints

# The labor limit in the Cutting Department
subject to CuttingLimit: 
	1*(StainedA + UnstainedA) + 0.5*(StainedB + UnstainedB)
		+ 2*(StainedC + UnstainedC)
		<= 200;
		
# The labor limit in the Assembling Department
subject to AssemblingLimit:
	4*(StainedA + UnstainedA) + 3*(StainedB + UnstainedB)
		+ 6*(StainedC + UnstainedC)
		<= 700;
		
# The labor limit in the Staining Department
subject to StainingLimit:
	7*StainedA + 5*StainedB + 8*StainedC
		<= 550;
		
# The minimum demand for Model B
subject to ModelBDemand:
	StainedB + UnstainedB >= 20;
	
# The limit on unstained production
subject to UnstainedLimit:
	UnstainedA + UnstainedB + UnstainedC <= 50;
