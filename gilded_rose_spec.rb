require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it 'update quality' do
      items = [
          Item.new(name='+5 Dexterity Vest', sell_in=10, quality=20),
          Item.new(name='Aged Brie', sell_in=2, quality=0),
          Item.new(name='Elixir of the Mongoose', sell_in=5, quality=7),
          Item.new(name='Sulfuras, Hand of Ragnaros', sell_in=0, quality=80),
          Item.new(name='Sulfuras, Hand of Ragnaros', sell_in=-1, quality=80),
          Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=15, quality=20),
          Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=10, quality=49),
          Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=5, quality=49),
          Item.new(name='Conjured Mana Cake', sell_in=3, quality=6),
      ]

      items_day_1 = [
          Item.new(name='+5 Dexterity Vest', sell_in=9, quality=19),
          Item.new(name='Aged Brie', sell_in=1, quality=1),
          Item.new(name='Elixir of the Mongoose', sell_in=4, quality=6),
          Item.new(name='Sulfuras, Hand of Ragnaros', sell_in=0, quality=80),
          Item.new(name='Sulfuras, Hand of Ragnaros', sell_in=-1, quality=80),
          Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=14, quality=21),
          Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=9, quality=50),
          Item.new(name='Backstage passes to a TAFKAL80ETC concert', sell_in=4, quality=50),
          Item.new(name='Conjured Mana Cake', sell_in=2, quality=4),
      ]
      GildedRose.new(items).update_quality
      expect(items.map(&:to_s)).to eq items_day_1.map(&:to_s)
    end
  end
end
