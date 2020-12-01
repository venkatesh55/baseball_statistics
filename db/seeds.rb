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
  doc.css('SEASON').each do |season_node|
    year = season_node.css('YEAR').text
    season = Season.create(year: year)
    season_node.css('LEAGUE').each do |league_node|
      league_name = league_node.css('LEAGUE_NAME').text
      league = League.create(name: league_name, season: season)
      league_node.css('DIVISION').each do |division_node|
        division_name = league_node.css('DIVISION_NAME').text
        division = Division.create(name: division_name, league: league)
        division_node.css('TEAM').each do |team_node|
          team_city = team_node.css('TEAM_CITY').text
          team_name = team_node.css('TEAM_NAME').text
          team = Team.create(city: team_city, name: team_name, division: division)
          team_node.css('PLAYER').each do |player_node|
            player = Player.new
            player_node.children.each do |player_attr|
              attr_name = player_attr.name.downcase
              attr_name = attr_name + "_count" if attr_name == 'errors'
              value = player_attr.children.text
              player.send("#{attr_name}=", value)
            end
            player.save
            LeagueParticipation.create(league: league, player: player, team: team, season: season)
          end
        end
      end
    end
  end
end

seed_data