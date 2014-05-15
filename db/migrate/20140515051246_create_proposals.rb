class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.references :user
      t.string :content
      t.boolean :answer, default: false

      t.timestamps
    end
  end
end
