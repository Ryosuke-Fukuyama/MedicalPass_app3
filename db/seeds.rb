10.times do |n|
  name =         Gimei.name.katakana
  email =        Faker::Internet.email
  password =     "password0"
  confirmed_at = Time.now

  Patient.create!(name:         name,
                  email:        email,
                  password:     password,
                  confirmed_at: confirmed_at,
                 )
end

Hospital.create!(name:           "テスト用病院",
                 email:        Faker::Internet.email,
                 tel:          Faker::PhoneNumber,
                 address:      Gimei.address.kanji,
                 access:       "〇〇駅 徒歩◆◆分",
                 introduction: Faker::Internet.url,
                 image:        open("./public/images/test.jpg"),
                 id: 1
                )

10.times do |n|
  name =         "サンプル病院#{n}"
  email =        Faker::Internet.email
  tel =          Faker::PhoneNumber
  address =      Gimei.address.kanji
  access =       "〇〇駅 徒歩◆◆分"
  introduction = Faker::Internet.url
  image =        "./public/images/sample.jpg"
  id =           "#{2+n}"

  Hospital.create!(name:        name,
                   email:        email,
                   tel:          tel,
                   address:      address,
                   access:       access,
                   introduction: introduction,
                   image:        open(image),
                   id:           id
                  )
end

10.times do |n|
  name =     Gimei.unique.name.last.kanji
  password = "password0"

  Staff.create!(name:        name,
                password:    password,
                hospital_id: 1
               )
end

Patient.eager_load(:health_interviews).all.each do |p|
  age =            "#{1 + rand(100)}"
  gender =         HealthInterview.genders.keys.sample
  symptomatology = "症状(サンプル)"
  condition =      "持病等(サンプル)"


  HealthInterview.create!(age:            age,
                          gender:         gender,
                          symptomatology: symptomatology,
                          condition:      condition,
                          patient_id:     p.id,
                          hospital_id:    1
                          )
end

HealthInterview.eager_load(:guide_label).all.each do |h_i|
  GuideLabel.create!(health_interview_id: h_i.id)
end

[
  ["内科"],
  ["外科"],
  ["整形外科"],
  ["皮膚科"],
  ["整形外科"],
  ["脳神経外科"],
  ["眼科"],
  ["耳鼻科"],
  ["小児科"],
  ["歯科"]
].each do |name|
    HospitalLabel.create!(name: name)
end