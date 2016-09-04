#########################################
# Exercise 2.3 - Film Packaging
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Daniel Ware, University of Central Oklahoma
#########################################


### Declare variables

# The number of square yards of 1mm film to be produced
var Film1 >= 0, <= 400;

# The number of square yards of 3mm film to be produced
var Film3 >= 0, <= 250;

# The number of square yards of 5mm film to be produced
var Film5 >= 0, <= 200;

# The number of square yards of 0.5mm film to be produced
var Film0 >= 0, <= 450;

# The minutes that machine 1 was used
var mach1 = 5*Film1 + 4*Film3 + 4*Film5 + 6*Film0;

# The minutes that machine 2 was used
var mach2 = 8*Film1 + 7*Film3 + 5*Film5 + 10*Film0;

# The minutes that machine 3 was user
var mach3 = 9*Film1 + 5*Film3 + 4*Film5 + 6*Film0;


### Objective Function

# The objective here is to maximize profit
# The profit (in dollars) can be found by taking the revenue, minus the cost, 
# minus the variable cost which itself can be calculated by multiplying the 
# labor cost by the required time.

maximize TotalProfit: 	(Film1*(110-30) + Film3*(90-10) + Film5*(60-10) + Film0*(100-20))
						- ((mach1*25 + mach2*25 + mach3*35)/60);


### Constraints

# The limit on Machine One's time in minutes
subject to Machine1: mach1 <= 60*60;

# The limit on Machine Two's time in minutes
subject to Machine2: mach2 <= 60*60;

# The limit on Machine Three's time in minutes
subject to Machine3: mach3 <= 60*60;

