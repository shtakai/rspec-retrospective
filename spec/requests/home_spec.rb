require 'rails_helper'

describe 'Home page', type: :request do
  it 'responds successfully' do
    get root_path
    expect(response).to be_success
    expect(response).to have_http_status :success
  end
end
