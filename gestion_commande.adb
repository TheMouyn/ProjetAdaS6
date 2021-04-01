with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, sequential_io;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix;

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

end gestion_commande;
