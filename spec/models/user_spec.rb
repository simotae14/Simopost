# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"

  # anzitutto creo un User d'esempio, viene eseguito
  # prima di ogni esempio
  #before { @user = User.new(name: "Example User", email: "user@example.com") }
  before do
  	# creo istanza user con anche password e password_confirmation
  	@user = User.new(name: "Example User", email: "user@example.com",
password: "foobar", password_confirmation: "foobar")
  end

  # definisco come oggetto del nostro test l'istanza di User
  # rende @user l'oggetto di defualt dei nostri test
  subject { @user }

  # creo i test veri e propri, testano l'esistenza degli attributi
  # name e email, il metodo di rails respond_to? verifica
  # esistenza dell'attributo
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  # dovrà rispondere anche ad una password
  it { should respond_to(:password_digest) }
  # ad una password non criptata con sua conferma
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  # creo test che verifichi validità user
  it { should be_valid }

  # testo il caso di name non presente
  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  # testo il caso di email non presente
  describe "when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  # testo la lunghezza del nome che non deve esser superiore a 50
  describe "when name is too long" do
  	before { @user.name = "a" * 51 }
  	it { should_not be_valid }
  end

  # creiamo dei test sul formato degli indirizzi mail
  describe "when email format is invalid" do
  	# caso in cui non è valido
  	it "should be invalid" do
  	  # creo array di indirizzi con formato sbagliato
  	  addresses = %w[user@foo,com user_at_foo.org example.user@foo.
  		foo@bar_baz.com foo@bar+baz.com]
  	  # itero tra elementi array per testare che ognuno di
  	  # essi non è valido
  	  addresses.each do |invalid_address|
  		@user.email = invalid_address
  		# verifico che non è valido
  		@user.should_not be_valid
  	  end
  	end
  end

  # creiamo dei test su formati validi
  describe "when email format is valid" do
  	it "should be valid" do
  	  # creo array di indirizzi validi
  	  addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@naz.cn]
  	  # itero per testarne valdità elementi
  	  addresses.each do |valid_address|
  	  	@user.email = valid_address
  	  	@user.should be_valid
  	  end
  	end
  end

  # creo test che verifichi la presenza di doppioni
  # di indirizzi mail e segnali che non è valido
  describe "when email address is already taken" do
  	# prima di tutto creo un duplicato dell'istanza
  	# creata nel before iniziale
  	before do
  	  user_with_same_email = @user.dup
  	  # pongo anche la questione di indirizzi equivalenti
  	  # ma con valori maiuscolo e minuscolo diversi, in tal caso
  	  # cmq indirizzo è solo uno
  	  user_with_same_email.email = @user.email.upcase
  	  # e provo a salvarlo
  	  user_with_same_email.save
  	end
  	# testo che non può esser valido un duplicato
  	it { should_not be_valid }
  end

  # creo un test che validi la presenza della password
  # che non sia vuota
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  # creo un test sulla non corrispondenza della password
  describe "when password doesn't match confirmation" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
  end

  # creo un test che non permetta inserimento di valori nil
  # per la password
  describe "when password confirmation is nil" do
  	before { @user.password_confirmation = nil }
  	it { should_not be_valid }
  end

  # creo un test sulla lunghezza password almeno di 6 caratteri
  describe "with password that's too short" do
  	before { @user.password = @user.password_confirmation = "a" * 5 }
  	it { should be_invalid }
  end

  # testo il valore di ritorno dell'autenticazione
  describe "return value of authenticate method" do
  	# anzitutto salviamo su db user per sfruttare metodi find
  	before { @user.save }
  	# il let crea var locale ottenuta da blocco
  	let(:found_user) { User.find_by_email(@user.email) }

  	# test se la password è valida
  	describe "with valid password" do
  	  it { should == found_user.authenticate(@user.password) }
  	end

  	# test se la password non è valida
  	describe "with invalid password" do
  	  # il let assegna a var locale user_for...
  	  # il risultato del blocco
  	  let(:user_for_invalid_password) { found_user.authenticate("invalid")  }

  	  it { should_not == user_for_invalid_password }
  	  specify { user_for_invalid_password.should be_false }
  	end
  end
end
