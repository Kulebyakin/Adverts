class Advert < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :categorisation, dependent: :destroy
  has_many :categories, through: :categorisation
  has_many :hashtagisation
  has_many :hashtags, through: :hashtagisation

  default_scope { order(updated_at: :desc) }
  
  include AASM

  aasm(:status) do
    state :draft, initial: true
    state :new
    state :rejected
    state :accepted
    state :published
    state :archival

    event :moderate do
      transitions from: :draft, to: :new
      transitions from: :published, to: :new
      transitions from: :accepted, to: :new
      transitions from: :rejected, to: :new
    end

    event :reject do
      transitions from: :new, to: :rejected
    end

    event :accept do
      transitions from: :new, to: :accepted
    end

    event :publish do
      transitions from: :accepted, to: :published
      transitions from: :archival, to: :published
    end

    event :archive do
      transitions from: :published, to: :archival
    end
  end

end
