require 'rails_helper'

RSpec.describe Shift, type: :model do
  subject do
    described_class.create(shift_date: Date.today,
                           start_time: Time.now,
                           end_time: Time.now + 1.hour,
                           user: user,
                           organisation: organisation)
  end

  let(:user) { User.create(name: 'Tester', email: 'test@email.com', password: "123456789") }
  let(:organisation) { Organisation.create(name: 'Organisation Test', hourly_rate: 10) }

  describe "Validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without shift_date and start_time" do
      subject.shift_date = nil
      subject.start_time = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without shift_date and end_time" do
      subject.shift_date = nil
      subject.end_time = nil
      expect(subject).not_to be_valid
    end

    context "when start time is greater than end time" do
      it "is not valid" do
        subject.start_time = Time.now + 3.hour
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#net_work_minutes" do
    it 'returns an integer in minute' do
      expect(subject.net_work_minutes).to eq(60)
    end
  end

  describe "#shift_cost" do
    context "when break_length is zero" do
      it "calculates the shift cost" do
        expect(subject.shift_cost(organisation.hourly_rate)).to eq(10)
      end
    end

    context "when break_length is not zero" do
      it "calculates the shift cost" do
        subject.break_length = 30
        expect(subject.shift_cost(organisation.hourly_rate)).to eq(5)
      end
    end
  end

  describe "#shift_date" do
    it "returns the date part of started_at" do
      expect(subject.shift_date).to eq(subject.started_at.to_date)
    end
  end

  describe "#start_time" do
    it "returns the time part of started_at" do
      expect(subject.start_time).to eq(subject.started_at.to_time)
    end
  end

  describe "#end_time" do
    it "returns the time part of ended_at" do
      expect(subject.end_time).to eq(subject.ended_at.to_time)
    end
  end
end
