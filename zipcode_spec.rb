require './lib/zipcode'

describe 'Zipcode' do

  before do
    @zipcode_short = "1234"
    @zipcode_empty = ""
    @zipcode_long = "123456"
    @zipcode = "00924"
  end

  it "fills in info for an empty zipcode" do
    Zipcode.clean_zipcode(@zipcode_empty).should == "00000"
  end

  it "fills in info for an short zipcode" do
    Zipcode.clean_zipcode(@zipcode_short).should == "01234"
  end

  it "shortens info for a long zipcode" do
    Zipcode.clean_zipcode(@zipcode_long).should == "12345"
  end

  it "passes a correct length zipcode" do
    Zipcode.clean_zipcode(@zipcode).should == "00924"
  end

end