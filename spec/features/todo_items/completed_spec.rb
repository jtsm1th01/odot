require 'spec_helper'

describe "Completing todo items" do
  let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }
  let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }

  it "is successful when marking a single todo item complete" do
    expect(todo_item.completed_at).to eq(nil)
    visit_todo_list(todo_list)
    within dom_id_for(todo_item) do
      click_link "Mark Complete"
    end
    todo_item.reload
    expect(todo_item.completed_at).to_not eq(nil)
  end
  
end