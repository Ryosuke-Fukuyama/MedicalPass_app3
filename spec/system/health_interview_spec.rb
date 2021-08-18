
  before do
    visit hospital_health_interviews_path
  end

  xdescribe '一覧表示機能' do
    context '予約一覧画面に遷移した場合' do
      example 'created_atの昇順で表示される' do
        @list_top = first('.list_of_healthinterviews')
        expect(@list_top).to have_content health_interview_2.id
      end
    end
  end

  # patient_side
  describe '新規作成機能' do
    context '既に受付済みの場合' do
      example '新規受付が表示されない' do
        click_link 'ログイン'
        fill_in :patient_name, with: patient2.name
        fill_in :patient_password, with: 'password'
        click_button 'ログイン'
        visit hospital_health_interviews_path
        expect(page).not_to have_content '新規受付'
      end
    end

    context '受付中のでない場合' do
      befor_do
      click_link 'ログイン'
      fill_in :patient_name, with: patient1.name
      fill_in :patient_password, with: 'password'
      click_button 'ログイン'
      visit hospital_health_interviews_path
      click_link '新規受付'
      click_button '申し込む'
    end

    example '申し込みできる' do
      expect(page).to have_content '受付を完了しました'
    end
      # example 'マイページに整理券番号が表示される' do
      #   expect(page).to have_content "番号"
      # end
  end
end

  # describe 'アナウンス機能' do
  #   context 'ステータスがスタッフ側から変更された時' do
  #     example 'マイページのアナウンスが切り替わる' do
  #       visit new_staff_session_path
  #       fill_in :staff_name,    with: staff.name
  #       fill_in :staff_password, with: "password"
  #       click_button "スタッフログイン"
  #       first("option[value='calling']").select_option
  #       click_link "ログアウト"
  #       click_link "ログイン"
  #       fill_in :patient_name,     with: patient2.name
  #       fill_in :patient_password, with: "password"
  #       click_button "ログイン"
  #       expect(page).to have_content "こちらの画面をご提示の上、診察室へお入り下さい。"
  #     end
  #   end
  # end

  # staff_side
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

  # describe 'メール直前通知機能' do
  #   context '通知ボタン押した時' do
  #     example '該当者にメールが送られる' do
  #     end
  #   end
  # end
