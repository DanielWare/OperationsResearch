#########################################
# Exercise 2.5 - Sycamore Basketball Company
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Daniel Ware, University of Central Oklahoma
#########################################


## VARIABLES

#the number of manufactured poles
var mPoles >= 0;

#the number of manufactured backboards
var mBackboards >= 0;

#the number of manufactured rims
var mRims >= 0;

#the number of purchased poles
var pPoles >= 0;

#the number of manufactured rims
var pRims >= 0;


## OBJECTIVE FUNCTION

# The objective is to minimize the cost of producing basketball goals.
# the cost is calculated by summing the cost associated with acquiring
# each component times the number of each component we have
minimize TotalCost: 60*mPoles + 80*mBackboards + 30*mRims
					+ 95*pPoles + 45*pRims;


## CONSTRAINTS

# Limit on available labor hours in department A
subject to DeptALabor: 2*mPoles + 2.5*mBackboards + 1*mRims <= 2000;

# Limit on available labor hours in department B
subject to DeptBLabor: 0.5*mPoles + 1*mBackboards + 1.5*mRims <= 900;

# Limit on available labor hours in department C
subject to DeptCLabor: 1*mPoles + 2*mBackboards + 1*mRims <= 1500;

# minimum number of basketball hoops we need to have to meet demand
subject to ProductionDemand: ((mPoles + pPoles) + mBackboards + (mRims + pRims))/3 >= 500;
