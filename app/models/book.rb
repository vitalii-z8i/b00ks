class Book < ActiveRecord::Base
  has_many :chapters, dependent: :destroy

  COUNTRIES = ['USA Probably', 'United Kingdom', 'Ukraine', 'India']
end
