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

class User < ActiveRecord::Base
  # attr_accessible rende gli attributi accessibili
  # da qualsiasi utente esterno
  # rendo accessibili anche password e password_confirmation
  attr_accessible :name, :email, :password, :password_confirmation
  # metodo Rails che si assicura che password e password_confirmation
  # combacino, fornisce anche il metodo authenticate per comparare
  # password criptate con password_digest
  has_secure_password

  # passo un blocco a before_save callback che ci assicura che prima che
  # un'istanza venga salvata il valore dell'email
  # venga trasformato in minuscolo
  before_save { |user| user.email = email.downcase }

  # Creo la validazioen della presenza di attributi
  # uso il metodo validate su name passandogli un hash
  # con un solo elemento come secondo argomento
  
  # aggiungo una validazione della lunghezza del name
  validates :name, presence: true, length: { maximum: 50 }
  
  # CREO UNA COSTANTE PER LA REGEX del formato email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # aggiungo validazione presenza di una email che non sia vuota
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false } # garantisco univocità case insensitive
  # aggiungo vincolo presenza e lunghezza della password
  validates :password, presence: true, length: { minimum: 6 }
  # aggiungo vincolo presenza di password_confirmation
  validates :password_confirmation, presence:true

end
