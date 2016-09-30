class Task < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :assigned, class_name: "User", foreign_key: "assign_to"
  has_one :feed, as: :feedable, dependent:  :destroy

end
