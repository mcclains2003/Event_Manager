require './lib/event_manager'
require 'sunlight/congress'

describe 'EventManager' do

  before do
    @em = EventManager.new
    @zipcode_short = "1234"
    @zipcode_empty = ""
    @zipcode_long = "123456"
    @zipcode = "00924"
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
    @em.clean_zipcode(@zipcode).should == "00924"
  end

  it "returns legislator for that zipcode" do
    @em.legislators_by_zipcode(@zipcode).should == "Pedro Pierluisi"
  end

end