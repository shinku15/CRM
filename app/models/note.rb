class Note < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_one :feed, as: :feedable, dependent:  :destroy
 

end