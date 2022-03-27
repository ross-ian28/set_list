require 'rails_helper'

RSpec.describe 'Artists song index' do
  before :each do
    @ggd = Artist.create!(name: "Goo Goo Dolls")
    @iris = @ggd.songs.create!(title: 'Iris', length: 345, play_count: 8989)
    @atya = @ggd.songs.create!(title: 'All that you are', length: 245, play_count: 583)

    visit "/artists/#{@ggd.id}/songs"
  end

  it 'shows all of the titles of the songs for the artist' do
    expect(page).to have_content(@iris.title)
    expect(page).to have_content(@atya.title)
  end
  it 'links to each songs show page' do
    click_on @iris.title

    expect(current_path).to eq("/songs/#{@iris.id}")
  end
  it 'shows the average song length for the artist' do
    expect(page).to have_content("Average Song Length for Goo Goo Dolls: 295")
  end
end
