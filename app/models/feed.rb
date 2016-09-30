class Feed < ApplicationRecord
  belongs_to :organization
  belongs_to :company
  belongs_to :feedable, polymorphic: true
end
