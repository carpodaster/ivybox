class IvyMail
  include ActiveModel::Validations

  attr_accessor :from, :message, :subject

  validates :message, :recipient, :subject, presence: true
  validate  :requires_at_least_one_recipient

  def initialize(attributes = {})
    attributes.each do |attr, val|
      self.send("#{attr}=", val)
    end
  end

  def recipients
    @recipients ||= []
  end

  def recipient
    recipients.first
  end

  def recipients=(*args)
    @recipients = args
  end

  alias :recipient= :recipients=

  private

  def requires_at_least_one_recipient
    errors.add(:recipients, "can't be empty") if self.recipients.empty?
  end
end
