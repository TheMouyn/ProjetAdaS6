with outils;
use outils;

package gestion_personnel is


   type T_categorie is (nain, elfe, magicien, grandMagicien);

   type T_personnel is record
      pseudo : T_mot := (others =>' ');
      categorie : T_categorie;
      nuMagique : integer;
      empreinte : integer;
      mdpFaux : boolean; -- permet de savoir si le mot de passe est valide ou non
   end record;

   -- liste du personnel
   type T_cellPersonnel;
   type T_PteurPersonnel is access T_cellPersonnel;
   type T_cellPersonnel is record
      val : T_personnel;
      suiv : T_PteurPersonnel;
   end record;

   -- file de pseudo : permmet de gerer les demande de mdp pour Mandrake
   type T_cellPseudo;
   type T_PteurPseudo is access T_cellPseudo;
   type T_cellPseudo is record
      val : T_mot := (others => ' ');
      suiv : T_PteurPseudo;
   end record;

   type T_filePseudo is record
      tete, fin : T_PteurPseudo;
   end record;


   -- prototype des procedures et fonctions
   procedure iniPersonnel(tete : in out T_PteurPersonnel);
   procedure visuEmploye(tete : in T_PteurPersonnel);
   function employeExiste(tete : in T_PteurPersonnel; lePseudo : in T_mot) return boolean;
   procedure nouveauMDP(personnel : in out T_personnel);
   procedure saisieCategorie(laCat : out T_categorie);
   procedure nouvelleEmbauche(tete : in out T_PteurPersonnel);
   procedure suppressionEmploye(tete : in out T_PteurPersonnel);
   procedure MDPOublie(tete : in out T_PteurPersonnel; file : in out T_filePseudo);
   function recupereEmploye(tete : in T_PteurPersonnel; lePseudo : in T_mot) return T_personnel;
   procedure bloquageCompte(tete : in out T_PteurPersonnel; fileMDPOublie : in out T_filePseudo; lePseudo : in T_mot);
   procedure seConnecter(tete : in out T_PteurPersonnel; fileMDPOublie : in out T_filePseudo; userConnecte : in out boolean; catConnectee : in out T_categorie; pseudoConnecte : in out T_mot);
   procedure seDeconnecter(userConnecte : in out boolean; catConnectee : in out T_categorie; pseudoConnecte : in out T_mot);

end gestion_personnel;
