##########################################################
# Exercise 2.19 - WellBuilt Cabinet Co. - MODEL
# From Deterministic Operations Research by David J. Rader
# AMPL model by Daniel Ware, University of Central Oklahoma
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

var cutLogs{LOGS} >= 0;

var lumber{GRADES, TYPES} >= 0;

#########################
# OBJECTIVE		#
#########################

minimize Cost: sum{l in LOGS} cutLogs[l] * LogCost[l] 
				+ sum{g in GRADES, t in TYPES} lumber[g,t] * LumberCost[g,t];

#########################
# CONSTRAINTS		#
#########################

## must produce min blanks per week
subject to blanksNeeded: sum{l in LOGS} cutLogs[l] * BlanksPerLog[l] 
							+ sum{g in GRADES, t in TYPES} lumber[g,t] * BlanksPerBoardfoot[g] >= BlanksRequired;

## cant cut more logs than available
subject to maxLogConstraint{l in LOGS}: cutLogs[l] <= LogsAvailable[l];

## cant purchase more lumber than available
subject to maxLumberConstraint{g in GRADES}: sum{t in TYPES} lumber[g,t] <= LumberAvailable[g];

## cant mill more wood than allowed per week
subject to maxMillConstraint: sum{l in LOGS} cutLogs[l] <= MillCapacity;

## cant kiln more boardfeet than allowed per week
subject to maxKilnConstraint: sum{l in LOGS} cutLogs[l] * BoardfeetPerLog[l] 
								+ sum{g in GRADES} lumber[g,'Green'] <= KilnCapacity;



