require 'spec_helper'

describe "Todo pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }

  describe "todo creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a todo" do
        expect { click_button "Submit" }.should_not change(Todo, :count)
      end
    end

    describe "with valid information" do
      before do
      	fill_in 'todo_title', with: "title Lorem ipsum" 
        fill_in 'todo_content', with: "content Lorem ipsum"
        fill_in 'todo_due_date', with: "02/03/2012"
      end 
      it "should create a todo" do
        expect { click_button "Submit" }.should change(Todo, :count).by(1)
      end
    end
  end

  describe "todo destruction" do
    before { FactoryGirl.create(:todo, user: user, due_date: "02/02/2012") }

    describe "as correct user" do
      before do 
        visit root_path
      end

      it "should delete a todo item" do
        expect { click_link "delete" }.should change(Todo, :count).by(-1)
      end
    end
  end
end
