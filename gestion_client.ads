with outils, gestion_prix, gestion_commande;
use outils, gestion_prix, gestion_commande;

package gestion_prix is
   type T_client is record
      identite : T_identite;
      enAttentePaiement : T_PteurCommande; -- pointeur de liste de listeCommande en attente de paiement
      montantDu : T_prix;
   end record;

   -- arbre client
   type T_noeudClient;
   type T_arbreClient is access T_noeudClient;
   type T_noeudClient is record
      val : T_client;
      fg, fd : T_arbreClient;
   end record;


end gestion_prix;
