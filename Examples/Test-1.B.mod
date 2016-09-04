#########################################
# Test-1.B - Crude Oil Refining Model
# AMPL model by Daniel Ware
#########################################

### Declare variables

# The amount of light crude oil processed
var LightCrudeOil >= 0;

# The amount of heavy crude oil processed
var HeavyCrudeOil >= 0;

### Objective Function

# The objective is to minimize the cost. The total cost is $20
# per barrel of LCO and $15 per barrel of HCO.

minimize TotalCost: 20*LightCrudeOil + 15*HeavyCrudeOil;


### Constraints

# min amount of gas to produce
subject to MinGasProduced: 0.4*LightCrudeOil + 0.3*HeavyCrudeOil >= 1000000;

#min amount of kerosine to produce
subject to MinKerosineProduced: 0.25*LightCrudeOil + 0.4*HeavyCrudeOil >= 500000;

# min amount of jet fuel to produce
subject to MinJetFuel: 0.3*LightCrudeOil + 0.22*HeavyCrudeOil >= 300000;

