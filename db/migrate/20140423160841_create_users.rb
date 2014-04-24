class CreateUsers < ActiveRecord::Migration
  # metodo che determina i cambiamenti da fare al db
  def change
    # create_table metodo Rails che crea una tabella
    # che chiamerà col nome simbolico
    # t è una var del blocco, sta per table
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
