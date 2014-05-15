class CreateProposalRelationships < ActiveRecord::Migration
  def change
    create_table :proposal_relationships do |t|
      t.integer :proposal_id
      t.integer :answer_id

      t.timestamps
    end

    add_index :proposal_relationships, :proposal_id
    add_index :proposal_relationships, :answer_id
    add_index :proposal_relationships, [:proposal_id, :answer_id], unique: true
  end
end
