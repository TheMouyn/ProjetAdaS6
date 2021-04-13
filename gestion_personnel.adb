with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, nt_console, aleatoire;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils, nt_console, aleatoire;


package body gestion_personnel is

   procedure iniPersonnel(tete : in out T_PteurPersonnel) is
      -- permet de faire de la liste personnel avec les donnees de test

      procedure ajoutListe(tete : in out T_PteurPersonnel; pseudo : in T_mot; categorie : in T_categorie; nuMagique, empreinte : in integer) is
         -- permet ajout en tete

      begin -- ajoutListe
         if tete = null then
            tete := new T_cellPersonnel'((pseudo, categorie, nuMagique, empreinte, FALSE), null);

         else
            tete := new T_cellPersonnel'((pseudo, categorie, nuMagique, empreinte, FALSE), tete);

         end if;

      end ajoutListe;

      lePseudo : T_mot := (others => ' ');

   begin -- iniPersonnel
      lePseudo(1..8) := "MANDRAKE";
      ajoutListe(tete, lePseudo, grandMagicien, 257, 959);



      lePseudo := (others => ' ');
      lePseudo(1..5) := "GIMLI";
      ajoutListe(tete, lePseudo, nain, 435, 1117);

      lePseudo := (others => ' ');
      lePseudo(1..6) := "JOYEUX";
      ajoutListe(tete, lePseudo, nain, 731, 1302);

      lePseudo := (others => ' ');
      lePseudo(1..6) := "THORIN";
      ajoutListe(tete, lePseudo, nain, 517, 1135);



      lePseudo := (others => ' ');
      lePseudo(1..6) := "ELROND";
      ajoutListe(tete, lePseudo, elfe, 214, 869);

      lePseudo := (others => ' ');
      lePseudo(1..9) := "GALADRIEL";
      ajoutListe(tete, lePseudo, elfe, 1040, 228);

      lePseudo := (others => ' ');
      lePseudo(1..7) := "LEGOLAS";
      ajoutListe(tete, lePseudo, elfe, 57, 687);

      lePseudo := (others => ' ');
      lePseudo(1..7) := "TAURIEL";
      ajoutListe(tete, lePseudo, elfe, 715, 1285);



      lePseudo := (others => ' ');
      lePseudo(1..6) := "MERLIN";
      ajoutListe(tete, lePseudo, magicien, 812, 64);

      lePseudo := (others => ' ');
      lePseudo(1..8) := "RADAGAST";
      ajoutListe(tete, lePseudo, magicien, 1024, 296);



   end iniPersonnel;


-- ----------------------------------------------------------------------------------------------

   procedure visuEmploye(tete : in T_PteurPersonnel) is
      -- permet d'afficher la liste des employes du logiciel avec leur categorie dans l'ordre

   begin -- visuEmploye
      if tete /= null then
         afficherTexte(tete.val.pseudo);
         put(" ");
         put(T_categorie'image(tete.val.categorie));
         new_line;

         visuEmploye(tete.suiv);

      end if;

   end visuEmploye;


-- ----------------------------------------------------------------------------------------------

   function employeExiste(tete : in T_PteurPersonnel; lePseudo : in T_mot) return boolean is
      -- revois TRUE si le pseudo est deja pris

   begin -- employeExiste
      if tete /= null then
         if tete.val.pseudo = lePseudo then
            return TRUE;
         else
            return (FALSE OR employeExiste(tete.suiv, lePseudo));

         end if;
      else
         return FALSE;

      end if;

   end employeExiste;

-- ----------------------------------------------------------------------------------------------

   procedure nouveauMDP(personnel : in out T_personnel) is
      -- permet de generer un mot de passe et de la traduire comme demande dans le CDC
      leMDP : T_MDP;
      newEmpreinte : integer := 0;

   begin -- nouveauMDP
      -- cette procedure est precede d'une demande de l'identite du personnel et une verification si il existe
      put_line("Saisir le nouveau mot de passe (8 caracteres, dont 1 qui n'est pas une lettre)");
      saisieMotDePasse(leMDP);

      -- calcul de l'empreinte
      for i in leMDP'range loop
         newEmpreinte := character'pos(leMDP(i)) + newEmpreinte;
      end loop;

      newEmpreinte := newEmpreinte + personnel.nuMagique;
      newEmpreinte := newEmpreinte mod 1454;

      personnel.empreinte := newEmpreinte;

   end nouveauMDP;




end gestion_personnel;
