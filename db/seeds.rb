HealthInterview.create!(
  symptomatology: "症状詳細",
  condition: "持病、服用中の薬等",
  )

  HealthInterview.eager_load(:guide_label).all.each do |h_i|
    GuideLabel.create!(health_interview_id: h_i.id,)
  end