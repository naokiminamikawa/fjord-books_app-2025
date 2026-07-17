# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '作成者の場合はeditable?がtrueを返す' do
    report = reports(:alice_report)
    user = users(:one)

    assert report.editable?(user)
  end

  test '作成者以外の場合はeditable?がfalseを返す' do
    report = reports(:alice_report)
    user = users(:two)

    assert_not report.editable?(user)
  end

  test 'created_onが作成日を返す' do
    report = reports(:alice_report)
    assert_equal report.created_at.to_date, report.created_on
  end
end
