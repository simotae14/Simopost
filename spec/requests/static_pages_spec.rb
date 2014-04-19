require 'spec_helper'

describe "Static pages" do
  # DEFINIRE UN ELEMENTO COMUNE
  # USO FUNZIONE let
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  # CREO TEST PER LA HOME PAGE
  describe "Home page" do
  	# IL TITOLO DELLA HOME
  	# Previsione dovrebbe contenere
  	# la giusta intestazione
  	it "should have the h1 'Sample App'" do
  		# controllo visitando la pagina
      # il metodo have_selector controlla che
      # il contenuto del TAG h1 sia quello
      # riferito dalla key :text
      visit '/static_pages/home'
      page.should have_selector('h1',
        :text => 'Sample App')
  	end	

  	# QUANDO VISITI LA HOME
  	# previsione comportamento desiderato
  	# dovrebbe contenere titolo 'Home'
  	it "should have the base title" do
  		# controlliamo visitando la pagina, URI
  		# CAPYBARA simula la visita dell'URI
  		visit '/static_pages/home'
  		# TEST
  		# usa la var page, data da Capybara, per testare
  		# che la pagina risultante ha il tag con il
      # giusto contenuto
  		page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App")
  	end

    # TESTO IL FATTO CHE LA HOME NON DOVREBBE AVERE
    # UN TITOLO SPECIFICO
    it "should not have a custom page title" do
      # reindirizzo alla URI di competenza
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  # CREO TEST PER LA HELP PAGE
  describe "Help page" do
    # IL TITOLO DELLA HELP
    # Previsione dovrebbe contenere
    # la giusta intestazione
    it "should have the h1 'Help'" do
      # controllo visitando la pagina
      # il metodo have_selector controlla che
      # il contenuto del TAG h1 sia quello
      # riferito dalla key :text
      visit '/static_pages/help'
      page.should have_selector('h1',
        :text => 'Help')
    end 
    
    # QUANDO VISITI LA HELP
    # previsione comportamento desiderato
    # dovrebbe contenere titolo 'Help'
    it "should have the title 'Help'" do
      # controlliamo visitando la pagina, URI
      # CAPYBARA simula la visita dell'URI
      visit '/static_pages/help'
      # TEST
      # usa la var page, data da Capybara, per testare
      # che la pagina risultante ha il tag con il
      # giusto contenuto
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  # CREO TEST PER LA ABOUT PAGE
  describe "About page" do
    # IL TITOLO DELLA ABOUT
    # Previsione dovrebbe contenere
    # la giusta intestazione
    it "should have the h1 'About Us'" do
      # controllo visitando la pagina
      # il metodo have_selector controlla che
      # il contenuto del TAG h1 sia quello
      # riferito dalla key :text
      visit '/static_pages/about'
      page.should have_selector('h1',
        :text => 'About Us')
    end 
    
    # QUANDO VISITI LA ABOUT
    # previsione comportamento desiderato
    # dovrebbe contenere titolo 'About Us'
    it "should have the title 'About Us'" do
      # controlliamo visitando la pagina, URI
      # CAPYBARA simula la visita dell'URI
      visit '/static_pages/about'
      # TEST
      # usa la var page, data da Capybara, per testare
      # che la pagina risultante ha il tag con il
      # giusto contenuto
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end

  # CREO TEST PER LA CONTACT PAGE
  describe "Contact page" do
    # IL TITOLO DELLA CONTACT
    # Previsione dovrebbe contenere
    # la giusta intestazione
    it "should have the h1 'Contact'" do
      # controllo visitando la pagina
      # il metodo have_selector controlla che
      # il contenuto del TAG h1 sia quello
      # riferito dalla key :text
      visit '/static_pages/contact'
      page.should have_selector('h1',
        :text => 'Contact')
    end 
    
    # QUANDO VISITI LA CONTACT
    # previsione comportamento desiderato
    # dovrebbe contenere titolo 'Contact'
    it "should have the title 'Contact'" do
      # controlliamo visitando la pagina, URI
      # CAPYBARA simula la visita dell'URI
      visit '/static_pages/contact'
      # TEST
      # usa la var page, data da Capybara, per testare
      # che la pagina risultante ha il tag con il
      # giusto contenuto
      page.should have_selector('title', :text => "#{base_title} | Contact")
    end
  end
end
