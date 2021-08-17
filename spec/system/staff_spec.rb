require 'rails_helper'
RSpec.describe 'スタッフ機能', type: :system do
  let!(:patient1) { FactoryBot.create(:patient) }
  let!(:health_interview_1) { FactoryBot.create(:health_interview, patient: patient1) }
  let!(:guide_status_1) { FactoryBot.create(:guide_status, health_interview: health_interview_1, status: "calling") }

  let!(:patient2) { FactoryBot.create(:second_patient) }
  let!(:health_interview_2) { FactoryBot.create(:second_health_interview, patient: patient2) }
  let!(:guide_status_2) { FactoryBot.create(:guide_status, health_interview: health_interview_2) }

  let!(:patien3) { FactoryBot.create(:third_patient) }
  let!(:health_interview_3) { FactoryBot.create(:third_health_interview, patient: patien3) }
  let!(:guide_status_3) { FactoryBot.create(:guide_status, health_interview: health_interview_3) }

  let!(:staff) { FactoryBot.create(:staff) }
  let!(:admin_staff) { FactoryBot.create(:admin_staff) }

  describe 'セッション機能' do
    before do
      visit new_staff_session_path
      fill_in :staff_name,    with: staff.name
      fill_in :staff_password, with: "password"
      click_on "スタッフログイン"
    end
    context 'ログイン' do
      example 'できる' do
        expect(page).to have_content "ログインしました"
      end
    end
    context 'ログインすると' do
      example '予約一覧に転移' do
        expect(page).to have_content "予約一覧"
      end
    end
    context 'ログアウト' do
      example 'ログイン画面に転移' do
        click_on "ログアウト"
        expect(page).to have_content "ログアウトしました"
      end
    end
  end

  describe '管理画面' do
    before do
      visit new_staff_session_path
      fill_in :staff_name,    with: admin_staff.name
      fill_in :staff_password, with: "password"
      click_button "commit"
    end
    context '管理スタッフは患者一覧画面にアクセス' do
      subject { page }
      example 'できる' do
        click_on '患者一覧'
        is_expected.to have_content "患者一覧"
      end
    end
    context '管理スタッフは患者の削除をできる' do
      before do
        click_on '患者一覧'
        # 患者指定する記述
        expect(page).to have_content 'patient-①'
        click_on '削除',match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'patient-①'
        expect(page).to have_content '患者情報を削除しました！'
      end
    end
    context '管理スタッフはスタッフ一覧画面にアクセス' do
      example 'できる' do
       click_on 'スタッフ一覧'
       is_expected.to have_content "スタッフ一覧"
      end
    end
    context '管理スタッフはスタッフの新規登録ができる' do
      example 'できる' do
        click_on 'スタッフ一覧'
        expect(page).not_to have_content "test_staff"
        click_on '新規スタッフ'
        fill_in :staff_name,                  with: "test_staff"
        fill_in :staff_password,              with: "password"
        fill_in :staff_password_confirmation, with: 'password'
        click_on "登録する"
        expect(page).to have_content "test_staff"
      end
    end

    context '管理スタッフはスタッフの編集画面から' do
      example 'スタッフ編集できる' do
        click_on 'スタッフ一覧'
        # 患者指定する記述
        click_on '編集',match: :first
        fill_in :staff_password, with: "password"
        fill_in :staff_password_confirmation, with: 'password'
        check('staff_admin')
        click_button "commit"
        # expect(staff).to eq "true"
      end
    end
    context '管理スタッフはスタッフの削除をできる' do
      example 'スタッフ削除できる' do
        click_on 'スタッフ一覧'
          # 患者指定する記述
        expect(page).to have_content 'staff-①'
        click_on '削除',match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'staff-①'
        expect(page).to have_content 'スタッフを削除しました！'
      end
    end
  end

  describe 'ゲスト管理者ログイン機能' do
    before do
      visit root_path
    end
    context 'ゲストログインボタン（患者サイド）を押した場合' do
      example 'ゲストユーザー(患者サイド)でログインできる' do
        click_button "ゲストログイン(患者サイド)"
        expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      end
    end
    context 'ゲストログインボタン（管理者スタッフサイド）を押した場合' do
      example 'ゲストユーザー（管理者スタッフサイド）でログインできる' do
        click_button "ゲストログイン(管理者スタッフサイド)"
        expect(page).to have_content 'ゲスト管理者としてログインしました。'
      end
    end
    context '管理者サイドで患者削除ボタンを押した場合' do
      example '患者を削除できる' do
        click_button "ゲストログイン(管理者スタッフサイド)"
        click_link "患者一覧"
        click_on '削除',match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'patient-①'
      end
    end
    context '管理者サイドで患者さんの名前を押した場合' do
      example '患者さんの履歴が表示される' do
        click_button "ゲストログイン(管理者スタッフサイド)"
        click_link "患者一覧"
        expect(page).to have_content 'patient-②'
        click_on 'patient-②',match: :first
        expect(page).to have_content 'patient-②様の履歴'
      end
    end
  end
end
