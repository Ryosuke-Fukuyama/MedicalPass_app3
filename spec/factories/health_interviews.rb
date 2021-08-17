FactoryBot.define do
  factory :health_interview do
    age { '54' }
    gender { 'man' }
    symptomatology { '症状' }
    condition { '持病' }
    comment { '' }
  end
  factory :second_health_interview, class: 'HealthInterview' do
    age { '' }
    gender { '' }
    symptomatology { '' }
    condition { '' }
    comment { 'コメント1' }
  end
  factory :third_health_interview, class: 'HealthInterview' do
    age { '' }
    gender { '' }
    symptomatology { '' }
    condition { '' }
    comment { 'コメント2' }
  end
end
