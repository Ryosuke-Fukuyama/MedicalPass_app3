FactoryBot.define do
  factory :health_interview do
    age { '54' }
    gender { 'man' }
    symptomatology { '症状' }
    condition { '持病' }
    comment { '' }
    # association :patient, factory: :patient
    # association :hospital, factory: :hospital
  end
  factory :second_health_interview, class: 'HealthInterview' do
    age { '' }
    gender { '' }
    symptomatology { '' }
    condition { '' }
    comment { 'コメント1' }
    # association :patient, factory: :patient
    # association :hospital, factory: :hospital
  end
  factory :third_health_interview, class: 'HealthInterview' do
    age { '' }
    gender { '' }
    symptomatology { '' }
    condition { '' }
    comment { 'コメント2' }
    # association :patient, factory: :patient
    # association :hospital, factory: :hospital
  end
end
