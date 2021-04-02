with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, gestion_commande;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, gestion_commande;

package body gestion_client is

   procedure initClient(racine : in out T_arbreClient) is
      procedure ajoutClient(racine : in out T_arbreClient; identite : in T_identite) is

      begin -- ajoutClient
         if racine = null then
            racine := new T_noeudClient'((identite, null, (0,0)), null, null);

         else
            if identite.nom < racine.val.identite.nom then
               ajoutClient(racine.fg, identite);

            elsif identite.nom = racine.val.identite.nom then
               if identite.prenom < racine.val.identite.prenom then
                  ajoutClient(racine.fg, identite);

               else
                  ajoutClient(racine.fd, identite);


               end if;

            else
               ajoutClient(racine.fd, identite);

            end if;

         end if;

      end ajoutClient;

      lePrenom, leNom : T_mot := (others =>' ');

   begin -- initClient


      lePrenom(1..3) := "LUC";
      leNom(1..6) := "GALVIN";
      ajoutClient(racine, (leNom, lePrenom));

      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..7) := "ANAELLE";
      leNom(1..8) := "BEAUPRES";
      ajoutClient(racine, (leNom, lePrenom));

      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..7) := "VINCENT";
      leNom(1..5) := "CAREL";
      ajoutClient(racine, (leNom, lePrenom));

      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "BELLE";
      leNom(1..9) := "SEBASTIEN";
      ajoutClient(racine, (leNom, lePrenom));

      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "PETIT";
      leNom(1..6) := "POUCET";
      ajoutClient(racine, (leNom, lePrenom));

      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..7) := "BLANCHE";
      leNom(1..5) := "NEIGE";
      ajoutClient(racine, (leNom, lePrenom));

      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "ALICE";
      leNom(1..6) := "GALVIN";
      ajoutClient(racine, (leNom, lePrenom));

      lePrenom := (others => ' '); leNom := (others => ' ');
      lePrenom(1..5) := "ELISE";
      leNom(1..6) := "ALLAIN";
      ajoutClient(racine, (leNom, lePrenom));


   end initClient;

-- ----------------------------------------------------------------------------------------------

   procedure initCommandeEnAttenteDeReglement(racine : in out T_arbreClient) is
      -- ne peut etre utiliser que apres initialisation des data des clients
      procedure mettreDansLArbre(racine : in out T_arbreClient; identite : in T_identite; nuCommande : in integer; article : in T_table_article; preparateur : in T_mot; prix : in T_prix) is

      begin -- mettreDansLArbre

         if racine /= null then
            if identite.nom < racine.val.identite.nom then
               mettreDansLArbre(racine.fg, identite, nuCommande, article, preparateur, prix);

            elsif racine.val.identite = identite then
               if racine.val.enAttentePaiement = null then
                  racine.val.enAttentePaiement := new T_cellCommande'((identite, nuCommande, article, preparateur, prix), null);
                  racine.val.montantDu := prix;
               end if;

            elsif identite.nom > racine.val.identite.nom then
               mettreDansLArbre(racine.fd, identite, nuCommande, article, preparateur, prix);

            end if;

         end if;

      end mettreDansLArbre;


      lePrenom, leNom, lePreparateur : T_mot := (others => ' ');
      article : T_table_article;
      lePrix : T_prix;
   begin -- initCommandeEnAttenteDeReglement

      lePrenom(1..3) := "LUC";
      leNom(1..6) := "GALVIN";
      lePreparateur(1..6) := "JOYEUX";
      lePrix := (471, 7);
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 8;
      article(epee).quantite := 4;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 0;
      mettreDansLArbre(racine, (leNom, lePrenom), 1, article, lePreparateur, lePrix);


      lePrenom := (others => ' '); leNom := (others => ' '); lePreparateur := (others => ' ');
      lePrenom(1..5) := "ELISE";
      leNom(1..6) := "ALLAIN";
      lePreparateur(1..6) := "THORIN";
      lePrix := (62, 4);
      article(potionInvisibilite).quantite := 1;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 1;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 0;
      article(sortImmobilisation).quantite := 0;
      mettreDansLArbre(racine, (leNom, lePrenom), 8, article, lePreparateur, lePrix);


      lePrenom := (others => ' '); leNom := (others => ' '); lePreparateur := (others => ' ');
      lePrenom(1..5) := "PETIT";
      leNom(1..6) := "POUCET";
      lePreparateur(1..6) := "THORIN";
      lePrix := (126, 6);
      article(potionInvisibilite).quantite := 0;
      article(potionMetamorphose).quantite := 0;
      article(baguette).quantite := 0;
      article(epee).quantite := 0;
      article(filtreAmour).quantite := 12;
      article(sortImmobilisation).quantite := 10;
      mettreDansLArbre(racine, (leNom, lePrenom), 9, article, lePreparateur, lePrix);



   end initCommandeEnAttenteDeReglement;


end gestion_client;
