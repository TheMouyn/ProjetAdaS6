with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, nt_console;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils, nt_console;


package body gestion_prix is

   function sommePrix(prix1, prix2 : in T_prix) return T_prix is
      somme : T_prix := (0, 0);

   begin -- sommePrix
      somme.ecu := prix1.ecu + prix2.ecu;
      somme.galion := prix1.galion + prix2.galion;

      return somme;

   end sommePrix;

end gestion_prix;
