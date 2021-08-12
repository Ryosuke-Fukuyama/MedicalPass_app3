10.times do |n|
  name = Gimei.name.katakana
  email = Faker::Internet.email
  password = "password0"

  Patient.create!(name: name,
                  email: email,
                  password: password,
                  confirmed_at: Time.now
                 )
end

10.times do |n|
  name = Gimei.name.katakana
  password = "password0"

  Staff.create!(name: name,
                password: password
               )
end

Staff.create!(name: "admin_staff",
              password: "password0",
              admin: true
             )

Patient.eager_load(:health_interview).all.each do |p|
  age = "#{1 + rand(100)}"
  gender = HealthInterview.genders.keys.sample

  HealthInterview.create!(age: age,
                          gender: gender,
                          symptomatology: "症状(テスト)",
                          condition: "持病等(テスト)",
                          patient_id: p.id
                          )
end

HealthInterview.eager_load(:guide_label).all.each do |h_i|
  GuideLabel.create!(health_interview_id: h_i.id,
                      # Staff_id: 1
                     )
end