class Company < ApplicationRecord
  validates :name, :presence => {message: "name must be present"}
  validates :contact, presence:true,length: { in: 6..10 },numericality: { only_integer: true }
  validates :address, presence: true

  belongs_to :organization, optional: :true
  has_many :notes, dependent:  :destroy
  has_many :tasks, dependent:  :destroy
  has_many :feeds, dependent:  :destroy
  has_many :mobile_numbers, dependent: :destroy
  accepts_nested_attributes_for :mobile_numbers, reject_if: :all_blank, allow_destroy: true
end
