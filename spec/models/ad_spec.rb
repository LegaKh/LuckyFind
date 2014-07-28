require 'rails_helper'

RSpec.describe Ad, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:ad)).to be_valid
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:content).dependent(:destroy) }
end
