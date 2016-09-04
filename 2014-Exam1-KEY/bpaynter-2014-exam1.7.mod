param Cities >= 2;

set Arcs within{1..Cities,1..Cities};

param ArcCost{Arcs};
param PlantCost{1..Cities};
param Population{1..Cities};
param Outflow;
param PlantCapacity;
param ExpandedPlantCity;
param ExpandedPlantSize;
param ExpandedPlantMinimum;
param ExpandedPlantCost;
param PipelineProportion;

var Flow{Arcs} >= 0;
var Plant{1..Cities} binary;
var ExpandedPlant binary;

minimize TotalCost: 
		sum{(i,j) in Arcs} ArcCost[i,j]*Flow[i,j] + sum{i in 1..Cities} PlantCost[i]*Plant[i] 
			+ ExpandedPlant*ExpandedPlantCost;

subject to FlowBalanceA {i in 1..ExpandedPlantCity-1}: 
		sum{(j,i) in Arcs} Flow[j,i] - sum{(i,j) in Arcs} Flow[i,j] 
			<= PlantCapacity*Plant[i] - Population[i]*Outflow;
subject to FlowBalanceB: 
		sum{(j,ExpandedPlantCity) in Arcs} Flow[j,ExpandedPlantCity] 
			- sum{(ExpandedPlantCity,j) in Arcs} Flow[ExpandedPlantCity,j] 
			<= PlantCapacity*Plant[ExpandedPlantCity] - Population[ExpandedPlantCity]*Outflow 
			+ ExpandedPlantSize*ExpandedPlant;
subject to FlowBalanceC {i in ExpandedPlantCity+1..Cities}: 
		sum{(j,i) in Arcs} Flow[j,i] - sum{(i,j) in Arcs} Flow[i,j] 
			<= PlantCapacity*Plant[i] - Population[i]*Outflow;

subject to ExpandedPlantMinLimit: 
		sum{(j,ExpandedPlantCity) in Arcs} Flow[j,ExpandedPlantCity] 
			- sum{(ExpandedPlantCity,j) in Arcs} Flow[ExpandedPlantCity,j] 
			+ Population[ExpandedPlantCity]*Outflow >= ExpandedPlantMinimum*ExpandedPlant;

subject to PlantLimit: sum{i in 1..Cities} Plant[i] <= 4;

subject to PipelineCost: 
		PipelineProportion*(sum{(i,j) in Arcs} ArcCost[i,j]*Flow[i,j] 
			+ sum{i in 1..Cities} PlantCost[i]*Plant[i] + ExpandedPlant*ExpandedPlantCost) 
			<= sum{(i,j) in Arcs} ArcCost[i,j]*Flow[i,j];

subject to ExpandedPlantCityChooseOne: Plant[ExpandedPlantCity] + ExpandedPlant <= 1;
