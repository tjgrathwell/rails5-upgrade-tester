require "test_helper"

class SampleControllerTest < ActionController::TestCase
  def test_message
    get :message, message_text: 'robocop'
    assert_match(/robocop/, @response.body)
  end

  def test_flash_message
    get :message, {message_text: 'robocop'}, nil, {error: 'dangerdanger'}
    assert_match(/dangerdanger/, @response.body)
  end

  def test_session_message
    get :message, {message_text: 'robocop'}, {session_msg: 'sessionsession'}
    assert_match(/sessionsession/, @response.body)
  end

  def test_json_message
    get :message, message_text: 'robocop', format: :json
    assert_match(/robocop/, JSON.parse(@response.body)['msg'])
  end
end