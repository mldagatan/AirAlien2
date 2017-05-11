class Exprequire < ActiveRecord::Base
  belongs_to :experience
  validates :is_legal, presence: true
  validates :certification, presence: true
  validates :extra_requirements, presence: true
end
