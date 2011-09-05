class CreateAcessGranters < ActiveRecord::Migration
  def change
    create_table :acess_granters do |t|
      t.string :code
      t.string :access_token
      t.string :refresh_token
      t.datetime :access_token_expires_at
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end
  end
end
