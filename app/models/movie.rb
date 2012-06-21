class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.find_similar_by_director(id)
    directors = Movie.find(id).director
    if directors == nil || directors =='' then
      return nil
    else
      Movie.find_all_by_director(directors)
    end
  end
end
