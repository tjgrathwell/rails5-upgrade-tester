require "test_helper"

class MessageTest < ActionDispatch::IntegrationTest
  def test_message
    get '/message', message_text: 'robocop'
    assert_match(/robocop/, @response.body)
  end

  def test_headers_message
    get '/message', nil, {'X-OVERRIDE-MESSAGE' => 'headerparam'}
    assert_match(/headerparam/, @response.body)
  end
end