set Housing;

param UnitCost{i in Housing};
param MinUnits{i in Housing};
param MaxUnits{i in Housing};
param UnitSize{i in Housing};
param MaxTotalUnits;
param Type1{i in Housing};
param Type1MaxPercent;
param MaxTotalSize;

var Units{i in Housing} >= 0;

minimize TotalCost: sum{i in Housing} UnitCost[i]*Units[i];

subject to Area: sum{i in Housing} UnitSize[i]*Units[i] = MaxTotalSize;
subject to TotalUnits: sum{i in Housing} Units[i] <= MaxTotalUnits;
subject to Ratio: sum{i in Housing} Type1[i]*UnitSize[i]*Units[i] <= Type1MaxPercent * sum{i in Housing} UnitSize[i]*Units[i];
subject to LowerLimits{i in Housing}: Units[i] >= MinUnits[i];
subject to UpperLimits{i in Housing}: Units[i] <= MaxUnits[i];
