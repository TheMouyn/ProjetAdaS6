with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, sequential_io, nt_console, ada.unchecked_Deallocation;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, nt_console;

package body gestion_commande is

   procedure initStock(tabStock : in out T_table_article) is

   begin -- initStock
      tabStock(potionInvisibilite) := ((12, 14), 4);
      tabStock(potionMetamorphose) := ((9, 8), 2);
      tabStock(baguette) := ((47, 0), 5);
      tabStock(epee) := ((19, 5), 4);
      tabStock(filtreAmour) := ((3, 2), 7);
      tabStock(sortImmobilisation) := ((8, 6), 4);

   end initStock;



   procedure initCommandeEnAttenteDePreparation(fileCommandeEnAttente : in out T_fileCommande) is
      procedure enfiler(file : in out T_fileCommande; identite : in T_identite; nuCommande : in integer; article : in T_table_article) is

      begin -- enfiler
         if file.tete = null then
            file.tete := new T_cellCommande'((identite, nuCommande, article, (others=>' '), (0, 0)), null);
            file.fin := file.tete;

         else
            file.fin.suiv := new T_cellCommande'((identite, nuCommande, article, (others=>' '), (0, 0)), null);
            file.fin := file.fin.suiv;

         end if;

      end enfiler;


      lePrenom, leNom : T_mot := (others => ' ');
      article : T_table_article;
   begin -- initCommandeEnAttenteDePreparation

      lePrenom(1..3) := "LUC";
      leNom(1..6) := "GALVIN";
      article(potionInvisibilite).quantite := 1;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 2;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 1;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 12, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..7) := "ANAELLE";
      leNom(1..8) := "BEAUPRES";
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 4;
      article(baguette).quantite := 1;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 10;
      article(sortImmobilisation).quantite := 4;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 13, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..3) := "LUC";
      leNom(1..6) := "GALVIN";
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 10;
      article(baguette).quantite := 0;
      article(epee).quantite := 1;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 0;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 14, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "ELISE";
      leNom(1..6) := "ALLAIN";
      article(potionInvisibilite).quantite := 4;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 2;
      article(epee).quantite := 1;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 1;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 15, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "BELLE";
      leNom(1..9) := "SEBASTIEN";
      article(potionInvisibilite).quantite := 4;
      article(potionMetamorphose).quantite := 4;
      article(baguette).quantite := 0;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 4;
      article(sortImmobilisation).quantite := 0;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 16, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "PETIT";
      leNom(1..6) := "POUCET";
      article(potionInvisibilite).quantite := 10;
      article(potionMetamorphose).quantite := 10;
      article(baguette).quantite := 5;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 4;
      article(sortImmobilisation).quantite := 0;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 17, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..7) := "BLANCHE";
      leNom(1..5) := "NEIGE";
      article(potionInvisibilite).quantite := 2;
      article(potionMetamorphose).quantite := 1;
      article(baguette).quantite := 0;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 1;
      article(sortImmobilisation).quantite := 0;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 18, article);


      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..7) := "ANAELLE";
      leNom(1..8) := "BEAUPRES";
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 1;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 8;
      article(sortImmobilisation).quantite := 0;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 19, article);


   end initCommandeEnAttenteDePreparation;

-- ----------------------------------------------------------------------------------------------

   procedure initCommandeEnAttenteDeFacturation(fileCommandeEnAttente : in out T_fileCommande) is
      procedure enfiler(file : in out T_fileCommande; identite : in T_identite; nuCommande : in integer; article : in T_table_article; preparateur : in T_mot) is

      begin -- enfiler
         if file.tete = null then
            file.tete := new T_cellCommande'((identite, nuCommande, article, preparateur, (0, 0)), null);
            file.fin := file.tete;

         else
            file.fin.suiv := new T_cellCommande'((identite, nuCommande, article, preparateur, (0, 0)), null);
            file.fin := file.fin.suiv;

         end if;

      end enfiler;


      lePrenom, leNom, lePreparateur : T_mot := (others => ' ');
      article : T_table_article;
   begin -- initCommandeEnAttenteDeFacturation

      lePrenom(1..7) := "VINCENT";
      leNom(1..5) := "CAREL";
      lePreparateur(1..5) := "GIMLI";
      article(potionInvisibilite).quantite := 2;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 0;
      article(epee).quantite := 2;
      article(filtreAmour).quantite := 2;
      article(sortImmobilisation).quantite := 0;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 10, article, lePreparateur);



      lePrenom := (others => ' '); leNom := (others => ' '); lePreparateur := (others => ' ');
      lePrenom(1..5) := "ALICE";
      leNom(1..6) := "GALVIN";
      lePreparateur(1..6) := "THORIN";
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 4;
      article(baguette).quantite := 0;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 12;
      enfiler(fileCommandeEnAttente, (leNom, lePrenom), 11, article, lePreparateur);


   end initCommandeEnAttenteDeFacturation;


-- ----------------------------------------------------------------------------------------------
   procedure initCommandeAnnulee is
      -- si le prix de la commande est a (0, 0) c'est une commande annulee, si non c'est une commande reglee

      procedure mettreEnFichier(identite : in T_identite; nuCommande : in integer; article : in T_table_article) is
         maCommande : T_commande;

      begin -- mettreEnFichier
         maCommande := (identite, nuCommande, article, (others=>' '), (0, 0));
         open(varFichier_T_commande, Append_file, "FichierArchive");
         write(varFichier_T_commande, maCommande);
         close(varFichier_T_commande);

      end mettreEnFichier;


      lePrenom, leNom : T_mot := (others => ' ');
      article : T_table_article;
   begin -- initCommandeAnnulee
      create(varFichier_T_commande, name=>"FichierArchive");
      close(varFichier_T_commande);


      lePrenom(1..7) := "ANAELLE";
      leNom(1..8) := "BEAUPRES";
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 2;
      article(baguette).quantite := 4;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 5;
      mettreEnFichier((leNom, lePrenom), 2, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..7) := "VINCENT";
      leNom(1..5) := "CAREL";
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 0;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 10;
      article(sortImmobilisation).quantite := 12;
      mettreEnFichier((leNom, lePrenom), 3, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "BELLE";
      leNom(1..9) := "SEBASTIEN";
      article(potionInvisibilite).quantite := 2;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 0;
      article(epee).quantite := 2;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 0;
      mettreEnFichier((leNom, lePrenom), 4, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "PETIT";
      leNom(1..6) := "POUCET";
      article(potionInvisibilite).quantite := 5;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 0;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 4;
      mettreEnFichier((leNom, lePrenom), 5, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..7) := "BLANCHE";
      leNom(1..5) := "NEIGE";
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 12;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 0;
      mettreEnFichier((leNom, lePrenom), 6, article);



      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "ALICE";
      leNom(1..6) := "GALVIN";
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 10;
      article(baguette).quantite := 0;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 10;
      article(sortImmobilisation).quantite := 12;
      mettreEnFichier((leNom, lePrenom), 7, article);



   end initCommandeAnnulee;

-- ----------------------------------------------------------------------------------------------

   procedure enfilerCommande(file : in out T_fileCommande; maCommande : in T_commande) is

   begin -- enfilerCommande
      if file.tete = null then
         file.tete := new T_cellCommande'(maCommande, null);
         file.fin := file.tete;

      else
         file.fin.suiv := new T_cellCommande'(maCommande, null);
         file.fin := file.fin.suiv;

      end if;

   end enfilerCommande;


-- ----------------------------------------------------------------------------------------------

   procedure affichierNomArticle(article : in T_nomArticle) is

   begin -- affichierNomArticle
      -- potionInvisibilite, potionMetamorphose, baguette, epee, filtreAmour, sortImmobilisation

      case article is
         when potionInvisibilite => put("Potion d'invisibilite");
         when potionMetamorphose => put("Potion de metamorphose");
         when baguette => put("Baguette");
         when epee => put("Epee");
         when filtreAmour => put("Filtre d'amour");
         when sortImmobilisation => put("Sort d'immobilisation");


      end case;


   end affichierNomArticle;


-- ----------------------------------------------------------------------------------------------

   function commandeEstVide(laCommande : in T_commande) return boolean is
      qtt : integer := 0;

   begin -- commandeEstVide
      for i in laCommande.articleCommande'range loop
         qtt := qtt + laCommande.articleCommande(i).quantite;

      end loop;

      if qtt = 0 then
         return TRUE;
      else
         return FALSE;

      end if;

   end commandeEstVide;



-- ----------------------------------------------------------------------------------------------

   procedure visuCommandeEnAttentePrepa(tete : in T_PteurCommande) is
      -- permet de visualiser une liste de commande dans l'ordre sans affichier le prix ni le preparateur
      car : character;

   begin -- visuCommandeEnAttentePrepa
      if tete /= null then
         put("Numero : ");
         put(tete.val.nuCommande, 1);
         new_line;
         put("Identite : ");
         afficherTexte(tete.val.identiteClient.nom);
         put(" ");
         afficherTexte(tete.val.identiteClient.prenom);
         new_line;
         put("Article : ");
         new_line;
         for i in tete.val.articleCommande'range loop
            if tete.val.articleCommande(i).quantite >0 then
               affichierNomArticle(i);
               put(" : ");
               put(tete.val.articleCommande(i).quantite, 1);
               new_line;
            end if;

         end loop;

         new_line;
         new_line;
         if tete.suiv /= null then
            put("Appuyer sur entrer pour afficher la commande suivante, Appuyez sur 'Q' pour Quitter");
            get_immediate(car);
            if car /= 'q' AND car /= 'Q' then
               clear_screen(black);
               visuCommandeEnAttentePrepa(tete.suiv);

            end if;
         end if;

      end if;

   end visuCommandeEnAttentePrepa;

-- ----------------------------------------------------------------------------------------------

   procedure visuCommandeEnAttentePrepaClient(tete : in T_PteurCommande; leClient : in T_identite) is
      -- permet de visualiser une liste de commande dans l'ordre sans affichier le prix ni le preparateur
      -- Mais uniquement d'un client precis

      car : character;

   begin -- visuCommandeEnAttentePrepaClient
      if tete /= null then
         if tete.val.identiteClient.prenom = leClient.prenom AND tete.val.identiteClient.nom = leClient.nom then
            put("Numero : ");
            put(tete.val.nuCommande, 1);
            new_line;
            put("Identite : ");
            afficherTexte(tete.val.identiteClient.nom);
            put(" ");
            afficherTexte(tete.val.identiteClient.prenom);
            new_line;
            put("Article : ");
            new_line;
            for i in tete.val.articleCommande'range loop
               if tete.val.articleCommande(i).quantite >0 then
                  affichierNomArticle(i);
                  put(" : ");
                  put(tete.val.articleCommande(i).quantite, 1);
                  new_line;
               end if;

            end loop;

            new_line;
            new_line;
            put("Appuyer sur entrer pour afficher la commande suivante, Appuyez sur 'Q' pour Quitter");
            get_immediate(car);
            if car /= 'q' AND car /= 'Q' then
               clear_screen(black);
               visuCommandeEnAttentePrepaClient(tete.suiv, leClient);

            end if;

         else
            visuCommandeEnAttentePrepaClient(tete.suiv, leClient);

         end if;

      end if;

   end visuCommandeEnAttentePrepaClient;


-- ----------------------------------------------------------------------------------------------

   procedure ajoutEnArchive(laCommande : in T_commande) is

   begin -- ajoutEnArchive
      open(varFichier_T_commande, Append_file, "FichierArchive");
      write(varFichier_T_commande, laCommande);
      close(varFichier_T_commande);

   end ajoutEnArchive;


-- ----------------------------------------------------------------------------------------------

   procedure suprCommande(file : in out T_fileCommande; laCommande : in T_commande) is
      -- permet de supprimer la commande de la file et de redefinir le file.fin
      Procedure Liberer is new ada.unchecked_Deallocation(T_cellCommande, T_PteurCommande);

      procedure suppression(tete : in out T_PteurCommande; laCommande : in T_commande) is
         -- permet de supprimer la cellule de la commande
         celluleASupr : T_PteurCommande;

      begin -- suppression
         if tete /= null then
            if tete.val = laCommande then
               celluleASupr := tete;
               tete := tete.suiv;
               -- Liberer(celluleASupr);

            else
               suppression(tete.suiv, laCommande);

            end if;
         end if;
      end suppression;

      procedure redefinirFin(file : in out T_fileCommande) is
         -- permet de redefinir le pointeur de fin dans la file
         lectureTete : T_PteurCommande := file.tete;

      begin -- redefinirFin
         while lectureTete /= null loop
            if lectureTete.suiv = null then
               file.fin := lectureTete;
               exit;
            else
               lectureTete := lectureTete.suiv;
            end if;
         end loop;

      end redefinirFin;



   begin -- suprCommande
      suppression(file.tete, laCommande);

      if file.tete = null then
         file.fin := null;

      else
         redefinirFin(file);
      end if;


   end suprCommande;


-- ----------------------------------------------------------------------------------------------

   procedure visuCommandeEnAttenteFacturation(tete : in T_PteurCommande) is
      -- permet de visualiser une liste de commande dans l'ordre en affichant le nom du preparateur mais pas le prix
      car : character;

   begin -- visuCommandeEnAttenteFacturation
      if tete /= null then
         put("Numero : ");
         put(tete.val.nuCommande, 1);
         new_line;
         put("Identite : ");
         afficherTexte(tete.val.identiteClient.nom);
         put(" ");
         afficherTexte(tete.val.identiteClient.prenom);
         new_line;
         put("Article : ");
         new_line;
         for i in tete.val.articleCommande'range loop
            if tete.val.articleCommande(i).quantite >0 then
               affichierNomArticle(i);
               put(" : ");
               put(tete.val.articleCommande(i).quantite, 1);
               new_line;
            end if;

         end loop;

         put("Preparateur : ");
         afficherTexte(tete.val.preparateur);

         new_line;
         new_line;
         if tete.suiv /= null then
            put("Appuyer sur entrer pour afficher la commande suivante, Appuyez sur 'Q' pour Quitter");
            get_immediate(car);
            if car /= 'q' AND car /= 'Q' then
               clear_screen(black);
               visuCommandeEnAttenteFacturation(tete.suiv);

            end if;
         end if;

      end if;

   end visuCommandeEnAttenteFacturation;



-- ----------------------------------------------------------------------------------------------

   procedure visuCommandeEnAttentePaiement(tete : in T_PteurCommande) is
      -- permet de visualiser une liste de commande dans l'ordre en affichant toutes les infos
      car : character;

   begin -- visuCommandeEnAttentePaiement
      if tete /= null then
         put("Numero : ");
         put(tete.val.nuCommande, 1);
         new_line;
         put("Identite : ");
         afficherTexte(tete.val.identiteClient.nom);
         put(" ");
         afficherTexte(tete.val.identiteClient.prenom);
         new_line;
         put("Article : ");
         new_line;
         for i in tete.val.articleCommande'range loop
            if tete.val.articleCommande(i).quantite >0 then
               affichierNomArticle(i);
               put(" : ");
               put(tete.val.articleCommande(i).quantite, 1);
               new_line;
            end if;

         end loop;

         put("Preparateur : ");
         afficherTexte(tete.val.preparateur);
         new_line;

         put("Prix : ");
         afficherPrix(tete.val.montant);


         new_line;
         new_line;
         if tete.suiv /= null then
            put("Appuyer sur entrer pour afficher la commande suivante, Appuyez sur 'Q' pour Quitter");
            get_immediate(car);
            if car /= 'q' AND car /= 'Q' then
               clear_screen(black);
               visuCommandeEnAttentePaiement(tete.suiv);

            end if;
         end if;

      end if;

   end visuCommandeEnAttentePaiement;


-- ----------------------------------------------------------------------------------------------

   procedure afficherStock(stock : in T_table_article) is
      -- permet d'afficher les quantites restantes et les prix

   begin -- afficherStock
      for i in stock'range loop
         affichierNomArticle(i);
         put(" : ");
         new_line;

         put("Quantite : ");
         put(stock(i).quantite, 1);
         new_line;

         put("Prix : ");
         afficherPrix(stock(i).prix);
         new_line;

         new_line;
      end loop;

   end afficherStock;


-- ----------------------------------------------------------------------------------------------

   procedure visuCommandeArchivee is
      -- permet de visualiser les commandes archivees donc prix /= (0,0)
      -- car les commandes annulee ont un prix a (0, 0)
      maCommande : T_commande;
      car : character;

   begin -- visuCommandeArchivee
      open(varFichier_T_commande, In_file, "FichierArchive");
      while not End_of_file(varFichier_T_commande) loop
         read(varFichier_T_commande, maCommande);

         if maCommande.montant.ecu > 0 OR ELSE maCommande.montant.galion > 0 then
            put("Numero : ");
            put(maCommande.nuCommande, 1);
            new_line;
            put("Identite : ");
            afficherTexte(maCommande.identiteClient.nom);
            put(" ");
            afficherTexte(maCommande.identiteClient.prenom);
            new_line;
            put("Article : ");
            new_line;
            for i in maCommande.articleCommande'range loop
               if maCommande.articleCommande(i).quantite >0 then
                  affichierNomArticle(i);
                  put(" : ");
                  put(maCommande.articleCommande(i).quantite, 1);
                  new_line;
               end if;

            end loop;

            put("Preparateur : ");
            afficherTexte(maCommande.preparateur);
            new_line;

            put("Prix : ");
            afficherPrix(maCommande.montant);

            new_line;
            new_line;

            put("Appuyer sur entrer pour afficher la commande suivante, Appuyez sur 'Q' pour Quitter");
            get_immediate(car);
            if car = 'q' OR car = 'Q' then
               exit;

            end if;
            clear_screen(black);

         end if;
      end loop;

      close(varFichier_T_commande);
   end visuCommandeArchivee;


-- ----------------------------------------------------------------------------------------------

   procedure visuCommandeAnnulee is
      -- permet de visualiser les commandes annulees donc prix = (0,0)
      -- car les commandes archivees ont un prix different de (0, 0)
      maCommande : T_commande;
      car : character;

   begin -- visuCommandeAnnulee
      open(varFichier_T_commande, In_file, "FichierArchive");
      while not End_of_file(varFichier_T_commande) loop
         read(varFichier_T_commande, maCommande);

         if maCommande.montant.ecu = 0 AND THEN maCommande.montant.galion = 0 then
            put("Numero : ");
            put(maCommande.nuCommande, 1);
            new_line;
            put("Identite : ");
            afficherTexte(maCommande.identiteClient.nom);
            put(" ");
            afficherTexte(maCommande.identiteClient.prenom);
            new_line;
            put("Article : ");
            new_line;
            for i in maCommande.articleCommande'range loop
               if maCommande.articleCommande(i).quantite >0 then
                  affichierNomArticle(i);
                  put(" : ");
                  put(maCommande.articleCommande(i).quantite, 1);
                  new_line;
               end if;

            end loop;

            new_line;
            new_line;

            put("Appuyer sur entrer pour afficher la commande suivante, Appuyez sur 'Q' pour Quitter");
            get_immediate(car);
            if car = 'q' OR car = 'Q' then
               exit;

            end if;
            clear_screen(black);

         end if;
      end loop;

      close(varFichier_T_commande);
   end visuCommandeAnnulee;








end gestion_commande;
