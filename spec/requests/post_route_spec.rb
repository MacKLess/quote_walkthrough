require 'rails_helper'

describe "post a quote route", :type => :request do

  before do
    post '/quotes', params: { :author => 'test_author', :content => 'test_content'}
  end

  it 'returns the author name' do
    expect(JSON.parse(response.body)['author']).to eq('test_author')
  end

  it 'returns the quote content' do
    expect(JSON.parse(response.body)['content']).to eq('test_content')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
  #
  # before do
  #   post '/quotes', params: { :author => '', :content => 'test_content'}
  # end

  it 'returns the author name' do
    post '/quotes', params: { :author => '', :content => 'test_content'}
    expect(JSON.parse(response.body)['author']).to eq(nil)
  end

  it 'returns an error status when author is blank' do
    post '/quotes', params: { :author => '', :content => 'test_content'}
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'returns the quote content' do
    post '/quotes', params: { :author => 'test_author', :content => ''}
    expect(JSON.parse(response.body)['content']).to eq(nil)
  end

  it 'returns an error status when content is blank' do
    post '/quotes', params: { :author => 'test_author', :content => ''}
    expect(response).to have_http_status(:unprocessable_entity)
  end


end
