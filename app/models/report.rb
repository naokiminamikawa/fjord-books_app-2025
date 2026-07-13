# frozen_string_literal: true

class Report < ApplicationRecord
  after_save :update_mentions
  belongs_to :user

  has_many :report_mentions,
           dependent: :destroy

  has_many :mentioned_reports,
           through: :report_mentions,
           source: :mentioned_report

  has_many :reverse_report_mentions,
           class_name: 'ReportMention',
           foreign_key: :mentioned_report_id,
           inverse_of: :mentioned_report,
           dependent: :destroy

  has_many :mentioning_reports,
           through: :reverse_report_mentions,
           source: :report

  has_many :comments,
           as: :commentable,
           dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end

  def update_mentions
    report_mentions.destroy_all
    mentioned_ids = content.scan(%r{/reports/(\d+)}).flatten.map(&:to_i).uniq

    mentioned_ids.each do |id|
      mentioned_report = Report.find_by(id: id)
      next unless mentioned_report

      report_mentions.create!(
        mentioned_report: mentioned_report
      )
    end
  end
end
