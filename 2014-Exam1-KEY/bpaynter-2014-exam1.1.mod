var LightCrude >= 0;
var HeavyCrude >= 0;

minimize TotalCost: 20*LightCrude + 15*HeavyCrude;

subject to SupplierAgreement: HeavyCrude + 100000 <= LightCrude;
subject to GasolineDemand: 0.3*LightCrude + 0.2*HeavyCrude >= 1000000;
subject to DieselDemand: 0.3*LightCrude + 0.3*HeavyCrude >= 750000;
subject to KeroseneDemand: 0.15*LightCrude + 0.3*HeavyCrude >= 500000;
subject to JetFuelDemand: 0.2*LightCrude + 0.12*HeavyCrude >= 300000;
