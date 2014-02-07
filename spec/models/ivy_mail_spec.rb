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

    describe '#recipient' do
      it 'returns nil if recipients is empty' do
        subject.stub(recipients: [])
        expect(subject.recipient).to be_nil
      end

      it 'returns the first element of recipients' do
        subject.stub(recipients: %w(foo bar))
        expect(subject.recipient).to eql 'foo'
      end
    end

    describe '#recipient=' do
      it 'sets recipients' do
        subject.recipient = 'Foobar'
        expect(subject.recipients).to eql %w(Foobar)
      end
    end
  end

  context 'with validations' do
    before { subject.valid? }

    it 'requires a subject' do
      expect(subject.errors[:subject]).to be_present
    end

    it 'requires a recipient' do
      expect(subject.errors[:recipient]).to be_present
    end

    it 'requires a message' do
      expect(subject.errors[:message]).to be_present
    end

    it 'requires at least one recipient' do
      expect(subject.errors[:recipients]).to be_present
    end
  end

end
