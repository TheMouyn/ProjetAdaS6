with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, nt_console, aleatoire, ada.unchecked_Deallocation;
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
      personnel.mdpFaux := FALSE;

   end nouveauMDP;

-- ----------------------------------------------------------------------------------------------

   procedure saisieCategorie(laCat : out T_categorie) is
      -- permet de saisir une categorie d'employe
      leChoix : integer;

   begin -- saisieCategorie
      put_line("1 - Nain");
      put_line("2 - Elfe");
      put_line("3 - Magicien");
      put_line("4 - Grand Magicien");

      new_line;
      put_line("Votre choix ?");
      saisieInteger(1, 4, leChoix);

      case leChoix is
         when 1 => laCat := nain;
         when 2 => laCat := elfe;
         when 3 => laCat := magicien;
         when 4 => laCat := grandMagicien;
         when others => null;
      end case;

   end saisieCategorie;


-- ----------------------------------------------------------------------------------------------

   procedure nouvelleEmbauche(tete : in out T_PteurPersonnel) is
      -- permet de faire saisir une nouvelle embauche a un grandMagicien

      procedure ajoutEntete(tete : in out T_PteurPersonnel; lePersonnel : in T_personnel) is
         -- permet d'ajouter en tete un nouveau T_personnel dans la liste

      begin -- ajoutEntete
         if tete = null then
            tete := new T_cellPersonnel'(lePersonnel, null);

         else
            tete := new T_cellPersonnel'(lePersonnel, tete);
         end if;

      end ajoutEntete;


      newEmploye : T_personnel;

   begin -- nouvelleEmbauche
      put_line("Saisir le pseudo du nouvel employe");
      saisieString(newEmploye.pseudo);
      new_line;

      if employeExiste(tete, newEmploye.pseudo) then
         put_line("Ce pseudo est deja utilise !");

      else
         put_line("Quel est la categorie de l'employe :");
         saisieCategorie(newEmploye.categorie);
         new_line;

         -- permet de generer un numero magique aleatoire
         initialise(1, 1250);
         newEmploye.nuMagique := random;

         nouveauMDP(newEmploye);

         ajoutEntete(tete, newEmploye);

      end if;

   end nouvelleEmbauche;


-- ----------------------------------------------------------------------------------------------

   procedure suppressionEmploye(tete : in out T_PteurPersonnel) is
      -- permet de supprimer un employe

      procedure rechercheDel(tete : in out T_PteurPersonnel; lePseudo : in T_mot) is
         -- permet de rechercher dans la liste le pseudo et de supprimer l'employe

         Procedure Liberer is new ada.unchecked_Deallocation(T_cellPersonnel, T_PteurPersonnel);
         cellASupr : T_PteurPersonnel := null;

      begin -- rechercheDel
         if tete /= null then
            if tete.val.pseudo = lePseudo then
               cellASupr := tete;
               tete := tete.suiv;
               Liberer(cellASupr);

            else
               rechercheDel(tete.suiv, lePseudo);
            end if;
         end if;
      end rechercheDel;


      lePseudo : T_mot := (others => ' ');

   begin -- suppressionEmploye
      if tete = null then
         put_line("La liste des employe est vide !");
      else
         put_line("Saisir le pseudo de l'employe a supprimer");
         saisieString(lePseudo);

         if employeExiste(tete, lePseudo) then
            rechercheDel(tete, lePseudo);
            new_line;

            afficherTexte(lePseudo);
            put(" a ete supprime");
            new_line;

         else
            put_line("Ce personnel n'existe pas dans le logiciel");

         end if;

      end if;
   end suppressionEmploye;


-- ----------------------------------------------------------------------------------------------

   procedure MDPOublie(tete : in out T_PteurPersonnel; file : in out T_filePseudo) is
      -- TODO: A tester avec connexion et generation des nouveau mdp par le grand magicien
      -- permet de modifier le record T_personnel et ajouter le pseudo dans la file

      procedure enfilerPseudo(file: in out T_filePseudo; lePseudo : in T_mot) is
         -- permet d'enfiler le pseudo a la fin de la file

      begin -- enfilerPseudo
         if file.tete = null then
            file.tete := new T_cellPseudo'(lePseudo, null);
            file.fin := file.tete;

         else
            file.fin.suiv := new T_cellPseudo'(lePseudo, null);
            file.fin := file.fin.suiv;
         end if;
      end enfilerPseudo;

      procedure rechercheChangement(tete : in out T_PteurPersonnel; lePseudo : in T_mot) is
         -- permet de rechercher dans la liste et de changer le boolean mdpFaux

      begin -- rechercheChangement
         if tete /= null then
            if tete.val.pseudo = lePseudo then
               tete.val.mdpFaux := TRUE;

            else
               rechercheChangement(tete.suiv, lePseudo);

            end if;
         end if;

      end rechercheChangement;

      lePseudo : T_mot := (others => ' ');

   begin -- MDPOublie
      put_line("Saisir le pseudo de l'employe afin de reinitialiser le mot de passe");
      saisieString(lePseudo);
      new_line;

      if employeExiste(tete, lePseudo) then
         rechercheChangement(tete, lePseudo);
         enfilerPseudo(file, lePseudo);
         put_line("Un nouveau mot de passe vous sera attribue par Le Grand Magicien");
         put_line("Cependant, pour l'heure votre compte est bloque");

      else
         put_line("Cet employe n'existe pas dans le logiciel");

      end if;



   end MDPOublie;

-- ----------------------------------------------------------------------------------------------

   function recupereEmploye(tete : in T_PteurPersonnel; lePseudo : in T_mot) return T_personnel is
      -- permet de recuperer un T_employe
      vide : T_personnel;

   begin -- recupereEmploye
      vide.pseudo := (others => ' ');

      if tete = null then
         return vide;

      else
         if tete.val.pseudo = lePseudo then
            return tete.val;

         else
            return (recupereEmploye(tete.suiv, lePseudo));
         end if;
      end if;

   end recupereEmploye;


-- ----------------------------------------------------------------------------------------------

   procedure bloquageCompte(tete : in out T_PteurPersonnel; fileMDPOublie : in out T_filePseudo; lePseudo : in T_mot) is
      -- permet de bloquer un compte d'ajouter le pseudo dans la liste des mdp a generer
      procedure enfilerPseudo(file : in out T_filePseudo; lePseudo : in T_mot) is
         -- permet d'enfiler le pseudo dans la file des mots de passe oublies

      begin -- enfilerPseudo
         if file.tete = null then
            file.tete := new T_cellPseudo'(lePseudo, null);
            file.fin := file.tete;

         else
            file.fin.suiv := new T_cellPseudo'(lePseudo, null);
            file.fin := file.fin.suiv;

         end if;
      end enfilerPseudo;

   begin -- bloquageCompte
      if tete /= null then
         if tete.val.pseudo = lePseudo then
            tete.val.mdpFaux := TRUE;
            enfilerPseudo(fileMDPOublie, lePseudo);

         else
            bloquageCompte(tete.suiv, fileMDPOublie, lePseudo);

         end if;

      end if;

   end bloquageCompte;


-- ----------------------------------------------------------------------------------------------

   procedure seConnecter(tete : in out T_PteurPersonnel; fileMDPOublie : in out T_filePseudo; userConnecte : in out boolean; catConnectee : in out T_categorie; pseudoConnecte : in out T_mot) is
      -- permet de se connecter et de modifier les variables de sessions
      -- TODO: A TESTER

      lePseudo : T_mot := (others => ' ');
      laCat : T_categorie;
      lePersonnel : T_personnel;
      leMDP : T_MDP;
      laEmpreinte : integer := 0;

      compteur : integer := 0;


   begin -- seConnecter
      put_line("Veuillez saisir la categorie d'utilisateur");
      saisieCategorie(laCat);
      new_line;

      put_line("Veuillez saisir votre pseudo");
      saisieString(lePseudo);
      new_line;

      if employeExiste(tete, lePseudo) then
         -- si le pseudo existe
         lePersonnel := recupereEmploye(tete, lePseudo);
         if lePersonnel.categorie = laCat then
            if lePersonnel.mdpFaux = false then -- si le compte n'est pas bloque
               loop -- compte le nombre de fois mdp faux
                  put_line("Veuillez saisir votre mot de passe");
                  saisieMotDePasse(leMDP);

                  -- calcul de l'empreinte
                  for i in leMDP'range loop
                     laEmpreinte := character'pos(leMDP(i)) + laEmpreinte;
                  end loop;

                  laEmpreinte := laEmpreinte + lePersonnel.nuMagique;
                  laEmpreinte := laEmpreinte mod 1454;

                  if lePersonnel.empreinte = laEmpreinte then
                     -- si le mot de passe est bon
                     put_line("Mot de passe bon");
                     catConnectee := lePersonnel.categorie;
                     pseudoConnecte := lePersonnel.pseudo;
                     userConnecte := TRUE;
                     exit;

                  else
                     put_line("Mot de passe faux !");
                     new_line;
                     compteur := compteur +1;
                  end if;

                  if laCat /= grandMagicien AND THEN compteur >= 3 then
                     put_line("Vous avez fait 3 tentatives, votre compte est desactive, un nouveau mot de passe vous sera attribue");
                     bloquageCompte(tete, fileMDPOublie, lePseudo);
                     exit;

                  end if;
               end loop;
            else
               put_line("Ce compte est bloque, un nouveau mot de passe vous sera attribue dans les meilleurs delais");

            end if;
         else
            put_line("La categorie et le pseudo ne sont pas des informations coherantes au vue ce que qui a ete enregistre dans le logiciel");

         end if;
      else
         put_line("Ce pseudo n'est pas enregistre dans le logiciel");

      end if;
   end seConnecter;

-- ----------------------------------------------------------------------------------------------

   procedure seDeconnecter(userConnecte : in out boolean; catConnectee : in out T_categorie; pseudoConnecte : in out T_mot) is

   begin -- seDeconnecter
      userConnecte := FALSE;
      catConnectee := nain;
      pseudoConnecte := (others => ' ');

   end seDeconnecter;


end gestion_personnel;
