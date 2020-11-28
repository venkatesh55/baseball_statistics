# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_data
  filename = File.join(File.dirname(__FILE__),'/baseball_stats.xml')
  doc = File.open(filename) { |f| Nokogiri::XML(f) }
  doc.xpath("//PLAYER").each do |record|
    player = Player.new
    record.children.each do |player_attr|
      attr_name = player_attr.name.downcase
      attr_name = attr_name + "_count" if attr_name == 'errors'
      value = player_attr.children.text
      case Player.columns_hash[attr_name].type
      when :float || :integer
        value = 0 if value.blank?
      end
      begin
        player.send("#{attr_name}=", value)
      rescue e
        raise e
      end
    end
    player.save
  end
end

seed_data