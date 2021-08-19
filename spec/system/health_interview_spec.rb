describe '一覧表示機能' do
  context '予約一覧画面に遷移した場合' do
    example 'created_atの昇順で表示される' do
      @list_top = first('.list_of_healthinterviews')
      expect(@list_top).to have_content health_interview_2.id
    end
  end
end

describe 'ガイドラベル機能' do
  context 'ステータスを変更した時' do
    example '更新される' do
      visit new_staff_session_path
      fill_in :staff_name, with: staff.name
      fill_in :staff_password, with: 'password'
      click_button 'スタッフログイン'
      first("option[value='calling']").select_option
      @list_top = first('.list_of_healthinterviews')
      expect(@list_top).to have_content health_interview_2.id
      first("option[value='pending']").select_option
      @list_bottom = last('.list_of_healthinterviews')
      expect(@list_bottom).to have_content health_interview_2.id
    end
  end
end
