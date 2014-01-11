class IvyMail
  include ActiveModel::Validations

  attr_accessor :from, :message, :subject

  validates_presence_of :message, :subject
  validate :requires_at_least_one_recipient

  def initialize(attributes = {})
    attributes.each do |attr, val|
      self.send("#{attr}=", val)
    end
  end

  def recipients
    @recipients ||= []
  end

  def recipients=(*args)
    @recipients = args
  end

  private

  def requires_at_least_one_recipient
    errors.add(:recipients, "can't be empty") if self.recipients.empty?
  end
end
