with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, gestion_commande, nt_console;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, gestion_commande, nt_console;

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

-- ----------------------------------------------------------------------------------------------

   function clientExiste(racine : in T_arbreClient; identite : in T_identite) return boolean is
      -- permet de savoir si un client existe dans l'arbre. renvoi TRUE si oui et FALSE si non
      -- Attention la casse est importante

   begin -- clientExiste
      if racine = null then
         return FALSE;

      else
         if identite.nom < racine.val.identite.nom then
            return (FALSE OR clientExiste(racine.fg, identite));

         elsif identite.nom = racine.val.identite.nom then
            if identite.prenom < racine.val.identite.prenom then
               return (FALSE OR clientExiste(racine.fg, identite));

            elsif identite.prenom = racine.val.identite.prenom then
               return TRUE;

            else
               return (FALSE OR clientExiste(racine.fd, identite));

            end if;

         else
            return (FALSE OR clientExiste(racine.fd, identite));


         end if;

      end if;

   end clientExiste;

-- ----------------------------------------------------------------------------------------------


   procedure ajoutClient(racine : in out T_arbreClient; identite : in T_identite) is
      -- permet d'ajouter un client dans l'arbre
      -- attention cette procedure ne permet pas la verification si le client existe deja

   begin -- ajoutClient
      if racine = null then
         racine := new T_noeudClient'((identite, null, (0, 0)), null, null);
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

-- ----------------------------------------------------------------------------------------------

   procedure nouvelleCommande(fileCommandeEnAttente : in out T_fileCommande; racineClient : in out T_arbreClient; nuCommande : in out integer) is
      -- permet de créer une nouvelle commande et l'enfiler dans la file
      -- si le client n'existe pas, le créé
      -- le nuCommande représente le numéro de commande précédent, il faut donc faire +1
      leClient : T_identite;
      laCommande : T_commande;
      confirmation : boolean;

   begin -- nouvelleCommande
      saisieIdentite(leClient);

      put_line("Saisir la quantite des article que vous souhaitez : ");
      for i in laCommande.articleCommande'range loop
         affichierNomArticle(i);
         put(" : ");
         saisieInteger(0, integer'last, laCommande.articleCommande(i).quantite);

      end loop;

      clear_screen(black);
      put_line("Vous allez ajouter cette commande : ");
      new_line;

      put("Commande numero ");
      put(nuCommande+1, 1);
      new_line;
      new_line;

      put("Client : ");
      afficherTexte(leClient.prenom);
      put(" ");
      afficherTexte(leClient.nom);
      new_line;
      new_line;

      if not commandeEstVide(laCommande) then
         for i in laCommande.articleCommande'range loop
            affichierNomArticle(i);
            put(" : ");
            put(laCommande.articleCommande(i).quantite, 1);
            new_line;

         end loop;

         new_line;
         new_line;
         put_line("Vous confirmer ?");
         saisieBoolean(confirmation);


         if confirmation then
            if not clientExiste(racineClient, leClient) then
               -- si le client n'existe pas dans l'arbre on l'ajoute
               ajoutClient(racineClient, leClient);
               put_line("Le client a ete ajoute");

            end if;
            laCommande.identiteClient := leClient;
            nuCommande := nuCommande +1;
            laCommande.nuCommande := nuCommande;
            laCommande.montant := (0, 0);

            enfilerCommande(fileCommandeEnAttente, laCommande);
            put_line("La commande a ete ajoutee");

         else
            put_line("Ajout annule, retour au menu principal");

         end if;


      else
         put_line("La commande est vide !");


      end if;

   end nouvelleCommande;

-- ----------------------------------------------------------------------------------------------

   function commandeExisteClient(tete : in T_PteurCommande; laIdentite : in T_identite) return boolean is
      -- permet de savoir si une commande est en attente de preparation pour ce client

   begin -- commandeExisteClient
      if tete = null then
         return false;

      else
         if tete.val.identiteClient = laIdentite then
            return TRUE;
         else
            return (false or commandeExisteClient(tete.suiv, laIdentite));
         end if;
      end if;

   end commandeExisteClient;


-- ----------------------------------------------------------------------------------------------

   procedure annulerCommande(file : in out T_fileCommande; racineArbre : in T_arbreClient) is
      -- permet d'annuler une commande
      -- l'ajoute dans le fichier des commandes annulees et la supprime de la liste

      leClient : T_identite;
      leNuCommande : integer := 0;

      laCommande : T_commande;
      commandeTrouve : boolean := false; -- permet de savoir si la commande a ete trouve
      confirmationSupr : boolean := false;

      lecture : T_PteurCommande := file.tete; -- permet de lire dans la liste de commande


   begin -- annulerCommande
      saisieIdentite(leClient);
      clear_screen(black);

      if clientExiste(racineArbre, leClient) then
         if commandeExisteClient(file.tete, leClient) then
            put_line("Voici les commandes en attente pour ce client");
            visuCommandeEnAttentePrepaClient(file.tete, leClient);

            clear_screen(black);
            put_line("Quel est le numero de commande que vous desirez annuler ? (0 pour annuler)");
            saisieInteger(0, integer'last, leNuCommande);
            new_line;

            -- permet de parcourir la liste des commandes et de recuperer la commande en question
            while lecture /= null loop
               if lecture.val.nuCommande = leNuCommande AND lecture.val.identiteClient = leClient then
                  laCommande := lecture.val;
                  commandeTrouve := TRUE;
                  exit;

               else
                  lecture := lecture.suiv;
               end if;

            end loop;


            if commandeTrouve then
               -- confirmation
               put_line("Voulez-vous supprimer la commande :");
               new_line;

               put("Numero : ");
               put(laCommande.nuCommande, 1);
               new_line;
               put("Identite : ");
               afficherTexte(laCommande.identiteClient.nom);
               put(" ");
               afficherTexte(laCommande.identiteClient.prenom);
               new_line;
               put("Article : ");
               new_line;
               for i in laCommande.articleCommande'range loop
                  if laCommande.articleCommande(i).quantite >0 then
                     affichierNomArticle(i);
                     put(" : ");
                     put(laCommande.articleCommande(i).quantite, 1);
                     new_line;
                  end if;

               end loop;

               new_line;
               put_line("Vous confirmer ?");
               saisieBoolean(confirmationSupr);

               if confirmationSupr then
                  ajoutEnArchive(laCommande);
                  suprCommande(file, laCommande);
                  put_line("La commande a bien ete supprimee");

               else
                  put_line("La commande n'a pas ete supprimee");

               end if;

            else
               -- si la commande n'est pas trouve
               put_line("Il n'y a pas de commande qui correspond aux criteres");

            end if;


         else
            put_line("Il n'y a aucune commande en attente de preparation pour ce client");

         end if;

      else
         put_line("Ce client n'existe pas dans le logiciel");

      end if;

   end annulerCommande;


-- ----------------------------------------------------------------------------------------------

   procedure afficherFactureClient(racineArbre : in T_arbreClient) is
      -- permet d'afficher les facture en attente de paiement d'un client specifique apres une saisie
      procedure rechercheEtVisu(racine : in T_arbreClient; leClient : in T_identite) is
         -- permet de chercher dans l'arbre le client et de lancer la visalisation

      begin -- rechercheEtVisu
         if racine /= null then
            if leClient.nom < racine.val.identite.nom then
               rechercheEtVisu(racine.fg, leClient);

            elsif leClient.nom = racine.val.identite.nom then
               -- recherche prenom
               if leClient.prenom < racine.val.identite.prenom then
                  rechercheEtVisu(racine.fg, leClient);

               elsif leClient.prenom = racine.val.identite.prenom then
                  -- on affiche les facture ou un msg d'erreur
                  if racine.val.enAttentePaiement = null then
                     put_line("Ce client n'a pas de facture en attente de paiement");
                  else
                     visuCommandeEnAttentePaiement(racine.val.enAttentePaiement);

                  end if;

               else
                  rechercheEtVisu(racine.fd, leClient);
               end if;
            else
               rechercheEtVisu(racine.fd, leClient);

            end if;
         end if;

      end rechercheEtVisu;



      leClient : T_identite;

   begin -- afficherFactureClient
      put_line("Saisir l'identite du client :");
      saisieIdentite(leClient);
      new_line;

      if clientExiste(racineArbre, leClient) then
         clear_screen(black);
         rechercheEtVisu(racineArbre, leClient);



      else
         put_line("Le client n'existe pas dans le logiciel");

      end if;




   end afficherFactureClient;



-- ----------------------------------------------------------------------------------------------

   procedure affichageCommandeEnAttenteReglement(racine : in T_arbreClient) is
      -- permet d'afficher les commandes en attente de reglement pour touts les clients

   begin -- affichageCommandeEnAttenteReglement
      if racine /= null then
         affichageCommandeEnAttenteReglement(racine.fg);

         if racine.val.enAttentePaiement /= null then
            visuCommandeEnAttentePaiement(racine.val.enAttentePaiement);

            put("Appuyer sur entrer");
            skip_Line;
            clear_screen(black);

         end if;
         affichageCommandeEnAttenteReglement(racine.fd);

      end if;

   end affichageCommandeEnAttenteReglement;


-- ----------------------------------------------------------------------------------------------

   procedure visuClient(racine : in T_arbreClient) is
      -- permet d'afficher la liste des clients en odre alphabetique

   begin -- visuClient
      if racine /= null then
         visuClient(racine.fg);

         afficherTexte(racine.val.identite.nom);
         put(" ");
         afficherTexte(racine.val.identite.prenom);
         new_line;

         visuClient(racine.fd);

      end if;

   end visuClient;


-- ----------------------------------------------------------------------------------------------

   procedure visuCommandeUtilisateur(teteFacture : in T_PteurCommande; racine : in T_arbreClient; userConnecte : in T_mot) is
      -- permet d'afficher les commandes (en attente facturation, en attente reglement, ou archivees) d'un utilisateur specifique

      procedure affichageEnAttenteFacturation(tete : in T_PteurCommande; userConnecte : in T_mot) is
         -- permet d'afficher les commandes en attente de facturation d'un preparateur specifique
         car : character;

      begin -- affichageEnAttenteFacturation
         if tete /= null then
            if tete.val.preparateur = userConnecte then
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
               put("Appuyer sur entrer pour afficher la commande suivante, Appuyez sur 'Q' pour Quitter");
               get_immediate(car);
               if car /= 'q' AND car /= 'Q' then
                  clear_screen(black);
                  -- problème appel récurif
                  affichageEnAttenteFacturation(tete.suiv, userConnecte);

               end if;
            else
               affichageEnAttenteFacturation(tete.suiv, userConnecte);

            end if;

         end if;
      end affichageEnAttenteFacturation;

      procedure affichageEnAttenteReglement(racine : in T_arbreClient; userConnecte : in T_mot) is
         -- permet d'afficher les commandes en attente de reglement d'un preparateur specifique

      begin -- affichageEnAttenteReglement
         if racine /= null then
            affichageEnAttenteReglement(racine.fg, userConnecte);

            if racine.val.enAttentePaiement /= null then
               affichageEnAttenteFacturation(racine.val.enAttentePaiement, userConnecte);
            end if;

            affichageEnAttenteReglement(racine.fd, userConnecte);

         end if;
      end affichageEnAttenteReglement;


   begin -- visuCommandeUtilisateur
      put("Voici les commandes prepare par ");
      afficherTexte(userConnecte);
      new_line;

      affichageEnAttenteFacturation(teteFacture, userConnecte);
      clear_screen(black);

      affichageEnAttenteReglement(racine, userConnecte);
      clear_screen(black);

      visuArchiveUtilisateur(userConnecte);



   end visuCommandeUtilisateur;


-- ----------------------------------------------------------------------------------------------

   procedure preparerCommande(filePreparation, fileFacturation : in out T_fileCommande; stock, tabBesoin : in out T_table_article; pseudoConnecte : in T_mot; nuCommande : in out integer) is
      -- permet de preparer une commande par un nain

      laCommande, newCommande : T_commande;
      stockSuffisant : boolean := true;

   begin -- preparerCommande
      if filePreparation.tete = null then
         put_line("La file de commande en attente de preparation est vide");
      else
         laCommande := filePreparation.tete.val;

         put_line("Voici la commande a traiter :");
         afficherUneCommande(laCommande);

         new_line;
         put_line("Appuyez sur entrer pour continuer");
         skip_Line;

         newCommande := laCommande;

         -- remise a 0 des quantite du tableau
         for i in newCommande.articleCommande'range loop
            newCommande.articleCommande(i).quantite := 0;
         end loop;


         for i in laCommande.articleCommande'range loop
            if stock(i).quantite >= laCommande.articleCommande(i).quantite then
               -- si le stock est suffisant
               stock(i).quantite := stock(i).quantite - laCommande.articleCommande(i).quantite;

            else
               -- si le stock n'est pas suffisant
               stockSuffisant := false;
               newCommande.articleCommande(i).quantite := laCommande.articleCommande(i).quantite - stock(i).quantite;
               laCommande.articleCommande(i).quantite := stock(i).quantite;
               stock(i).quantite := 0;

               -- mise a jour tableau des besoins
               tabBesoin(i).quantite := tabBesoin(i).quantite + newCommande.articleCommande(i).quantite;
            end if;
         end loop;

         new_line;

         laCommande.preparateur := pseudoConnecte;
         if stockSuffisant then
            put_line("Vous pouvez allez preparer cette commande");
            -- on defile la premiere commande en attente de preparation
            defilerCommande(filePreparation);

            -- on enfiler la commande dans la file des commandes en attente de facturation
            enfilerCommande(fileFacturation, laCommande);
            -- IDEA: ne pas supprimer puis re-creer une cellule mais la deplacer


         else
            -- si le stock n'est pas suffisant
            clear_screen(black);
            put_line("Le stock n'est pas suffisant, voici la commande a preparer");
            afficherUneCommande(laCommande);
            new_line;
            new_line;

            put_line("Voici la nouvelle commande qui sera ajouter dans les commandes en attente de preparation");
            nuCommande := nuCommande + 1;
            newCommande.nuCommande := nuCommande;
            afficherUneCommande(newCommande);
            new_line;
            new_line;

            enfilerCommande(filePreparation, newCommande);
            defilerCommande(filePreparation);
            enfilerCommande(fileFacturation, laCommande);
         end if;
      end if;
   end preparerCommande;



end gestion_client;
