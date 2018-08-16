class Story < ApplicationRecord
  # attribute :is_publish, :boolean
  validates :name, :link, presence: true
  has_many :votes do
    def latest
      order('id DESC').limit(3)
    end
  end

  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end
