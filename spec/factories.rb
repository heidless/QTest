FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
	content "Lorem ipsum"
	user
  end

  factory :todo do
  title "Lorem ipsum"
  due_date "07/05/2012"
	user
  end

end