param NumProducts;

param UnitProfit{1..NumProducts};
param UnitLabor{1..NumProducts};
param UnitRawMaterials{1..NumProducts};
param MaxLabor;
param MaxRawMaterials;
param Prod3Min;
param M;

var ProductionLevel{1..NumProducts} >= 0 integer;
var Prod3 binary;

maximize TotalProfit: sum{i in 1..NumProducts} UnitProfit[i]*ProductionLevel[i];

subject to Labor: sum{i in 1..NumProducts} UnitLabor[i]*ProductionLevel[i] <= MaxLabor;
subject to RawMaterials: sum{i in 1..NumProducts} UnitRawMaterials[i]*ProductionLevel[i] <= MaxRawMaterials;
subject to Prod3No: ProductionLevel[3] <= M*Prod3;
subject to Prod3Yes: ProductionLevel[3] >= 5*Prod3;
subject to Prod4: ProductionLevel[4] <= M*ProductionLevel[1];
