with ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, gestion_personnel, gestion_commande, gestion_client, nt_console;
use ada.text_io, ada.integer_text_io, ada.float_text_io, outils, gestion_prix, gestion_personnel, gestion_commande, gestion_client, nt_console;

procedure main is

   procedure titre is

   begin -- titre
      new_line;
      put_line("          ******************************************          ");
      put_line("                AU GAI MAGICIEN : LA BOUTIQUE                 ");
      put_line("          ******************************************          ");
      new_line; new_line;
   end titre;





   -- variables de donnees
   leStock : T_table_article;
   arbreClient : T_arbreClient := null;
   nuCommande : integer := 0;
   commandeEnAttenteDePreparation : T_fileCommande := (null, null);
   commandeEnAttenteDeFacturation : T_fileCommande := (null, null);
   lePersonnel : T_PteurPersonnel := null;
   fileMDPOublie : T_filePseudo := (null, null);
   tabBesoin : T_table_article;

   -- variables de sessions
   userConnecte : boolean := false; -- permet de savoir quel utilisateur est connecte
   catConnectee : T_categorie; -- categorie de l'utilisateur connecte
   pseudoConnecte : T_mot := (others => ' '); -- permet de stocker le pseudo de l'utilisateur connecte

   -- variables de choix/menu
   choix1, choix2 : character;


begin -- main
   nuCommande := 19;
   initStock(leStock);
   initClient(arbreClient);
   initCommandeEnAttenteDePreparation(commandeEnAttenteDePreparation);
   initCommandeEnAttenteDeFacturation(commandeEnAttenteDeFacturation);
   initCommandeEnAttenteDeReglement(arbreClient);
   initCommandeAnnulee;
   iniPersonnel(lePersonnel);

   loop
      if userConnecte = false then
         -- si l'utilisateur est connecte

         -- menu principal
         titre;
         put_line("1 - Passer une commande");
         put_line("2 - Annuler une commande");
         put_line("3 - Visualiser les factures d'un client");
         put_line("4 - Se connecter");
         put_line("5 - Mot de passe oublie");
         put_line("Q - Quitter");
         new_line;
         put_line("Que souhaitez-vous faire ?");
         put("=> ");
         get(choix1); skip_line; new_line;

         case choix1 is
            when 'Q' | 'q' => exit;
            when '1' => clear_screen(black); nouvelleCommande(commandeEnAttenteDePreparation, arbreClient, nuCommande); suivant;
            when '2' => clear_screen(black); annulerCommande(commandeEnAttenteDePreparation, arbreClient); suivant;
            when '3' => clear_screen(black); afficherFactureClient(arbreClient); suivant;
            when '4' => clear_screen(black); seConnecter(lePersonnel, fileMDPOublie, userConnecte, catConnectee, pseudoConnecte); suivant;
            when '5' => clear_screen(black); MDPOublie(lePersonnel, fileMDPOublie); suivant;
            when others => put_line("Choix non propose"); suivant;
         end case;



      else -- si l'utilisateur est connecte
         if catConnectee = nain then
            titre;
            put("Vous etes connecte en tant que ");
            afficherTexte(pseudoConnecte);
            new_line;

            put_line("1 - Prendre en chage une commande");
            put_line("2 - Visualisation de toutes les commandes gerees par vous");
            put_line("3 - Visualiser toutes les commandes en attentes de preparation");
            put_line("4 - Visualiser les stock");
            put_line("D - Se deconnecter");
            new_line;
            put_line("Que souhaitez-vous faire ?");
            put("=> ");
            get(choix2); skip_line; new_line;

            case choix2 is
               when '1' => clear_screen(black); preparerCommande(commandeEnAttenteDePreparation, commandeEnAttenteDeFacturation, leStock, tabBesoin, pseudoConnecte, nuCommande); suivant;
               when '2' => clear_screen(black); visuCommandeUtilisateur(commandeEnAttenteDeFacturation.tete, arbreClient, pseudoConnecte); suivant;
               when '3' => clear_screen(black); visuCommandeEnAttentePrepa(commandeEnAttenteDePreparation.tete); suivant;
               when '4' => clear_screen(black); afficherStock(leStock); suivant;
               when 'D' | 'd' => seDeconnecter(userConnecte, catConnectee, pseudoConnecte); suivant;
               when others => put_line("Choix non propose"); suivant;
            end case;



         elsif catConnectee = elfe then
            titre;
            put("Vous etes connecte en tant que ");
            afficherTexte(pseudoConnecte);
            new_line;

            put_line("1 - Generer une facture");
            put_line("2 - Enregistrer un reglement");
            put_line("3 - Visualiser les commandes en attente de facturation");
            put_line("4 - Visualiser les commandes en attente de reglement");
            put_line("5 - Visualiser les commandes archivees");
            put_line("6 - Calculer le bilan comptable");
            put_line("D - Se deconnecter");

            new_line;
            put_line("Que souhaitez-vous faire ?");
            put("=> ");
            get(choix2); skip_line; new_line;

            case choix2 is
               when '1' => clear_screen(black); facturationCommande(commandeEnAttenteDeFacturation, arbreClient, leStock); suivant;
               when '2' => clear_screen(black); reglementCommande(arbreClient); suivant;
               when '3' => clear_screen(black); visuCommandeEnAttenteFacturation(commandeEnAttenteDeFacturation.tete); suivant;
               when '4' => clear_screen(black); affichageCommandeEnAttenteReglement(arbreClient); suivant;
               when '5' => clear_screen(black); visuCommandeArchivee; suivant;
               when '6' => clear_screen(black); calculBilanCA; suivant;
               when 'D' | 'd' => seDeconnecter(userConnecte, catConnectee, pseudoConnecte); suivant;
               when others => put_line("Choix non propose"); suivant;
            end case;


         elsif catConnectee = magicien then
            titre;
            put("Vous etes connecte en tant que ");
            afficherTexte(pseudoConnecte);
            new_line;

            put_line("1 - Visualiser le stock");
            put_line("2 - Visualiser les besoins");
            put_line("3 - Reapprovisionnement le stock");
            put_line("D - Se deconnecter");

            new_line;
            put_line("Que souhaitez-vous faire ?");
            put("=> ");
            get(choix2); skip_line; new_line;

            case choix2 is
               when '1' => clear_screen(black); afficherStock(leStock); suivant;
               when '2' => clear_screen(black); visualisationBesoin(tabBesoin); suivant;
               when '3' => clear_screen(black); reapprovisionnementStock(leStock); suivant;
               when 'D' | 'd' => seDeconnecter(userConnecte, catConnectee, pseudoConnecte); suivant;
               when others => put_line("Choix non propose"); suivant;
            end case;


         elsif catConnectee = grandMagicien then
            titre;
            put("Vous etes connecte en tant que ");
            afficherTexte(pseudoConnecte);
            new_line;

            put_line("1 - Visualiser la liste des employes");
            put_line("2 - Nouvelle embauche");
            put_line("3 - Supprimer un membre du personnel");
            put_line("4 - Visualiser le stock");
            put_line("5 - Visualiser la liste des clients");
            put_line("6 - Traitement des mots de passe oublies");
            put_line("D - Se deconnecter");

            new_line;
            put_line("Que souhaitez-vous faire ?");
            put("=> ");
            get(choix2); skip_line; new_line;

            case choix2 is
               when '1' => clear_screen(black); visuEmploye(lePersonnel); suivant;
               when '2' => clear_screen(black); nouvelleEmbauche(lePersonnel); suivant;
               when '3' => clear_screen(black); suppressionEmploye(lePersonnel); suivant;
               when '4' => clear_screen(black); afficherStock(leStock); suivant;
               when '5' => clear_screen(black); visuClient(arbreClient); suivant;
               when '6' => clear_screen(black); genererMDP(lePersonnel, fileMDPOublie); suivant;
               when 'D' | 'd' => seDeconnecter(userConnecte, catConnectee, pseudoConnecte); suivant;
               when others => put_line("Choix non propose"); suivant;
            end case;
         end if;
      end if;
   end loop;


end main;
