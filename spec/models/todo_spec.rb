require 'spec_helper'

describe Todo do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @todo = user.todos.build(
    	user_id: user.id, 
    	title: "test title", 
    	content: "Lorem ipsum",
    	due_date: "1/2/12",
    	complete: false,
    	icon: "icon path",
    	fileset_id: 1 )
  end

  subject { @todo }

  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:due_date) }
  it { should respond_to(:complete) }
  it { should respond_to(:icon) }
  it { should respond_to(:fileset_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @todo.user_id = nil }
    it { should_not be_valid }
  end  

  describe "when title is not present" do
    before { @todo.title = nil }
    it { should_not be_valid }
  end   

  describe "with title that is too long" do
    before { @todo.title = "a" * 101 }
    it { should_not be_valid }
  end
end
