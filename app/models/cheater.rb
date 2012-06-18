class Cheater
  include Mongoid::Document
  field :mobile, type: String
  field :desc, type: String
  field :vote_up, type: Integer
  field :vote_down, type: Integer

  has_and_belongs_to_many :providers
end
