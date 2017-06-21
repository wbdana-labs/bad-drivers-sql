CREATE TABLE insurance (
  id INTEGER PRIMARY KEY,
  State TEXT,
  CarPremiumsDollar REAL,
  InsuranceLossesPerDriver REAL
);

CREATE TABLE collisions (
  id INTEGER PRIMARY KEY,
  State TEXT,
  CollisionsBillionMiles REAL,
  PercentageSpeeding REAL,
  PercentageAlcohol REAL,
  PercentageNotDistracted REAL,
  PercentageNoPrior REAL
);
