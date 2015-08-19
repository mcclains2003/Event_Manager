require_relative 'event_manager'

describe 'EventManager' do

  before do
    @em = EventManager.new
    @zipcode_short = "1234"
    @zipcode_empty = ""
    @zipcode_long = "123456"
    @zipcode_correct = "12345"
  end

  it "fills in info for an empty zipcode" do
    @em.clean_zipcode(@zipcode_empty).should == "00000"
  end

  it "fills in info for an short zipcode" do
    @em.clean_zipcode(@zipcode_short).should == "01234"
  end

  it "shortens info for a long zipcode" do
    @em.clean_zipcode(@zipcode_long).should == "12345"
  end

  it "passes a correct length zipcode" do
    @em.clean_zipcode(@zipcode_correct).should == "12345"
  end

end