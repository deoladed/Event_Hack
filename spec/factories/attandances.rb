FactoryBot.define do
  factory :attandance do
    stripe_customer_id { "blank" }
    user { FactoryBot.create(:user) }
    event { FactoryBot.create(:event) }
  end
end
