class Faq < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: true

  validates :content, presence: true,
                    uniqueness: true
end
