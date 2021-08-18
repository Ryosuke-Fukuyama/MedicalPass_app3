FactoryBot.define do
  factory :staff do
    name { 'staff1' }
    password { 'password123' }
    password_confirmation { 'password123' }
    # association :hospital, factory: :hospital
  end
  factory :second_staff, class: 'Staff' do
    name { 'staff2' }
    password { 'password123' }
    password_confirmation { 'password123' }
    # association :hospital, factory: :hospital
  end
  factory :admin_staff, class: 'Staff' do
    name { 'staff-A' }
    password { 'password123' }
    password_confirmation { 'password123' }
    admin { true }
    # association :hospital, factory: :hospital
  end
end
