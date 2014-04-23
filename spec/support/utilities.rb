# creo una utility per definizione metodo che crei
# il titolo intero ed evitare dunque ripetizione
# dell'intera stringa nei test
def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
  	base_title
  else
  	"#{base_title} | #{page_title}"
  end
end