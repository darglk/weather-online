class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""


      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.string :email

      ## Tokens
      t.text :tokens

      t.timestamps
    end

    add_index :users, :email
    add_index :users, [:uid, :provider],     :unique => true

    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end
end

#curl -X POST -v -H 'Content-Type: application/json' http://localhost:3000/api/auth/sign_in -d '{"email": "ciprojektwimiip@gmail.com", "password": "AX1BY2CZ3" }'