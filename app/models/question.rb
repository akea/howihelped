class Question < ActiveRecord::Base
  include UserContent

  attr_accessible :body, :title, :benefit

  has_many :answers, :dependent => :destroy
  has_many :approved_answers, :class_name => 'Answer', :conditions => { :akismet => "ham" }
  belongs_to :user

  has_friendly_id :title, :use_slug => true
  validates_presence_of :body, :benefit

  named_scope :no_downvotes, :order => 'created_at desc', :conditions => "id NOT IN (select voteable_id from votes where voteable_type = 'Question' and vote = 'f')"

end