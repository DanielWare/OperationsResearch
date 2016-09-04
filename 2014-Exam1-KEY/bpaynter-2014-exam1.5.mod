set Compartments;
set Cargos;


param WeightCapacity{j in Compartments};
param SpaceCapacity{j in Compartments};

param CargoWeight{i in Cargos};
param CargoVolume{i in Cargos};
param Profit{i in Cargos};

param BalanceCoefficients{j in Compartments};

var AcceptedCargo{i in Cargos,j in Compartments} >= 0; #In tons
var Ratio >= 0;

maximize TotalProfit: sum {i in Cargos, j in Compartments} Profit[i] * AcceptedCargo[i,j];

subject to LongAxisBalance {j in Compartments}: 
		sum {i in Cargos} AcceptedCargo[i,j] = Ratio * WeightCapacity[j];
subject to ShortAxisBalanceMax: 
		sum {i in Cargos, j in Compartments} BalanceCoefficients[j] * AcceptedCargo[i,j] <= 0.4;
subject to ShortAxisBalanceMin: 
		sum {i in Cargos, j in Compartments} BalanceCoefficients[j] * AcceptedCargo[i,j] >= -0.4;

subject to Volume {j in Compartments}: sum {i in Cargos} CargoVolume[i]*AcceptedCargo[i,j] <= SpaceCapacity[j];
subject to Availability {i in Cargos}: sum {j in Compartments} AcceptedCargo[i,j] <= CargoWeight[i];
subject to Weight: Ratio <= 1;
