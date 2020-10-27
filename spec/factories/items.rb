FactoryBot.define do
  factory :item do
    image                {""}
    name                 {"あああ"}
    description          {"あああ"}
    category_id          {2}
    status_id            {2}
    day_id               {2}
    prefecture_id        {2}
    shipping_charge_id   {2}
    price                {1234}
    association :user
  end
end
 
