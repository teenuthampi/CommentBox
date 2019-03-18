FactoryGirl.define do
  factory :comment do
    content 'short content'
    user_name 'Mystring'
    post nil
    
    association :post, factory: :post
  end
end



