class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  validates_presence_of [:email, :password]
  validates_confirmation_of :password
  validates_uniqueness_of :email

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
end
