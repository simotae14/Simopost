require 'spec_helper'

describe "Static pages" do

  # poichè var page è usata in tutto il file
  # creo un subject che dica a Rspec che page
  # è il Subject del test
  subject { page }
  
  describe "Home page" do

    # elimino ripetizione visita a root_path
    # con un blocco before, da fare prima di ogni istruzione
    before { visit root_path }

    #it "should have the h1 'Sample App'" do
      #visit root_path
      #page.should have_selector('h1', text: 'Sample App')
    #end
    # grazie a before e Subject otterremo forma compressa
    it { should have_selector('h1', text: 'Sample App') }

    #it "should have the base title" do
      #visit root_path
      #page.should have_selector('title',
      #                  text: "Ruby on Rails Tutorial Sample App")
    #end
    # forma compressa
    it { should have_selector('title', text: full_title('')) }


    #it "should not have a custom page title" do
      #visit root_path
      #page.should_not have_selector('title', text: '| Home')
    #end
    # forma compressa
    it { should_not have_selector 'title', text: '| Home' }
  end


  describe "Help page" do
    before { visit help_path }
    
    #it "should have the h1 'Help'" do
    #  visit help_path
    #  page.should have_selector('h1', text: 'Help')
    #end
    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }

    #it "should have the title 'Help'" do 
    #  visit help_path
    #  page.should have_selector('title',
    #                    text: "Ruby on Rails Tutorial Sample App | Help")
    #end
  end

  
  describe "About page" do
    before { visit about_path }
    
    #it "should have the h1 'About'" do
    #  visit about_path
    #  page.should have_selector('h1', text: 'About Us')
    #end
    it { should have_selector('h1', text: 'About') }

    #it "should have the title 'About Us'" do 
    #  visit about_path
    #  page.should have_selector('title',
    #                    text: "Ruby on Rails Tutorial Sample App | About Us")
    #end 
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    #it "should have the h1 'Contact'" do
    #  visit contact_path
    #  page.should have_selector('h1', text: 'Contact')
    #end
    it { should have_selector('h1', text: 'Contact') }


    #it "should have the title 'Contact'" do 
    #  visit contact_path
    #  page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Contact")
    #end
    it { should have_selector('title', text: full_title('Contact')) } 
  end
end
  

#require 'spec_helper'

#describe "Static pages" do
  # DEFINIRE UN ELEMENTO COMUNE
  # USO FUNZIONE let
  #let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  # CREO TEST PER LA HOME PAGE
  #describe "Home page" do
  	# IL TITOLO DELLA HOME
  	# Previsione dovrebbe contenere
  	# la giusta intestazione
  	#it "should have the h1 'Sample App'" do
  		# controllo visitando la pagina
      # il metodo have_selector controlla che
      # il contenuto del TAG h1 sia quello
      # riferito dalla key :text
      #visit root_path
      #page.should have_selector('h1',
      #  text: 'Sample App')
  	#end	

  	# QUANDO VISITI LA HOME
  	# previsione comportamento desiderato
  	# dovrebbe contenere titolo 'Home'
  	#it "should have the base title" do
  		# controlliamo visitando la pagina, URI
  		# CAPYBARA simula la visita dell'URI
  		#visit root_path
  		# TEST
  		# usa la var page, data da Capybara, per testare
  		# che la pagina risultante ha il tag con il
      # giusto contenuto
  		#page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App")
  	#end

    # TESTO IL FATTO CHE LA HOME NON DOVREBBE AVERE
    # UN TITOLO SPECIFICO
    #it "should not have a custom page title" do
      # reindirizzo alla URI di competenza
      #visit root_path
      #page.should_not have_selector('title', text: '| Home')
    #end
  #end

  # CREO TEST PER LA HELP PAGE
  #describe "Help page" do
    # IL TITOLO DELLA HELP
    # Previsione dovrebbe contenere
    # la giusta intestazione
    #it "should have the h1 'Help'" do
      # controllo visitando la pagina
      # il metodo have_selector controlla che
      # il contenuto del TAG h1 sia quello
      # riferito dalla key :text
      #visit help_path
      #page.should have_selector('h1',
        #text: 'Help')
    #end 
    
    # QUANDO VISITI LA HELP
    # previsione comportamento desiderato
    # dovrebbe contenere titolo 'Help'
    #it "should have the title 'Help'" do
      # controlliamo visitando la pagina, URI
      # CAPYBARA simula la visita dell'URI
      #visit help_path
      # TEST
      # usa la var page, data da Capybara, per testare
      # che la pagina risultante ha il tag con il
      # giusto contenuto
      #page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Help")
    #end
  #end

  # CREO TEST PER LA ABOUT PAGE
  #describe "About page" do
    # IL TITOLO DELLA ABOUT
    # Previsione dovrebbe contenere
    # la giusta intestazione
    #it "should have the h1 'About'" do
      # controllo visitando la pagina
      # il metodo have_selector controlla che
      # il contenuto del TAG h1 sia quello
      # riferito dalla key :text
      #visit about_path
      #page.should have_selector('h1',
      #  text: 'About Us')
    #end 
    
    # QUANDO VISITI LA ABOUT
    # previsione comportamento desiderato
    # dovrebbe contenere titolo 'About Us'
    #it "should have the title 'About Us'" do
      # controlliamo visitando la pagina, URI
      # CAPYBARA simula la visita dell'URI
      #visit about_path
      # TEST
      # usa la var page, data da Capybara, per testare
      # che la pagina risultante ha il tag con il
      # giusto contenuto
      #page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | About Us")
    #end
  #end

  # CREO TEST PER LA CONTACT PAGE
  #describe "Contact page" do
    # IL TITOLO DELLA CONTACT
    # Previsione dovrebbe contenere
    # la giusta intestazione
    #it "should have the h1 'Contact'" do
      # controllo visitando la pagina
      # il metodo have_selector controlla che
      # il contenuto del TAG h1 sia quello
      # riferito dalla key :text
      #visit contact_path
      #page.should have_selector('h1',
        #text: 'Contact')
    #end 
    
    # QUANDO VISITI LA CONTACT
    # previsione comportamento desiderato
    # dovrebbe contenere titolo 'Contact'
    #it "should have the title 'Contact'" do
      # controlliamo visitando la pagina, URI
      # CAPYBARA simula la visita dell'URI
      #visit contact_path
      # TEST
      # usa la var page, data da Capybara, per testare
      # che la pagina risultante ha il tag con il
      # giusto contenuto
      #page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Contact")
    #end
  #end
#end