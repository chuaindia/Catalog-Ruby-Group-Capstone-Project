require 'date'
class Item
  attr_accessor :publish_date, :archived
  attr_reader :label

  def initialize(publish_date, id = Random.rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def add_label(label)
    @label = label
    label.add_item(label)
  end

  def add_source(source)
    @source = source
  end

  private

  def can_be_archived?
    today_date = DateTime.now.strftime('%d/%m/')
    year = DateTime.now.strftime('%y')
    ref_date = today_date + (year.to_i - 10).to_s
    Date.strptime(publish_date, '%d/%m/%y') < Date.strptime(ref_date, '%d/%m/%y')
  end
end
