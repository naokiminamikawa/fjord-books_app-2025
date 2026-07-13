# frozen_string_literal: true

class ReportMention < ApplicationRecord
  belongs_to :report
  belongs_to :mentioned_report, class_name: 'Report',
                                inverse_of: :reverse_report_mentions
end
