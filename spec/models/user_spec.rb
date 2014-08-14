require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it { is_expected.to have_many(:ads).dependent(:destroy) }
  it { is_expected.to have_many(:docs).through(:ads) }
  it { is_expected.to have_many(:pets).through(:ads) }
  it { is_expected.to have_many(:license_plates).through(:ads) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to ensure_length_of(:first_name).is_at_least(2) }
  it { is_expected.to ensure_length_of(:last_name).is_at_least(2) }

  it "should validate associate_model_object" do
    m = FactoryGirl.build(:user)
    m.ads.build(title: nil)
    expect(m.save).to eq(false)
  end
end
