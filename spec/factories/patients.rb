FactoryBot.define do
  factory :patient do
    name { "patient1" }
    email { "patient1@mail.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
  factory :second_patient, class: Patient do
    name { "patient2" }
    email { "patient2@mail.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
  factory :third_patient, class: Patient do
    name { "patient3" }
    email { "patient3@mail.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
  factory :fourth_patient, class: Patient do
    name { "patient4" }
    email { "patient4@mail.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
  factory :fifth_patient, class: Patient do
    name { "patient5" }
    email { "patient5@mail.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
