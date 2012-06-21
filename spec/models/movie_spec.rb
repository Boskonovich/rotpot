require 'spec_helper'

describe Movie do
  describe '#find_similar_by_director' do
    context 'if there is no director' do
      it 'should return nil' do
         movie = FactoryGirl.create(:movie, :id=>20, :director => nil)
         movie.find_similar_by_director(20).should == nil
      end
    end
    context 'if there is a director' do
      it 'should return all movies with same director' do
         movie1 = FactoryGirl.create(:movie, :id=>21, :director => 'John Doe')
         movie2 = FactoryGirl.create(:movie, :id=>22, :director => 'John Doe')
         movie3 = FactoryGirl.create(:movie, :id=>23, :director => 'Jane Doe')
         movie1.find_similar_by_director(21).should == [movie1, movie2]
      end
    end
  end
end
