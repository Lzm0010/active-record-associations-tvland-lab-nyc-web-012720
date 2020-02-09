class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def actors_list
    self.characters.map{|char| char.actor.full_name}
  end

  def build_network(attributes)
    n = Network.new(attributes)
    n.shows << self
  end
end