-- gestion prix version Elisabeth

With ada.text_io, ada.integer_text_io, aleatoire;
Use ada.text_io, ada.integer_text_io, aleatoire;


Package body Gestion_Prix is

   -- Prix total


   Function sommePrix(prix1, prix2 : in T_prix) return T_prix is
      somme : T_prix := (0, 0);

   Begin
      somme.ecu := prix1.ecu + prix2.ecu;
      somme.galion := prix1.galion + prix2.galion;

      if somme.galion >= 15 then
         somme.ecu := somme.ecu +1;
         somme.galion := somme.galion - 15;

      end if;

      return somme;

   End sommePrix;


   -- Visualisation prix en ecu et galion

   Procedure VisuPrixrix(prix : in T_prix) is

   Begin
      put(prix.ecu, 1);
      put(" ecu(s) et ");
      put(prix.galion, 1);
      put(" galion(s)");


   End VisuPrix;


   -- Prix multiplier par nb de fois

   Function MultiplicationPrix(prix : in T_prix; nbFois : in integer ) return T_prix is

      somme : T_prix := (0, 0);

   Begin
      for i in  1..nbFois loop
         somme := sommePrix(somme, prix);
      end loop;

      return somme;

   End MultiplicationPrix;



   -- Reduction 4% de frais livraison

   Function ReductionLivraison(prix : in T_prix) return T_prix is

      resultat : T_prix := (0, 0);
      frais : integer := 0;

   Begin
      -- frais livraison
      resultat.galion := prix.galion;
      resultat.galion := resultat.galion + (prix.ecu*15) ;

      frais := resultat.galion * 4 / 100;
      if frais > (15*15) then
         frais := (15*15);
      end if;

      resultat.galion := resultat.galion + frais;

      While resultat.galion >= 15 loop
         resultat.ecu := resultat.ecu +1;
         resultat.galion := resultat.galion - 15;
      End loop;


      -- application de la reduction
      if resultat.ecu >= 25 then
         if random <= 0.09 then
            resultat.ecu := resultat.ecu - 5;
         end if;
      End if;


      Return resultat;

   End ReductionLivraison;




End Gestion_Prix;
