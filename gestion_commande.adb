with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, sequential_io, nt_console;
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



end gestion_commande;
