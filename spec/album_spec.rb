require_relative '../music_album'
require_relative '../genre'

describe 'Testing Album' do
    it 'Testing' do
        on_spotify = true
        on_publish_date = '12/02/2019'

        album = MusicAlbum.new(on_spotify, on_publish_date)

        expect(album.on_spotify).to eq(on_spotify)
        expect(album.publish_date).to eq(on_publish_date)
        expect(album.can_be_archived?).to eq(true)
    end

    it 'Testing' do
        on_spotify = false
        publish_date = '12/05/2019'

        album = MusicAlbum.new(on_spotify, publish_date)

        expect(album.can_be_archived?).to eq(false)
    end

    it 'Testing add genre' do
        on_spotify = false
        publish_date = '12/05/2019'

        album = MusicAlbum.new(on_spotify, publish_date)

        name = 'rap'
        genre = Genre.new(name)
        
        expect(genre.name).to eq(name)
    end
end