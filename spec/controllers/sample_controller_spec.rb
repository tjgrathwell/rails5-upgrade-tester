require 'rails_helper'

# Rails4 Syntax
# https://github.com/rails/rails/blob/751f752b43873311f2fa929934a53fd4b81317f9/actionpack/lib/action_controller/test_case.rb#L508

# Rails5 Syntax
# https://github.com/rails/rails/blob/ebcd9650153ae693939550a6e08898345b986023/actionpack/lib/action_controller/test_case.rb#L389

describe SampleController do
  render_views

  context 'testing using hash literals' do
    it 'can return an HTML message' do
      get :message, message_text: 'robocop'
      expect(response.body).to include('robocop')
    end

    it 'can return an HTML message when tested with the `process` keyboard' do
      process :message, 'GET', message_text: 'robocop'
      expect(response.body).to include('robocop')
    end

    it 'can show a flash message in the HTML' do
      get :message, {message_text: 'robocop'}, nil, {error: 'dangerdanger'}
      expect(response.body).to include('dangerdanger')
    end

    it 'can show some session data in the HTML' do
      get :message, {message_text: 'robocop'}, {session_msg: 'sessionsession'}
      expect(response.body).to include('sessionsession')
    end

    it 'can return a JSON message' do
      get :message, message_text: 'robocop', format: :json
      expect(JSON.parse(response.body)['msg']).to include('robocop')
    end
  end

  context 'testing using methods' do
    describe 'for HTML formats' do
      let(:params) { {message_text: 'robocop'} }

      it 'returns a HTML message' do
        get :message, params
        expect(response.body).to include('robocop')
      end
    end

    describe 'for JSON formats' do
      let(:params) { {message_text: 'robocop', format: :json} }

      it 'returns a JSON message' do
        get :message, params
        expect(JSON.parse(response.body)['msg']).to include('robocop')
      end
    end
  end
end