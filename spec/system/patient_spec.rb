require 'rails_helper'

RSpec.describe 'Patient', type: :system do
  let!(:patient_0) { FactoryBot.create(:patient) }
  let!(:patient_1) { FactoryBot.create(:second_patient, confirmed_at: Time.now) }
  let!(:patient_2) { FactoryBot.create(:third_patient) }
  let!(:patient_3) { FactoryBot.create(:fourth_patient) }
  let!(:patient_4) { FactoryBot.create(:fifth_patient) }
  let!(:hospital) { FactoryBot.create(:hospital) }
  let!(:health_interview_0) { FactoryBot.create(:health_interview, patient_id: patient_0.id, hospital_id: hospital.id) }
  let!(:health_interview_1) { FactoryBot.create(:health_interview, patient_id: patient_1.id, hospital_id: hospital.id) }
  let!(:health_interview_2) { FactoryBot.create(:health_interview, patient_id: patient_2.id, hospital_id: hospital.id) }
  let!(:health_interview_3) { FactoryBot.create(:health_interview, patient_id: patient_3.id, hospital_id: hospital.id) }
  let!(:health_interview_4) { FactoryBot.create(:health_interview, patient_id: patient_4.id, hospital_id: hospital.id) }
  let!(:guide_label_0) { FactoryBot.create(:guide_label, health_interview_id: health_interview_0.id) }
  let!(:guide_label_1) { FactoryBot.create(:guide_label, status: 'calling', health_interview_id: health_interview_1.id) }
  let!(:guide_label_2) { FactoryBot.create(:guide_label, status: 'done', health_interview_id: health_interview_2.id) }
  let!(:guide_label_3) { FactoryBot.create(:guide_label, status: 'pending', health_interview_id: health_interview_3.id) }
  let!(:guide_label_4) { FactoryBot.create(:guide_label, status: 'noshow', health_interview_id: health_interview_4.id) }

  describe 'certification' do
    before do
      visit root_path
    end

    describe 'sign_up' do
      subject { current_path }

      before do
        click_on '新規アカウント'
      end

      it { is_expected.to have_content '/patients/sign_up' }

      context 'Failure' do
        example 'no name' do
          fill_in :patient_name,                  with: ''
          fill_in :patient_email,                 with: 'test@mail.com'
          fill_in :patient_password,              with: 'password123'
          fill_in :patient_password_confirmation, with: 'password123'
          click_on 'アカウント登録'
          expect(page).to have_content 'お名前を入力してください'
        end

        example 'no email' do
          fill_in :patient_name,                  with: 'test_patient'
          fill_in :patient_email,                 with: ''
          fill_in :patient_password,              with: 'password123'
          fill_in :patient_password_confirmation, with: 'password123'
          click_on 'アカウント登録'
          expect(page).to have_content 'Eメールを入力してください'
        end

        example 'no password' do
          fill_in :patient_name,                  with: 'test_patient'
          fill_in :patient_email,                 with: 'test@mail.com'
          fill_in :patient_password,              with: ''
          fill_in :patient_password_confirmation, with: 'password123'
          click_on 'アカウント登録'
          expect(page).to have_content 'パスワードを入力してください'
        end

        example 'not eq password ' do
          fill_in :patient_name,                  with: 'test_patient'
          fill_in :patient_email,                 with: 'test@mail.com'
          fill_in :patient_password,              with: 'password123'
          fill_in :patient_password_confirmation, with: 'password987'
          click_on 'アカウント登録'
          expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
        end
        # example 'no check' do
        #   fill_in :patient_name,                  with: "test_patient"
        #   fill_in :patient_email,                 with: "test@mail.com"
        #   fill_in :patient_password,              with: "password123"
        #   fill_in :patient_password_confirmation, with: "password123"
        #   click_on "アカウント登録"
        #   expect(page).to have_content "reCAPTCHA認証に失敗しました"
        # end
      end

      context 'success' do
        example 'fill in all' do
          fill_in :patient_name,                  with: 'test_patient'
          fill_in :patient_email,                 with: 'test@mail.com'
          fill_in :patient_password,              with: 'password123'
          fill_in :patient_password_confirmation, with: 'password123'
          # find('.recaptcha-checkbox-border').click
          click_on 'アカウント登録'
          expect(page).to have_content '本人確認用のメールを送信しました'
        end
      end
    end

    describe 'session' do
      describe 'sign_in' do
        before do
          click_on 'ログイン'
        end

        context 'Failure' do
          example 'no name both email' do
            fill_in :patient_login,    with: ''
            fill_in :patient_password, with: patient_0.password
            find('#submit').click
            expect(page).to have_content 'IDまたはパスワードが違います'
          end

          example 'no password' do
            fill_in :patient_login,    with: patient_0.name
            fill_in :patient_password, with: ''
            find('#submit').click
            expect(page).to have_content 'IDまたはパスワードが違います'
          end

          example 'not confirme' do
            fill_in :patient_login,    with: patient_0.name
            fill_in :patient_password, with: patient_0.password
            find('#submit').click
            expect(page).to have_content 'メールアドレスの本人確認が必要です'
          end
        end

        context 'success transition my_page' do
          example 'name in' do
            fill_in :patient_login,    with: patient_1.name
            fill_in :patient_password, with: patient_1.password
            find('#submit').click
            expect(page).to have_content 'ログインしました'
            expect(current_path).to have_content "/patients/#{patient_1.id}"
          end

          example 'email in' do
            fill_in :patient_login, with: patient_1.email
            fill_in :patient_password, with: patient_1.password
            find('#submit').click
            expect(page).to have_content 'ログインしました'
            expect(current_path).to have_content "/patients/#{patient_1.id}"
          end
        end
      end

      describe 'sign_out' do
        context 'success transition new_session' do
          example 'only' do
            click_on 'ログイン'
            fill_in :patient_login, with: patient_1.email
            fill_in :patient_password, with: patient_1.password
            find('#submit').click
            click_on 'ログアウト'
            expect(page).to have_content 'ログアウトしました'
            expect(current_path).to have_content '/patients/sign_in'
          end
        end
      end
    end
  end

  #  describe 'edit' do
  #   context 'ユーザの編集画面から' do
  #     example 'ユーザー編集できる' do
  #       click_link 'アカウント編集'
  #       # expect(current_path).to have_content "/patients/edit.#{patient1.id}"
  #       fill_in :patient_name,     with: "編集太郎"
  #       fill_in :patient_email,     with: "test@gmail.com"
  #       fill_in :patient_password,     with: "111111"
  #       fill_in :patient_password_confirmation,     with: "111111"
  #       fill_in :patient_current_password,     with: "password"
  #       click_button "commit"
  #       expect(page).to have_content "アカウント情報を変更しました。"
  #     end
  #   end
  #   context '編集内容が空だと' do
  #     example '編集に失敗して遷移しない' do
  #       click_link 'アカウント編集'
  #       expect(current_path).to have_content "/patients/edit.#{patient1.id}"
  #       click_button "commit"
  #       expect(page).to have_content "エラーが発生したため お客様情報 は保存されませんでした。"
  #     end
  #   end
  #   context 'アカウント削除' do
  #     example 'ログイン画面に転移' do
  #       click_link 'アカウント編集'
  #       click_on 'アカウント削除'
  #       page.driver.browser.switch_to.alert.accept
  #       expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。"
  #     end
  #   end
  #   context 'ログアウト' do
  #     example 'ログイン画面に転移' do
  #       click_on "ログアウト"
  #       expect(page).to have_content "ログアウトしました"
  #     end
  #   end
  # end
end
