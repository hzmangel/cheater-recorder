class Provider
  include Mongoid::Document
  field :email, type: String

  has_and_belongs_to_many :cheaters
end
