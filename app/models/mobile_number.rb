class MobileNumber < ApplicationRecord
  validates :number, presence:true,length: { in: 6..10 },numericality: { only_integer: true }
  belongs_to :company, optional: true
end
