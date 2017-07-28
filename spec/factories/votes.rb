FactoryGirl.define do
    factory :votes do
        value RandomData.random_integer
        user
        post
    end
end