RSpec.describe 'POST /api/articles' do
  subject { response }
  
  
  describe 'when the user is authenticated' do
    let(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    before do
      post '/api/articles', params: 
      { article: {
        title: 'My wonderful title', 
        lede: 'Lorem ipsum...', 
        author: 'Max'
        }, headers: credentials
      }
    end
    it { is_expected.to have_http_status 201 }
    it 'is expected to create a new article in the database' do
      article = Article.last
      expect(article).to_not eq nil
    end
  end

  describe 'when the user is not authenticated' do
    before do
      post '/api/articles', params: 
      { article: {
        title: 'My wonderful title', 
        lede: 'Lorem ipsum...', 
        author: 'Max'
        }
      }
    end
    it { is_expected.to have_http_status 401 }
    it 'is expected to reject the request' do
      expect(response_json['message']).to eq 'You have to login or sign-up first'
    end
  end
end