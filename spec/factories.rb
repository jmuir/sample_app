FactoryGirl.define do
  factory :user do
    name                  "Johan Muir"
    email                 "johanmuir-test@gmail.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end
