require 'rails_helper'

RSpec.describe 'Hospitals', type: :system do

  describe '一覧表示機能' do
    context '予約一覧画面に遷移した場合' do
      example 'created_atの昇順で表示される' do
        @list_top = first('.list_of_healthinterviews')
        expect(@list_top).to have_content health_interview_2.id
      end
    end
  end

  search










  describe 'guest_login' do
    before do
      visit root_path
      click_on '使い方'
    end

    context 'guest_patient' do
      example 'in' do
        click_on 'ゲストユーザー'
        expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      end
    end

    context 'guest_staff' do
      example 'in' do
        click_on 'ゲストスタッフ'
        expect(page).to have_content 'ゲストスタッフとしてログインしました。'
      end
    end

    context 'guest_admin_staff' do
      example '' do
        click_on 'ゲスト管理スタッフ'
        expect(page).to have_content 'ゲスト管理スタッフとしてログインしました。'
      end
    end
end
