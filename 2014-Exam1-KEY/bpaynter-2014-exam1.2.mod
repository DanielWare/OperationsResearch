set Doors;
set Rooms;

var Guard{j in Rooms} binary;

param Cover{i in Doors, j in Rooms};


minimize TotalGuards: sum{j in Rooms} Guard[j];

subject to CoverDoors{i in Doors}: sum{j in Rooms} Cover[i,j]*Guard[j] >= 1;
