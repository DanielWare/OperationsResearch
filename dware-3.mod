################################
# dware-3.mod primo insurance company
# by daniel ware
################################

## VARIABLES

# the number of special risk insurance unit sold
var specialRiskIns >= 0;

# the number of mortgage units sold
var mortgage >= 0;

## Objective Function

# The Objective is to maximize profit. The profit is $5 times the number of special risk insurance units sold
# plus $2 times the number of mortgage units sold

maximize TotalProfit: 5*specialRiskIns+2*mortgage;

## CONSTRAINTS

# the number of hours spent underwriting
subject to underwritingConstraint: 3*specialRiskIns + 2*mortgage <= 2400;

# the number of hours spent in Admin
subject to adminConstraint: 0*specialRiskIns + 1*mortgage <= 800;

# the number of hours spent in claims
subject to claimsConstraint: 2*specialRiskIns + 0*mortgage <= 1200;
