require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it { is_expected.to have_many(:ads).dependent(:destroy) }
  it { is_expected.to have_many(:docs).through(:ads) }
  it { is_expected.to have_many(:pets).through(:ads) }
  it { is_expected.to have_many(:license_plates).through(:ads) }
end
