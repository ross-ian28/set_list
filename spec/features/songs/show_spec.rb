require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create(name: 'Goo Goo Dolls')
    song = artist.songs.create(title: "Iris", length: 200, play_count: 2)
    song2 = artist.songs.create(title: "All That You Are", length: 160, play_count: 300)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song2.title)
  end

  it 'displays the name of artist for the song' do
    artist = Artist.create(name: 'Goo Goo Dolls')
    song = artist.songs.create(title: "Iris", length: 200, play_count: 2)
    song2 = artist.songs.create(title: "All That You Are", length: 160, play_count: 300)
    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)
  end
end
