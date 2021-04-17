with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, nt_console, aleatoire;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils, nt_console, aleatoire;


package body gestion_prix is

   function sommePrix(prix1, prix2 : in T_prix) return T_prix is
      somme : T_prix := (0, 0);

   begin -- sommePrix
      somme.ecu := prix1.ecu + prix2.ecu;
      somme.galion := prix1.galion + prix2.galion;

      if somme.galion >= 15 then
         somme.ecu := somme.ecu +1;
         somme.galion := somme.galion - 15;

      end if;

      return somme;

   end sommePrix;

-- ----------------------------------------------------------------------------------------------

   procedure afficherPrix(prix : in T_prix) is

   begin -- afficherPrix
      put(prix.ecu, 1);
      put(" ecu(s) et ");
      put(prix.galion, 1);
      put(" galion(s)");


   end afficherPrix;

-- ----------------------------------------------------------------------------------------------

   function multiplicationPrix(nbFois : in integer; prix : in T_prix) return T_prix is
      -- permet de multipliquer un prix par le nbFois
      somme : T_prix := (0, 0);

   begin -- multiplicationPrix
      for i in  1..nbFois loop
         somme := sommePrix(somme, prix);
      end loop;

      return somme;

   end multiplicationPrix;


-- ----------------------------------------------------------------------------------------------

   function ajoutFraisLivraisonReduction(prix : in T_prix) return T_prix is
      -- permet d'ajouter 4% de frais de livraion avec un plafond de 15 ecu
      resultat : T_prix := (0, 0);
      frais : integer := 0;

   begin -- ajoutFraisLivraisonReduction
      -- ajout des frais de livraison
      resultat.galion := prix.galion;
      resultat.galion := resultat.galion + (prix.ecu * 15);

      frais := resultat.galion * 4 / 100;
      if frais > (15*15) then
         frais := (15*15);
      end if;

      resultat.galion := resultat.galion + frais;

      while resultat.galion >= 15 loop
         resultat.ecu := resultat.ecu +1;
         resultat.galion := resultat.galion - 15;
      end loop;


      -- application de la reduction
      if resultat.ecu >= 25 then
         if random <= 0.09 then
            resultat.ecu := resultat.ecu - 5;
         end if;
      end if;


      return resultat;

   end ajoutFraisLivraisonReduction;

-- ----------------------------------------------------------------------------------------------

   function moyennePrix(somme : in T_prix; nbElement : in integer) return T_prix is
      -- permet de faire la moyenne d'un T_prix
      resultat : T_prix := (0, 0);

   begin -- moyennePrix
      resultat.galion := somme.galion;
      resultat.galion := resultat.galion + (somme.ecu * 15);

      resultat.galion := resultat.galion / nbElement;

      while resultat.galion >= 15 loop
         resultat.ecu := resultat.ecu +1;
         resultat.galion := resultat.galion - 15;
      end loop;

      return resultat;


   end moyennePrix;



end gestion_prix;
