require_relative 'item'

class MusicAlbum < Item
  def initialize(name, publish_date, on_spotify)
    super(id, name, publish_date)
    @name = name
    @on_spotify = on_spotify
  end
end
