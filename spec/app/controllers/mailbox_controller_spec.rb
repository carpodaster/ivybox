require 'spec_helper'

describe "MailboxController" do
  before do
    get "/mailbox"
  end

  it "renders a mail form" do
    expect(last_response.status).to eql 200
    pending
  end
end
