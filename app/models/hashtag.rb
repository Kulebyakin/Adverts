class Hashtag < ApplicationRecord
  has_many :hashtagisation
  has_many :adverts, through: :hashtagisation

  validates :title, presence: true
end