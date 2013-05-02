require 'spec_helper'

describe List do
  it 'should have a name' do
    list = List.new(name: "Test To-Do List")
    list.name.should eql "Test To-Do List"
  end

  it 'is not valid if it does not have a name' do
    list = List.new
    list.valid?.should == false
  end

  it 'should have tasks' do
    list = List.new(name: "Test To-Do List")
    grocery_store_task = Task.create(description: "Buy groceries")
    laundry_task = Task.create(description: "Do laundry")
    ironing_task = Task.create(description: "Iron cape")
    save_world_task = Task.create(description: "Save the world")

    list.tasks << grocery_store_task
    list.tasks << laundry_task
    list.tasks << ironing_task
    list.tasks << save_world_task

    list.tasks.should == [grocery_store_task, laundry_task, ironing_task, save_world_task]
  end
end
