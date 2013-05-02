require 'spec_helper'

describe List do
  it 'should have a name' do
    list = List.new(name: "Test To-Do List")
    list.name.should eql "Test To-Do List"
  end
end
