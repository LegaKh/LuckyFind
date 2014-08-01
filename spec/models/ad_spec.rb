require 'rails_helper'
 
 
describe Ad do
 
  it "has a valid factory" do
 
    expect(FactoryGirl.build(:ad)).to be_valid
 
  end
 
  it "has a valid factory" do
 
    expect(FactoryGirl.build(:ad_doc)).to be_valid
 
  end
 
  it "has a valid factory" do
 
    expect(FactoryGirl.build(:ad_pet)).to be_valid
 
  end
 
  it "has a valid factory" do
 
    expect(FactoryGirl.build(:ad_license_plate)).to be_valid
 
  end
 
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:content).dependent(:destroy) }
 
end
