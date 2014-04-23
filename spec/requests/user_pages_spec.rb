# Creo del codice che testi il contenuto dei tag
# h1 e title
require 'spec_helper'

describe "UserPages" do

  # in base a funzionalità SASS definisco il soggetto
  # comune dei test che è la page
  subject { page }

  #describe "GET /user_pages" do
    #it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get user_pages_index_path
      #response.status.should be(200)
    #end
  #end

  # creo i test per la pagina di signup
  describe "signup page" do
  	# anzitutto definisco la denominazione del percorso
  	before { visit signup_path }

  	# controllo che il valore di h1 sia Sign up
  	it { should have_selector('h1', text: 'Sign up') }
  	# controllo che il contenuto di title sia il full_title + Sign up
  	it { should have_selector('title', text: full_title('Sign up')) }
  end
end