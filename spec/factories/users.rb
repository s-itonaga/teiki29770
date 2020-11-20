FactoryBot.define do
  factory :user do
    name     { 'TSUTAYAテスト店' }
    code     { '12345678' }
    email    { 'aaa@aaa' }
    password { '111aaa' }
    password_confirmation { password }
  end
end
