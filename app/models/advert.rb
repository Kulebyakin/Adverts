class Advert < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  
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
    end

    event :reject do
      transitions from: :new, to: :rejected
    end

    event :accept do
      transitions from: :new, to: :accepted
    end

    event :publish do
      transitions from: :accepted, to: :published
    end

    event :archive do
      transitions from: :published, to: :archival
    end
  end

end
