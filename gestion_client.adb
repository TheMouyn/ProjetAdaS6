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

end gestion_client;
