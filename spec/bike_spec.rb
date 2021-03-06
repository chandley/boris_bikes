require 'bike'
require 'spec_helper'

describe Bike do

  let(:bike) { Bike.new }

  it "should not be broken after we create it" do
    expect(bike).not_to be_broken
    #expect(bike.broken?).to be false
  end

  it "should be able to break" do
    bike.break!
    expect(bike).to be_broken
  end

  it "should be able to get fixed" do
    bike.break!
    bike.fix!
    expect(bike).not_to be_broken
  end


end
