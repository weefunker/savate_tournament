
class PairingTool
  attr_reader :fighters, :tournament_event, :fight
  def initialize(fighters:, tournament_event:, fight:)
    @fighters = fighters
    @tournament_event = tournament_event
  end

  def execute
    # active_fighters = remove_bye_fighters(fighters, fight)
    fighters = Fighter.all
    sorted_fighters = fighters.sort_by(&:fighter_score)
    sorted_fighters.each_with_index do |fighter|
      Fight.create!(tournament_event_id: @tournament_event.id, fighter_one_id: fighter[0], fighter_two_id: fighter[1])
      fighter += 1
    end

    fighters = Fighter.all
    sorted_fighters = fighters.sort_by(&:fighter_score).fighter_ids.to_i
    x = sorted_fighters.map(&:id)
    fighter_list << sorted_fighters

    x.each do |fighter| 
      count = 0
      binding.pry
      Fight.create!(tournament_event_id: TournamentEvent.last.id, fighter_one_id: fighter[0 + count], fighter_two_id: fighter[1 + count])

      count += 2 while count < x.length  
      end
  

    sorted_fighters.select.with_index do |val, index| 
        puts "Fighter id #{val.id} index #{index}" 
      end
 
end
