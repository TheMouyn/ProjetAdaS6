with outils, gestion_prix, sequential_io;
use outils, gestion_prix;

package gestion_commande is

   type T_nomArticle is (potionInvisibilite, potionMetamorphose, baguette, epee, filtreAmour, sortImmobilisation);

   type T_article is record
      -- permet de stocker les informations prix d'article ou quantite stock, quantite commande
      prix : T_prix := (0,0);
      quantite : integer := 0;
   end record;

   -- ce tableau permet de lister les articles dans une commande, le stock, mais aussi le prix des articles
   type T_table_article is array (T_nomArticle) of T_article;

   type T_commande is record
      identiteClient : T_identite;
      nuCommande : integer;
      articleCommande : T_table_article; -- tableau des produits de la commande
      preparateur : T_mot := (others =>' ');
      montant : T_prix;
      -- status de la commande -> placement dans une liste specifique
   end record;


   -- liste commande
   type T_cellCommande;
   type T_PteurCommande is access T_cellCommande;
   type T_cellCommande is record
      val : T_commande;
      suiv : T_PteurCommande;
   end record;

   -- file de commande
   type T_fileCommande is record
      tete, fin : T_PteurCommande;
   end record;

   -- gestion du fichier d'archive
   package Fichier_archive_commande is new sequential_io(T_commande);
   use Fichier_archive_commande;
   varFichier_T_commande : Fichier_archive_commande.file_type;


end gestion_commande;
