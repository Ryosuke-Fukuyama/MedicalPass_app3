FactoryBot.define do
  factory :hospital do
    name { '第一病院' }
    email { 'hospital1@mail.com' }
    tel { 0o000000001 }
    address { '〇〇県▲▲市◆◆' }
    access { '〇〇駅徒歩□□分' }
    image { open('./public/images/sample.jpg') }
    introduction { 'url: ~' }
  end
  factory :second_hospital, class: 'Hospital' do
    name { '第二病院' }
    email { 'hospital2@mail.com' }
    tel { 0o000000002 }
    address { '〇〇県▲▲市◆◆' }
    access { '〇〇駅徒歩□□分' }
    image { open('./public/images/test.jpg') }
    introduction { 'url: ~' }
  end
end
