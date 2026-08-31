# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'nameがある場合はnameを返す' do
    assert_equal 'Alice', users(:one).name_or_email
  end

  test 'nameが空の場合はemailを返す' do
    assert_equal 'bob@example.com', users(:two).name_or_email
  end
end
