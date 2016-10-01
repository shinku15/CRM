class Organization < ApplicationRecord
  has_many :users, dependent:  :destroy
  has_many :companies, dependent:  :destroy
  has_many :feeds,dependent:  :destroy
end
