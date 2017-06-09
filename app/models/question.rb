class Question < ActiveRecord::Base
  belongs_to :questionable, polymorphic: true
  has_many :answers

  validates :question, presence: true
end