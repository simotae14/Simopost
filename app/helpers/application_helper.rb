# CREO UN HELPER PER LA DEFINIZIONE DEL TITOLO PER INTERO
# il modulo è un modello per impacchettare metodi
module ApplicationHelper
  # Commento del documento
  # Restituisce il titolo completo ottenuto da una base
  def full_title(page_title) # definizione del metodo
  	# creo la var col titolo di base
  	# assegnamento della variabile
  	base_title = "Ruby on Rails Tutorial Sample App"
  	# controllo che il titolo della pagina non sia vuoto
  	# test booleano
  	if page_title.empty?
  		# se è vuoto ritorno il titolo di base
  		# return implicito
  		base_title
  	else
  		# interpolazione string
  		"#{base_title} | #{page_title}"
  	end
  end
end