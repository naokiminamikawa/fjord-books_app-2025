# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  include Commentable
end
