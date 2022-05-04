require_relative 'item'

class MusicAlbum < Item
  def initialize(name, publish_date, on_spotify)
    super(name, publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super and @on_spotify
  end
end
