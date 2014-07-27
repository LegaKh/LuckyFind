require 'rails_helper'

RSpec.describe Pet, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:pet)).to be_valid
  end

  it { is_expected.to have_one(:ad).dependent(:destroy) }

end
