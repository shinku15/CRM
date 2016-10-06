class Note < ApplicationRecord
  validates :description,presence: { message: "description must be present" }
  belongs_to :organization
  belongs_to :company
  belongs_to :user
  belongs_to :organization
  has_one :feed, as: :feedable, dependent:  :destroy
end
