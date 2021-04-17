with ada.text_io, ada.integer_text_io, ada.float_text_io, outils;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils;


package gestion_prix is

   type T_prix is record
      ecu, galion : integer := 0;
   end record;


   -- prototype procedure
   function sommePrix(prix1, prix2 : in T_prix) return T_prix;
   procedure afficherPrix(prix : in T_prix);
   function multiplicationPrix(nbFois : in integer; prix : in T_prix) return T_prix;
   function ajoutFraisLivraisonReduction(prix : in T_prix) return T_prix;
   function moyennePrix(somme : in T_prix; nbElement : in integer) return T_prix;


end gestion_prix;
