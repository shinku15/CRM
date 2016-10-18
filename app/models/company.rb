class Company < ApplicationRecord
  require 'slack-notifier'
  validates :name, :presence => {message: "name must be present"}
  validates :email, :presence =>{message: "email must be present"}
  validates :contact, presence:true,length: { in: 6..10 },numericality: { only_integer: true }

  belongs_to :organization, optional: :true
  has_many :notes, dependent:  :destroy
  has_many :tasks, dependent:  :destroy
  has_many :feeds, dependent:  :destroy
  has_many :mobile_numbers, dependent: :destroy
  accepts_nested_attributes_for :mobile_numbers, reject_if: :all_blank, allow_destroy: true

  after_create :notification_send

  private

  def notification_send

    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    notifier.username = 'bunny'
    notifier.ping "Company Created"
    notifier.ping self.name
    notifier.ping self.email
  end

end
