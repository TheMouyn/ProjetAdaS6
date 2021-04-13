with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, nt_console;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils, nt_console;


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

end gestion_prix;
