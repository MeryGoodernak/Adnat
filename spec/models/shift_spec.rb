require 'rails_helper'

RSpec.describe Shift, type: :model do
  subject { described_class.create(started_at: DateTime.now, ended_at: DateTime.now + 1.day) }
  describe "Validation" do
    it "is valid with valid attributes" do
      puts subject.started_at
      puts subject.ended_at
      expect(subject).to be_valid
    end
    it "is not valid without started_at"
    it "is not valid without ended_at"
    context "when start time is greater than end time" do
      it "is not valid"
    end
  end
end
