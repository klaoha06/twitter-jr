require_relative 'spec_helper'

describe 'The Shotener App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "connecting" do
    get '/'
    expect(last_response).to be_ok
  end

  it "should be able to create new url" do
    fake_params = {"url"=>{"url"=>"http://zulaufpaucek.org/korn.streich"}}
    post '/urls/new', fake_params
    expect(Url.exists?(:url => "http://zulaufpaucek.org/korn.streich")).to eq(true)
    Url.last.delete
  end

  it "should not be able to access other people's page after login" do
    fake_session = { 'rack.session' => { user_id: 1 } }
    get "/users/#{User.first.username}", fake_session
    expect(last_response).to be_ok
  end

  it "should fail when creating object which exists" do
    url = Url.create(url: 'bye')
    expect(url.save).to eq(false)
    url.destroy
  end

  it "should generate a new key for new URL" do
    fake_params = {"url"=>{"url"=>"http://zulaufpaucek.org/korn.streich"}}
    post '/urls/new', fake_params
    expect(Url.find_by("url"=>"http://zulaufpaucek.org/korn.streich").key != nil ).to eq(true)
    Url.last.delete
  end



end
