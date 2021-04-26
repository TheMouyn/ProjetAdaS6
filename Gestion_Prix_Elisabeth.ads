-- gestion prix version Elisabeth



Package Gestion_prix is

   Type T_prix is record
      ecu, galion : integer := 0;
   end record;



   Function SommePrix(prix1, prix2 : in T_prix) return T_prix;

   Procedure VisuPrix(prix : in T_prix);

   Function MultiplicationPrix(nbFois : in integer; prix : in T_prix) return T_prix;

   Function ReductionLivraison(prix : in T_prix) return T_prix;


End Gestion_prix;
