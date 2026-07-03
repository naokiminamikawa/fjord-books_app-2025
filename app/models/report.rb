# frozen_string_literal: true

class Report < ApplicationRecord
  mount_uploader :picture, PictureUploader
  include Commentable
end
