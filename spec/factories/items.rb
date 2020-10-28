FactoryBot.define do
  factory :item do
    image                {"public/images/test_image.png"}
    name                 {"あああ"}
    description          {"あああ"}
    category_id          {2}
    status_id            {2}
    day_id               {2}
    prefecture_id        {2}
    shipping_charge_id   {2}
    price                {1234}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
 