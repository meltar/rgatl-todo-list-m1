require 'spec_helper'

describe 'list' do
  it 'can add tasks from the show list page' do
    list = List.create(name: "List Name")
    visit root_path
    click_link list.name
    click_link "Add Task"
    fill_in "task_description", with: "Get excited and make things"
    click_button "Create Task"

    page.should have_content "List Name"
    page.should have_content "Get excited and make things"
  end

  it 'can be edited from the edit task page' do
    list = List.create(name: "List Name")    
    grocery_store_task = Task.create(description: "Buy groceries")
    laundry_task = Task.create(description: "Do laundry")
    list.add_task(grocery_store_task)
    list.add_task(laundry_task)

    visit root_path
    click_link list.name
    click_link grocery_store_task.description

    fill_in "task_description", with: "Helicopter lesson"
    click_button "Update Task"
    page.should have_content "List Name"
    page.should have_content "Helicopter lesson"
  end

   it 'allows a user to mark a task as completed' do
    list = List.create(name: "List Name")    
    excited_task = Task.create(description: "Get excited")
    make_task = Task.create(description: "Make things")    
    list.add_task(excited_task)
    list.add_task(make_task)    

    visit list_path(list)
    click_link excited_task.description
    check "task_completed"
    click_button "Update Task"
    page.should_not have_css("del", text: make_task.description)
    page.should have_css("del", text: excited_task.description)
  end

  it 'allows a user to mark an incomplete task as not yet completed' do
    list = List.create(name: "List Name")    
    excited_task = Task.create(description: "Get excited")
    make_task = Task.create(description: "Make things")    
    list.add_task(excited_task)
    list.add_task(make_task)  
    excited_task.mark_complete  

    visit list_path(list)
    click_link excited_task.description
    uncheck "task_completed"
    click_button "Update Task"
    page.should_not have_css("del", text: excited_task.description)
  end

end
