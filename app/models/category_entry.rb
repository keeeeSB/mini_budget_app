class CategoryEntry < ApplicationRecord
  belongs_to :category
  belongs_to :entry
end
