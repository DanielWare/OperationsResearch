set Plants;
set Processes;
set Regions;
set Products;

param Months;

param Demand{i in 1..Months, j in Products, m in Regions};
param DaysAvailable{i in 1..Months};
param StorageCapacity;
param EndingStorageAmount;
param StorageCost{j in Products};
param ProductionCost{j in Products, k in Plants, l in Processes};
param ProductionRate{j in Products, k in Plants, l in Processes};
param SellingPrice{j in Products, k in Plants, m in Regions};


var Production{i in 1..Months, j in Products, k in Plants, l in Processes} >= 0;
var Sales{i in 1..Months, j in Products, k in Plants, m in Regions} >= 0;
var Storage{i in 0..Months, j in Products, k in Plants} >= 0;

maximize TotalProfit: 
		sum{i in 1..Months, j in Products, k in Plants, m in Regions} SellingPrice[j,k,m]*Sales[i,j,k,m]
			+ sum{i in 1..Months, j in Products, k in Plants, l in Processes} ProductionCost[j,k,l]*Production[i,j,k,l]
			+ sum{i in 1..Months-1, j in Products, k in Plants} StorageCost[j]*Storage[i,j,k];

subject to ProductionBalance {i in 1..Months, j in Products, k in Plants}: 
		(sum{l in Processes} Production[i,j,k,l]) + Storage[i-1,j,k] = (sum{m in Regions} Sales[i,j,k,m]) + Storage[i,j,k];

subject to InitialStorage {j in Products, k in Plants}: Storage[0,j,k] = 0;
subject to EndingStorage {k in Plants}: sum{j in Products} Storage[Months,j,k] = EndingStorageAmount;

subject to DemandLimit {i in 1..Months,j in Products, m in Regions}: 
		sum{k in Plants} Sales[i,j,k,m] <= Demand[i,j,m];
subject to ProductionLimit {i in 1..Months, k in Plants, l in Processes}: 
		sum{j in Products} (1/ProductionRate[j,k,l])*Production[i,j,k,l] <= DaysAvailable[i];
subject to StorageLimit {i in 1..Months, k in Plants}: sum{j in Products} Storage[i,j,k] <= StorageCapacity;
