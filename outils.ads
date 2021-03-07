with ada.text_io, ada.integer_text_io, ada.float_text_io;
use ada.text_io, ada.integer_text_io, ada.float_text_io;


package outils is
   subtype T_mot is string(1..50);

   type T_identite is record
      nom, prenom : T_mot := (others => ' ');
   end record;



end outils;
