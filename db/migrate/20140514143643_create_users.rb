class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # default info
      t.string :name # nickname
      t.string :mysnu # mysnu login id
      t.string :password_digest

      t.boolean :active, default: false # needs email activation
      t.string :activation_token
      t.string :remember_token

      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
