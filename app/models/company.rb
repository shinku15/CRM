class Company < ApplicationRecord
  belongs_to :organization, optional: :true
  has_many :notes, dependent:  :destroy
  has_many :tasks, dependent:  :destroy
  has_many :feeds, dependent:  :destroy
end
