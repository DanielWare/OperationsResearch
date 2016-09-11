#########################################
# Exercise 2.5 - Sycamore Basketball Company
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Dr. Brad Paynter, University of Central Oklahoma
#########################################

### Declare variables

# The number of poles produced by Sycamore
var PolesProduced >= 0;

# The number of backboards produced by Sycamore
var BackboardsProduced >= 0;

# The number of rims produced by Sycamore
var RimsProduced >= 0;

# The number of poles purchased from contractors
var PolesPurchased >= 0;

# The number of rims purchased from contractors
var RimsPurchased >= 0;

### Objective Function

# We want to minimize total cost (in dollars) of purchasing or producing the required components
minimize TotalCost: 
	  60*PolesProduced + 95*PolesPurchased
	+ 80*BackboardsProduced
	+ 30*RimsProduced + 45*RimsPurchased;

### Constraints

# The time available in department A
subject to DepartmentA:
	2*PolesProduced + 2.5*BackboardsProduced + 1*RimsProduced <= 2000;

# The time available in department B
subject to DepartmentB:
	0.5*PolesProduced + 1*BackboardsProduced + 1.5*RimsProduced <= 900;

# The time available in department C
subject to DepartmentC:
	1*PolesProduced + 2*BackboardsProduced + 1*RimsProduced <= 1500;

# The total demand that must be satisfied by each component
subject to PoleDemand:
	PolesProduced + PolesPurchased >= 500;

subject to BackboardDemand:
	BackboardsProduced >= 500;

subject to RimDemand:
	RimsProduced + RimsPurchased >= 500;
