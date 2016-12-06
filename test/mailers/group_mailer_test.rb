require 'test_helper'

class GroupMailerTest < ActionMailer::TestCase
  test "match_confirmation" do
    mail = GroupMailer.match_confirmation
    assert_equal "Match confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
