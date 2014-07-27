require 'rails_helper'

RSpec.describe LicensePlate, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:license_plate)).to be_valid
  end

  it { is_expected.to have_one(:ad).dependent(:destroy) }

end
