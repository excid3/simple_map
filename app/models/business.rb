class Business < ActiveRecord::Base
  acts_as_taggable
  acts_as_gmappable :lat => 'lat', :lng => 'lng', 
                    :check_process => :prevent_geocoding,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  belongs_to :user

  validates_presence_of :name, :address, :description

  def prevent_geocoding
    address.blank? || (!lat.blank? && !lng.blank?) 
  end

  def gmaps4rails_infowindow
    "<h3>#{ self.name }</h3><div>#{self.address}</div><hr/ ><div>#{self.description}</div>"
  end
end
# == Schema Information
#
# Table name: businesses
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  address     :string(255)
#  description :text
#  website     :string(255)
#  twitter     :string(255)
#  email       :string(255)
#  approved    :boolean         default(FALSE)
#  lat         :string(255)
#  lng         :string(255)
#  gmaps       :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

