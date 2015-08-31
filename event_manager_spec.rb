require './lib/event_manager'
require 'sunlight/congress'

describe 'EventManager' do

  it "returns legislator for that zipcode" do
    @em.legislators_by_zipcode(@zipcode).should == "Pedro Pierluisi"
  end

end