class Provider
  include Mongoid::Document
  field :email, type: String
  field :amount, type: Integer, default: 0

  has_and_belongs_to_many :cheaters

  validates :email, acceptance: true
  validates :email, uniqueness: true
  validates :cheaters, associated: true
end
