class IvyMail
  attr_accessor :from, :message, :subject

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
end
