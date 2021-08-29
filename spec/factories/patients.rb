FactoryBot.define do
  factory :patient do
    name                  { '患者太郎' }
    email                 { 'patient1@mail.com' }
    password              { 'password123' }
    password_confirmation { 'password123' }
  end
  factory :second_patient, class: 'Patient' do
    name                  { '患者次郎' }
    email                 { 'patient2@mail.com' }
    password              { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at          { Time.now }
  end
  factory :third_patient, class: 'Patient' do
    name                  { '患者華子' }
    email                 { 'patient3@mail.com' }
    password              { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at          { Time.now }
  end
  factory :fourth_patient, class: 'Patient' do
    name                  { '患者幸子' }
    email                 { 'patient4@mail.com' }
    password              { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at          { Time.now }
  end
  factory :fifth_patient, class: 'Patient' do
    name                  { '患者三郎' }
    email                 { 'patient5@mail.com' }
    password              { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at          { Time.now }
  end
  factory :sixth_patient, class: 'Patient' do
    name                  { '患者信子' }
    email                 { 'patient6@mail.com' }
    password              { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at          { Time.now }
  end
end
