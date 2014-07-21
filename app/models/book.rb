class Book < ActiveRecord::Base
  has_many :chapters, dependent: :destroy

  COUNTRIES = ['USA Probably', 'United Kingdom', 'Ukraine', 'India']

  searchable  do
    text :name, stored: true
    text :author, stored: true
    text :description, stored: true
  end
end
