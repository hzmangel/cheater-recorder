class Cheater
  include Mongoid::Document
  field :mobile, type: String 
  field :desc, type: String, default: ""
  field :vote_up, type: Integer, default: 0
  field :vote_down, type: Integer, default: 0

  has_and_belongs_to_many :providers

  validates :mobile, presence: true
  validates :mobile, uniqueness: true
  validates :providers, associated: true
end
