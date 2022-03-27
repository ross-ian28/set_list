require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :songs }
  end
  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @ggd = Artist.create!(name: "Goo Goo Dolls")
        @iris = @ggd.songs.create!(title: 'Iris', length: 345, play_count: 8989)
        @atya = @ggd.songs.create!(title: 'All that you are', length: 245, play_count: 583)
      end

      it 'returns the average song length' do
        expect(@ggd.average_song_length).to eq(295)
      end
    end
  end
end
