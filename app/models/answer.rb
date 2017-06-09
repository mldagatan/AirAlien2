class Answer < ActiveRecord::Base
  belongs_to :question
  validates :answer, presence: true, uniqueness: :question_id
  has_many :my_answers, class_name: "Service::MyAnswer"
  has_many :services, through: :my_answer
  has_many :professionals, through: :services
end