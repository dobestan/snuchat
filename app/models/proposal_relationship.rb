class ProposalRelationship < ActiveRecord::Base
  #attr_accessible :answer_id

  belongs_to :proposal, class_name: "Proposal"
  belongs_to :answer, class_name: "Proposal"

  validates :proposal_id, presence: true
  validates :answer_id, presence: true
end
