class Proposal < ActiveRecord::Base
  belongs_to :user
  has_many :proposal_relationships, foreign_key: "proposal_id", dependent: :destroy
  has_many :answers, through: :proposal_relationships,
                     source: :answer

  validates :title, presence: true
  validates :content, presence: true
end
