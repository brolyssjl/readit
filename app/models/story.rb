class Story < ApplicationRecord
  attribute :is_publish, :boolean
  validates :name, :link, presence: true
end
