require "rails_helper"

describe AssignPhoneService do
  let(:phone) { {
    user_email: 'example@mail.com',
    phone: nil
  } }
  let(:last_phone) { Phone.last }
  let(:specific_number) { '123-456-7891' }

  context 'Create phone without specified phone param' do
    it 'should create phone with MIN_VALUE' do
      expect(described_class.call(phone)).to eq last_phone
    end
  end

  context 'Create phone with specific phone number' do
    before { phone[:phone] = specific_number }
    it 'should create phone with specific number' do
      expect(described_class.call(phone).phone).to eq last_phone.phone
    end

    before { described_class.call(phone) }
    it 'should create a number when specific exists' do
      expect(described_class.call(phone).phone) != last_phone.phone
    end
  end

  context "Send alert message if user didn't enter email" do
    before { phone[:user_email] = nil }
    it 'should return message' do
      expect(described_class.call(phone)).to eq 'Enter your email'
    end
  end
end
