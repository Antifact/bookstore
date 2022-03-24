FactoryBot.define do
  factory :listing do
    title { "MyString" }
    price { 1.5 }
    description { "MyString" }
    user { nil }
  end
end
