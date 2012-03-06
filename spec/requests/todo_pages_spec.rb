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

      describe "error messages" do
        let(:error) { '1 error prohibited this todo from being saved' }
        before { click_button "Submit" }
        it { should have_content(error) } 
      end
    end

    describe "with valid information" do
      before do
      	fill_in 'todo_title', with: "title Lorem ipsum" 
      	fill_in 'todo_content', with: "content Lorem ipsum"
      end 
      it "should create a todo" do
        expect { click_button "Submit" }.should change(Todo, :count).by(1)
      end
    end
  end

  describe "todo destruction" do
    before { FactoryGirl.create(:todo, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a todo item" do
        expect { click_link "delete" }.should change(Todo, :count).by(-1)
      end
    end
  end
end
