require 'spec_helper'

describe IvyMail do

  context 'with attribute accessors' do
    %w(from message subject).each do |attribute|
      it "sets '#{attribute}'" do
        value = "value of #{}"
        expect do
          subject.send("#{attribute}=", value)
        end.to change { subject.send(attribute) }.from(nil).to(value)
      end
    end

    it 'sets attributes upon instantiation' do
      attributes = { from: 'foo', subject: 'bar' }
      subject = described_class.new attributes
      attributes.each do |attribute, value|
        expect(subject.send(attribute)).to eql value
      end
    end

    describe 'recipients' do
      it 'returns an empty list' do
        expect(subject.recipients).to eql []
      end
    end

    describe '#recipients' do
      it 'returns an empty list for a single address' do
        subject.recipients = 'foo@example.com'
        expect(subject.recipients).to eql ['foo@example.com']
      end
    end
  end

end
