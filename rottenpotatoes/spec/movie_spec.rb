require 'rails_helper'

describe Movie do
  describe '.find_similar_movies' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'UP', director: 'Disney') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'Hanna', director: 'Michael Miner') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "Pocohantas", director: 'Disney') }
    let!(:movie4) { FactoryGirl.create(:movie, title: "Stop") }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.similar_movies(movie1.title)).to eql(['UP', "Pocohantus"])
        expect(Movie.similar_movies(movie1.title)).to_not include(['Hanna'])
        expect(Movie.similar_movies(movie2.title)).to eql(['Hanna'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.similar_movies(movie4.title)).to eql(nil)
      end
    end
  end

  describe '.all_ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
    end
  end
end