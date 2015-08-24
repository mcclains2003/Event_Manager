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

  before do 
    @em = EventManager.new
    @phone_sh = "214 - 554 - 989"
    @phone_lg = "(213) - 44499999"
    @phone_lg_one = "12134567890"
    @phone = "214-749.6000"
  end

  it "tests for a too short phone number and kicks it back as bad" do 
    @em.clean_phone_num(@phone_sh).should == "Bad Number"
  end

  it "tests for a too long phone number and kicks it back as bad" do 
    @em.clean_phone_num(@phone_lg).should == "Bad Number"
  end

  it "tests for a too long phone number with a leading 1" do 
    @em.clean_phone_num(@phone_lg_one).should == "(213)456-7890"
  end

  it "returns a correctly formatted phone number" do 
    @em.clean_phone_num(@phone).should == "(214)749-6000"
  end





end