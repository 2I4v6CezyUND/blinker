FactoryBot.define do
  factory  :model_variant do
    features {}
    trait :F150XL do
      name "XL"
      year Date.new(2018)
      starting_price_cents 1000000 
      features {}.to_json
    end

    trait :F150XLT do
      name "XLT"
      year Date.new(2018)
      starting_price_cents 10000000
    end
  end
end

