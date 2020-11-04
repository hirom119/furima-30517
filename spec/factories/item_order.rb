FactoryBot.define do
  factory :item_order do
    post_code            {"123-1234"}
    prefecture_id        {2}
    city                 {"埼玉県所沢市"}
    address               {"1456-88"}
    phone_number         {"12345678910"}
    token                {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
    
  end
end
