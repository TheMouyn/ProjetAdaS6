with ada.text_io, ada.integer_text_io, ada.float_text_io, outils;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils;


package body gestion_personnel is

   procedure iniPersonnel(tete : in out T_PteurPersonnel) is
      -- permet de faire de la liste personnel avec les donnees de test

      procedure ajoutListe(tete : in out T_PteurPersonnel; identite : in T_identite; pseudo : in T_mot; categorie : in T_categorie; nuMagique, emprinte : in integer) is
         -- permet ajout en tete

      begin -- ajoutListe
         if tete = null then
            tete := new T_cellPersonnel'((identite, pseudo, categorie, nuMagique, emprinte, FALSE), null);

         else
            tete := new T_cellPersonnel'((identite, pseudo, categorie, nuMagique, emprinte, FALSE), tete);

         end if;

      end ajoutListe;

      leNom, lePrenom, lePseudo : T_mot := (others => ' ');

   begin -- iniPersonnel
      leNom(1..3) := "NOM";
      lePrenom(1..6) := "PRENOM";
      lePseudo(1..8) := "MANDRAKE";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, grandMagicien, 257, 959);



      lePseudo := (others => ' ');
      lePseudo(1..5) := "GIMLI";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, nain, 435, 1117);

      lePseudo := (others => ' ');
      lePseudo(1..6) := "JOYEUX";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, nain, 731, 1302);

      lePseudo := (others => ' ');
      lePseudo(1..6) := "THORIN";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, nain, 517, 1135);



      lePseudo := (others => ' ');
      lePseudo(1..6) := "ELROND";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, elfe, 214, 869);

      lePseudo := (others => ' ');
      lePseudo(1..9) := "GALADRIEL";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, elfe, 1040, 228);

      lePseudo := (others => ' ');
      lePseudo(1..7) := "LEGOLAS";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, elfe, 57, 687);

      lePseudo := (others => ' ');
      lePseudo(1..7) := "TAURIEL";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, elfe, 715, 1285);



      lePseudo := (others => ' ');
      lePseudo(1..6) := "MERLIN";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, magicien, 812, 64);

      lePseudo := (others => ' ');
      lePseudo(1..8) := "RADAGAST";
      ajoutListe(tete, (leNom, lePrenom), lePseudo, magicien, 1024, 296);



   end iniPersonnel;

end gestion_personnel;
