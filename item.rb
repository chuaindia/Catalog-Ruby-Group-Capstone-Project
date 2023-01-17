class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(genre, author, source, label, date)
    @id = Random.rand(1...100)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = date
    @archived = false
  end

  private

  def can_be_archived?
    archive = Time.now.year - @publish_date.year
    archive > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
