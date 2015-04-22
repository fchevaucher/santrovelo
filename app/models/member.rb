class Member < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, allow_blank: true
  validates :phone_number, uniqueness: true, allow_blank: true

  has_many :memberships, dependent: :destroy

  accepts_nested_attributes_for :memberships

  def self.search condition
    self.where(
      "first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR phone_number LIKE ?", 
      "%#{condition}%", 
      "%#{condition}%", 
      "%#{condition}%", 
      "%#{condition}%"
    )
  end

  def has_valid_membership?
    memberships.any?{ |membership| membership.created_at > 1.year.ago }
  end
end
