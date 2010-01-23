class Answer < ActiveRecord::Base
  include UserContent
  attr_accessible :body, :question_id

  belongs_to :question
  belongs_to :user

  validates_presence_of :body
  named_scope :no_downvotes, :conditions => "id NOT IN (select voteable_id from votes where voteable_type = 'Answer' and vote = 'f')"

end