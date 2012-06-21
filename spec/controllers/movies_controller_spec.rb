require 'spec_helper'

describe MoviesController do
  describe '#same_director' do
    before(:each) do
      m = mock('Movie', :title=>'test_movie')
      Movie.stub(:find).with('1').and_return(m) 
    end
    it 'should call model method to find similar movies' do
      Movie.should_receive(:find_similar_by_director).with('1')
      post :same_director, {:id => '1'}
    end
    it 'should handle the results if match' do
       fake_results = [mock('Movie'), mock('Movie')]
       Movie.stub(:find_similar_by_director).with('1').and_return(fake_results)
       post :same_director, {:id => '1'}
       assigns(:movies).should == fake_results
    end
    it 'should render the template of the results if match' do
       fake_results = mock('Movie1')
       Movie.stub(:find_similar_by_director).with('1').and_return(fake_results)
       post :same_director, {:id => '1'}
       response.should render_template('same_director')
    end
    it 'should redirect to homepage if no match' do
       Movie.stub(:find_similar_by_director).with('1').and_return(nil)
       post :same_director, {:id => '1'}
       response.should redirect_to(movies_path)
    end
  end
end
