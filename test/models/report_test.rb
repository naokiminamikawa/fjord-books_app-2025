# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'returns true when the user is the author' do
    report = reports(:alice_report)
    user = users(:one)

    assert report.editable?(user)
  end

  test 'returns false when the user is not the author' do
    report = reports(:alice_report)
    user = users(:two)

    assert_not report.editable?(user)
  end

  test 'returns the created date' do
    report = reports(:alice_report)

    assert_equal report.created_at.to_date, report.created_on
  end

  test 'save_mentions creates a ReportMention record' do
    report = reports(:alice_report)

    mentioned_report = Report.create!(
      title: 'Rubyの勉強',
      content: 'Rubyを学んだよ',
      user: users(:two)
    )

    report.mentioning_reports << mentioned_report

    assert ReportMention.exists?(
      mentioning_id: report.id,
      mentioned_id: mentioned_report.id
    )
  end
end
