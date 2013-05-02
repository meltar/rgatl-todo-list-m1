require 'spec_helper'

describe Task do
  it 'should have a description' do
    task = Task.new(description: "Test Task")
    task.description.should eql "Test Task"
  end
end
