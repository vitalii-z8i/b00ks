class Chapter < ActiveRecord::Base
  belongs_to :book

  searchable do
    text :inner_text, stored: true
  end
end
