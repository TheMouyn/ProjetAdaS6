with outils, gestion_prix, gestion_commande;
use outils, gestion_prix, gestion_commande;

package gestion_client is
   type T_client is record
      identite : T_identite;
      enAttentePaiement : T_PteurCommande := null; -- pointeur de liste de listeCommande en attente de paiement
      montantDu : T_prix := (0, 0);
   end record;

   -- arbre client
   type T_noeudClient;
   type T_arbreClient is access T_noeudClient;
   type T_noeudClient is record
      val : T_client;
      fg, fd : T_arbreClient;
   end record;


   -- prototype des procedures et fonctions
   procedure initClient(racine : in out T_arbreClient);
   procedure initCommandeEnAttenteDeReglement(racine : in out T_arbreClient);
   function clientExiste(racine : in T_arbreClient; identite : in T_identite) return boolean;
   procedure ajoutClient(racine : in out T_arbreClient; identite : in T_identite);
   procedure nouvelleCommande(fileCommandeEnAttente : in out T_fileCommande; racineClient : in out T_arbreClient; nuCommande : in out integer);
   function commandeExisteClient(tete : in T_PteurCommande; laIdentite : in T_identite) return boolean;
   procedure annulerCommande(file : in out T_fileCommande; racineArbre : in T_arbreClient);
   procedure afficherFactureClient(racineArbre : in T_arbreClient);
   procedure affichageCommandeEnAttenteReglement(racine : in T_arbreClient);
   procedure visuClient(racine : in T_arbreClient);
   procedure visuCommandeUtilisateur(teteFacture : in T_PteurCommande; racine : in T_arbreClient; pseudoConnecte : in T_mot);

end gestion_client;
