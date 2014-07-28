require 'rails_helper'


describe Doc do

  it "has a valid factory" do

    expect(FactoryGirl.build(:doc)).to be_valid
    
  end

  it { is_expected.to have_one(:ad).dependent(:destroy) }

end





