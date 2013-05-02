require 'spec_helper'

describe Task do
  it 'should have a description' do
    task = Task.new(description: "Test Task")
    task.description.should eql "Test Task"
  end

  it 'is not valid if it does not have a description' do
    task = Task.new
    task.valid?.should == false
  end

  it 'is by default marked as incomplete' do
    task = Task.new(description: "New Test Task")
    task.completed?.should == false
  end

  it 'can be marked complete' do
    task = Task.new(description: "Test Task")
    task.mark_complete
    task.completed?.should == true
  end
end
