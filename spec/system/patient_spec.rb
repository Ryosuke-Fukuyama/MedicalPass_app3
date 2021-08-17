require 'rails_helper'
RSpec.describe 'ログイン機能', type: :system do
  let!(:patient1){FactoryBot.create(:patient)}
  let!(:patient2){FactoryBot.create(:second_patient)}
  let!(:health_interview){FactoryBot.create(:health_interview,patient: patient2)}
  before do
    visit health_interviews_path
  end

  describe '患者側ユーザー登録のテスト' do
    context 'ユーザーを新規作成した場合' do
      example 'reCAPTCHAチェックしないと作成できない' do
        click_on "新規アカウント"
        expect(current_path).to have_content '/patients/sign_up'
        fill_in :patient_name,                  with: "test_patient"
        fill_in :patient_email,                 with: "test@mail.com"
        fill_in :patient_password,              with: "password"
        fill_in :patient_password_confirmation, with: "password"
        click_button "アカウント登録"
        expect(page).to have_content "アカウント登録"
      end
    end
  end

  describe 'セッション機能' do
    before do
      click_on 'ログイン'
      fill_in :patient_name,     with: patient1.name
      fill_in :patient_password, with: patient1.password
      click_button "commit"
    end
    context 'ログイン' do
      example 'できる' do
        expect(page).to have_content "ログインしました"
      end
    end
    context 'ログインすると' do
      example 'そのユーザーページに転移' do
        expect(page).to have_content "patient-①様"
        expect(current_path).to have_content "/patients/#{patient1.id}"
      end
    end
    context 'ユーザの編集画面から' do
      example 'ユーザー編集できる' do
        click_link 'アカウント編集'
        # expect(current_path).to have_content "/patients/edit.#{patient1.id}"
        fill_in :patient_name,     with: "編集太郎"
        fill_in :patient_email,     with: "test@gmail.com"
        fill_in :patient_password,     with: "111111"
        fill_in :patient_password_confirmation,     with: "111111"
        fill_in :patient_current_password,     with: "password"
        click_button "commit"
        expect(page).to have_content "アカウント情報を変更しました。"
      end
    end
    context '編集内容が空だと' do
      example '編集に失敗して遷移しない' do
        click_link 'アカウント編集'
        expect(current_path).to have_content "/patients/edit.#{patient1.id}"
        click_button "commit"
        expect(page).to have_content "エラーが発生したため お客様情報 は保存されませんでした。"
      end
    end
    context 'アカウント削除' do
      example 'ログイン画面に転移' do
        click_link 'アカウント編集'
        click_on 'アカウント削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。"
      end
    end
    context 'ログアウト' do
      example 'ログイン画面に転移' do
        click_on "ログアウト"
        expect(page).to have_content "ログアウトしました"
      end
    end
  end
end