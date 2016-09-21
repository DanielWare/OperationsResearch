##########################################################
# VBJ Inc Margerine Production model
# by Dr. Bradley Paynter, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research I - Fall 2015
##########################################################

########################
# SETS                 #
########################

# The set of raw oils
set OILS;

# The set of margerine products
set PRODUCTS;

########################
# PARAMETERS	       #
########################

# The number of months over which we are planning
param Months >= 1 integer;

# The price for which each margerine product is sold
param SellingPrice {PRODUCTS} >= 0;

# The hardness factor of raw oils
param RawHardness {OILS} >= 0;

# The minimum required hardness of each margerine produced
param MinHardness {PRODUCTS} >= 0;

# The maximum required hardness of each margerine produced
param MaxHardness {p in PRODUCTS} >= MinHardness[p];

# The limit (in tons) to the amount of each oil that can be 
# stored from one month to the next
param StorageLimit >= 0;

# The monthly total refining capacity for raw oil (in tons)
param RefiningCapacity >= 0;

# The cost (in dollars per ton per month) of storing raw oil
param StorageCost >= 0;

# The required production ratio of margerines produced
param ProductionRatio {PRODUCTS};

# The cost (in dollars per ton) of raw oil for delivery in each month
param OilCost {OILS, 1..Months} >= 0;

# The initial amount of oil (in tons) in storage
param InitialStorage >= 0;

#########################
# VARIABLES		#
#########################

# The amount of oil purchased (in tons) in each month
var OilPurchased {OILS, 1..Months} >= 0;

# The amount (in tons) of each oil stored from each month to the next
var OilStored {OILS, 0..Months} >= 0 <= 1000;

# The amount (in tons) of each oil used to make each product in each month
var OilRefined {OILS, 1..Months, PRODUCTS} >= 0;

#########################
# OBJECTIVE		#
#########################

# The Total Profit (in dollars) generated from margerine over the period.
# This is calculated from Total Revenue - Cost of Oil - Cost of Storage
maximize TotalProfit: 
		sum {p in PRODUCTS, r in OILS, m in 1..Months} SellingPrice[p]*OilRefined[r,m,p]
			- sum {r in OILS, m in 1..Months} StorageCost*OilStored[r,m]
			- sum {r in OILS, m in 1..Months} OilCost[r,m]*OilPurchased[r,m];

#########################
# CONSTRAINTS		#
#########################

# Balancing the flow for each month. 
# Oil refined plus oil stored for next month cannot exceed oil purchased plus oil stored from last month.
subject to FlowBalance {r in OILS, m in 1..Months}: 
		OilPurchased[r,m] + OilStored[r,m-1] - OilStored[r,m] 
					- sum {p in PRODUCTS} OilRefined[r,m,p] >= 0;

# Minimum hardness factor
subject to MinHardnessLimit {p in PRODUCTS, m in 1..Months}: 
		sum {r in OILS} RawHardness[r]*OilRefined[r,m,p]
				>= MinHardness[p]*sum {r in OILS} OilRefined[r,m,p];

# Maximum hardness factor
subject to MaxHardnessLimit {p in PRODUCTS, m in 1..Months}:
                sum {r in OILS} RawHardness[r]*OilRefined[r,m,p]
                        	<= MaxHardness[p]*sum {r in OILS} OilRefined[r,m,p];

# Limit due to refining capacity
subject to RefiningLimit {m in 1..Months}: 
		sum {r in OILS, p in PRODUCTS} OilRefined[r,m,p] <= RefiningCapacity;


# Ratio of products produced
subject to ProductionRatioConstraint {m in 1..Months}:
		sum {r in OILS, p in PRODUCTS} ProductionRatio[p]*OilRefined[r,m,p] >= 0;

# Initial Storage
subject to InitialStorageConstraint {r in OILS}:
		OilStored[r,0] = InitialStorage;

# Final Storage
subject to FinalStorageConstraint {r in OILS}:
		OilStored[r,Months] = InitialStorage;
