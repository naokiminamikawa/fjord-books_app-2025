# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'Password!'
    sleep 2
    click_button 'ログイン'
    sleep 2
    assert_text 'ログインしました'
  end
  test 'can create, edit, and delete daily reports after login' do
    visit reports_url

    assert_link '日報の新規作成'
    click_link '日報の新規作成'

    fill_in 'タイトル', with: '今日の日報'
    fill_in '内容', with: 'Railsの勉強をしました。'
    click_button '登録する'

    assert_text '日報が作成されました'

    click_link '日報の一覧に戻る'

    assert_selector 'a', text: 'この日報を表示'
    first(:link, 'この日報を表示').click

    assert_link 'この日報を編集'
    click_link 'この日報を編集'

    fill_in 'タイトル', with: 'タイトル（テスト）'
    fill_in '内容', with: '内容（テスト）'
    click_button '更新する'

    assert_text '日報が更新されました'

    click_link '日報の一覧に戻る'

    assert_selector 'a', text: 'この日報を表示'
    first(:link, 'この日報を表示').click

    click_button 'この日報を削除'

    assert_text '日報が削除されました'
  end
  # setup do
  #   @report = reports(:one)
  # end

  # test 'visiting the index' do
  #   visit reports_url
  #   assert_selector 'h1', text: 'Reports'
  # end

  # test 'should create report' do
  #   visit reports_url
  #   click_on 'New report'

  #   fill_in 'Content', with: @report.content
  #   fill_in 'Title', with: @report.title
  #   fill_in 'User', with: @report.user_id
  #   click_on 'Create Report'

  #   assert_text 'Report was successfully created'
  #   click_on 'Back'
  # end

  # test 'should update Report' do
  #   visit report_url(@report)
  #   click_on 'Edit this report', match: :first

  #   fill_in 'Content', with: @report.content
  #   fill_in 'Title', with: @report.title
  #   fill_in 'User', with: @report.user_id
  #   click_on 'Update Report'

  #   assert_text 'Report was successfully updated'
  #   click_on 'Back'
  # end

  # test 'should destroy Report' do
  #   visit report_url(@report)
  #   click_on 'Destroy this report', match: :first

  #   assert_text 'Report was successfully destroyed'
  # end
end
