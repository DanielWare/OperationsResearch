#########################################
# Exercise 2.5B - Sycamore Basketball Company
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Dr. Brad Paynter, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research 1 - Fall 2016
#########################################

########################
# SETS                 #
########################

# The set of production departments
set DEPARTMENTS;

# The set of basketball hoop parts
set PARTS;

# The set of parts sources available to SBC
set SOURCES;

########################
# PARAMETERS           #
########################

# The total demand for basketball hoops
param Demand;

# The production time required by each part in each department 
# (in hours per part)
param ProductionTime {PARTS, DEPARTMENTS};

# The total amount of time available per department (in hours)
param TimeAvailable {DEPARTMENTS};

# The cost of obtaining each part from each source (in dollars)
param PartCost {PARTS, SOURCES};

# The number of each part available from each source
param PartsAvailable {PARTS, SOURCES};

########################
# VARIABLES            #
########################


########################
# OBJECTIVE            #
########################


#########################
# CONSTRAINTS           #
#########################

