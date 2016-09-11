#########################################
# Exercise 2.3 - Film Packaging
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Dr. Brad Paynter, University of Central Oklahoma
#########################################

### Declare variables

# The number of square yards of 1mm film to be produced
var OneMilFilm >= 0 <= 400;

# The number of square yards of 3mm film to be produced
var ThreeMilFilm >= 0 <= 250;

# The number of square yards of 5mm film to be produced
var FiveMilFilm >= 0 <= 200;

# The number of square yards of 0.5mm film to be produced
var HalfMilFilm >= 0 <= 450;


### Objective Function

# The objective here is to maximize profit
# The profit (in dollars) can be found by taking the revenue, minus the cost, 
# minus the variable cost which itself can be calculated by multiplying the 
# labor cost by the required time.

maximize TotalProfit:	(110 - 30 - 25/60*(5+8) - 35/60*9)*OneMilFilm
			+ (90 - 10 - 25/60*(4+7) - 35/60*5)*ThreeMilFilm
			+ (60 - 10 - 25/60*(4+5) - 35/60*4)*FiveMilFilm
			+ (100 - 20 - 25/60*(6+10) - 35/60*6)*HalfMilFilm;

### Constraints

# The limit on Machine One's time in minutes
subject to Machine1: 
	5*OneMilFilm + 4*ThreeMilFilm + 4*FiveMilFilm + 6*HalfMilFilm <= 60*60;

# The limit on Machine Two's time in minutes
subject to Machine2: 
	8*OneMilFilm + 7*ThreeMilFilm + 5*FiveMilFilm + 10*HalfMilFilm <= 60*60;

# The limit on Machine Three's time in minutes
subject to Machine3: 
	9*OneMilFilm + 5*ThreeMilFilm + 4*FiveMilFilm + 6*HalfMilFilm <= 60*60;

