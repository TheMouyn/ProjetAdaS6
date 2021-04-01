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

end gestion_commande;
