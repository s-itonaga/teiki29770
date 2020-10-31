FactoryBot.define do
  factory :customer do
    name          {"山田太郎"}
    name_kana     {"ヤマダタロウ"}
    phone_number  {"09011110000"}
    association :user
  end
end
