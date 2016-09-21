##########################################################
# Exercise 2.19 - WellBuilt Cabinet Co. - MODEL
# From Deterministic Operations Research by David J. Rader
# by Dr. Bradley Paynter, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research I - Fall 2015
##########################################################

########################
# SETS                 #
########################

# The set of all log diameters
set LOGS;

# The set of lumber grades that can be purchased
set GRADES;

# The set of lumber types
set TYPES;

########################
# PARAMETERS	       #
########################

# The cost (in dollars per log) of logs
param LogCost {LOGS} >= 0;

# The number of blanks produced per log
param BlanksPerLog {LOGS} >= 0;

# The number of boardfeet of lumber produced per log
param BoardfeetPerLog {LOGS} >= 0;

# The number of logs available for purchase.
param LogsAvailable {LOGS} >= 0;

# The cost (in dollars per boardfoot) of purchased lumber
param LumberCost {GRADES, TYPES} >= 0;

# The number of blanks produced per boardfoot of lumber
param BlanksPerBoardfoot {GRADES} >= 0;

# The number of boardfeet of lumber avialable for purchase
param LumberAvailable {GRADES} >= 0;

# The capacity (in logs) of the company mill
param MillCapacity >= 0;

# The capacity (in boardfeet) of the company kiln
param KilnCapacity >= 0;

# The number of blanks required
param BlanksRequired >= 0;

#########################
# VARIABLES		#
#########################


#########################
# OBJECTIVE		#
#########################


#########################
# CONSTRAINTS		#
#########################

