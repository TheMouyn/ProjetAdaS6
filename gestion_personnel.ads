with outils;
use outils;

package gestion_personnel is


   type T_categorie is (nain, elfe, magicien, grandMagicien);

   type T_personnel is record
      pseudo : T_mot := (others =>' ');
      categorie : T_categorie;
      nuMagique : integer;
      emprinte : integer;
      mdpFaux : boolean; -- permet de savoir si le mot de passe est valide ou non
   end record;

   -- liste du personnel
   type T_cellPersonnel;
   type T_PteurPersonnel is access T_cellPersonnel;
   type T_cellPersonnel is record
      val : T_personnel;
      suiv : T_PteurPersonnel;
   end record;

   -- file de personnel : permmet de gerer les demande de mdp pour Mandrake
   type T_filePersonnel is record
      tete, fin : T_PteurPersonnel;
   end record;


   -- prototype des procedures et fonctions
   procedure iniPersonnel(tete : in out T_PteurPersonnel);
   procedure visuEmploye(tete : in T_PteurPersonnel);

end gestion_personnel;
