require './lib/phone_number'

describe 'PhoneNumber' do 

  before do
    @phone_sh = "214 - 554 - 989"
    @phone_lg = "(213) - 44499999"
    @phone_lg_one = "12134567890"
    @phone = "214-749.6000"
  end

  it "tests for a too short phone number and kicks it back as bad" do 
    PhoneNumber.clean_phone_num(@phone_sh).should == "Incomplete Number"
  end

  it "tests for a too long phone number and kicks it back as bad" do 
    PhoneNumber.clean_phone_num(@phone_lg).should == "Incomplete Number"
  end

  it "tests for a too long phone number with a leading 1" do 
    PhoneNumber.clean_phone_num(@phone_lg_one).should == "(213)456-7890"
  end

  it "returns a correctly formatted phone number" do 
    PhoneNumber.clean_phone_num(@phone).should == "(214)749-6000"
  end

end