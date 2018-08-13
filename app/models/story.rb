class Story < ApplicationRecord
  # attribute :is_publish, :boolean
  validates :name, :link, presence: true
  has_many :votes

  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end
