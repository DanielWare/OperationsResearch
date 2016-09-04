#########################################
# Exercise 2.3 - Film Packaging
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by , University of Central Oklahoma
#########################################

### Declare variables

# The number of square yards of 1mm film to be produced
var ;

# The number of square yards of 3mm film to be produced
var ;

# The number of square yards of 5mm film to be produced
var ;

# The number of square yards of 0.5mm film to be produced
var ;


### Objective Function

# The objective here is to maximize profit
# The profit (in dollars) can be found by taking the revenue, minus the cost, 
# minus the variable cost which itself can be calculated by multiplying the 
# labor cost by the required time.

maximize TotalProfit: ;

### Constraints

# The limit on Machine One's time in minutes
subject to Machine1: ;

# The limit on Machine Two's time in minutes
subject to Machine2: ;

# The limit on Machine Three's time in minutes
subject to Machine3: ;

