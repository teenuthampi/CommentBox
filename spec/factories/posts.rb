FactoryGirl.define do
  factory :post do
    title 'short title'
    content 'My content'
    
    association :comments, factory: :comments
  end
end



