class Hashtag < ApplicationRecord
  has_many :hashtagisations
  has_many :adverts, through: :hashtagisation

  validates :title, presence: true
end