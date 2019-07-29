class GildedRose
  def initialize(items)
    @items = items
  end

  def update_item(item)
    return if item.name == 'Sulfuras, Hand of Ragnaros'
    item.sell_in -= 1
    inc = case item.name
          when 'Aged Brie'
            1
          when 'Sulfuras, Hand of Ragnaros'
            0
          when 'Backstage passes to a TAFKAL80ETC concert'
            case
            when item.sell_in > 10
              1
            when item.sell_in.between?(6, 10)
              2
            when item.sell_in.between?(1, 5)
              3
            else
              -Float::INFINITY
            end
          when 'Conjured Mana Cake'
            -2
          else
            -1
          end
    value = item.quality + inc
    item.quality = case
                   when value.negative?
                     0
                   when value > 50
                     50
                   else
                     value
                   end
  end

  def update_quality()
    @items.each do |item|
      update_item(item)
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
