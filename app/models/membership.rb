class Membership < ActiveRecord::Base
  belongs_to :member

  validates :fee, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
