FactoryBot.define do
  factory :staff do
    name { '田中' }
    password { 'password123' }
    password_confirmation { 'password123' }
    # association :hospital, factory: :hospital
  end
  factory :second_staff, class: 'Staff' do
    name { '佐々木' }
    password { 'password123' }
    password_confirmation { 'password123' }
    # association :hospital, factory: :hospital
  end
  factory :admin_staff, class: 'Staff' do
    name { '鈴木' }
    password { 'password123' }
    password_confirmation { 'password123' }
    admin { true }
    # association :hospital, factory: :hospital
  end
end
