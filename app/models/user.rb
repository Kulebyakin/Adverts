class User < ApplicationRecord
  belongs_to :role
  has_many :adverts

  # before_create :set_default_role
  # or 
  before_validation :set_default_role 

  private
  def set_default_role
    self.role ||= Role.find_by_name(:user)
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
