class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  validates_presence_of :city, :state, :country, :address_type

  validates_presence_of :first_line, if: :location?

  def area?
  	self.address_type == 0
  end

  def location?
  	self.address_type == 1
  end

  def self.address_types
  	[
  		'area',
  		'location'
  	]
  end

  def address_type_readable
  	Address.address_types[self.address_type]
  end

  def basic_address
    "#{self.city}, #{self.state}, #{self.country}"
  end

  def display_address
    if self.area?
      "#{self.city}, #{self.state}, #{self.country}"
    elsif self.location?
      "#{self.first_line}, #{self.second_line}, #{self.city}, #{self.state}, #{self.country}"
    end
  end
end