class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	# implementiamo il forzare univocità email
  	# usiamo metodo Rails add_index per aggiungere
  	# nella tabella users un indice alla colonna email
  	add_index :users, :email, unique: true
  end
end
