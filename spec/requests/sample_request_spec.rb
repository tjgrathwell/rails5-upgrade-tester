require "rails_helper"

# Rails4 Syntax:
# https://github.com/rails/rails/blob/751f752b43873311f2fa929934a53fd4b81317f9/actionpack/lib/action_dispatch/testing/integration.rb#L31

# Rails5 Syntax:
# https://github.com/rails/rails/blob/de9542acd56f60d281465a59eac11e15ca8b3323/actionpack/lib/action_dispatch/testing/integration.rb

describe "sample controller actions" do
  describe 'hash literal params' do
    it 'shows a message' do
      get "/message", message_text: 'urlparam'
      expect(response.body).to include('urlparam')
    end

    it 'does special stuff with header options' do
      get "/message", nil, {'X-OVERRIDE-MESSAGE' => 'headerparam'}
      expect(response.body).to include('headerparam')
    end
  end
end