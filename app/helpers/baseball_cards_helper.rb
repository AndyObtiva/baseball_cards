module BaseballCardsHelper
  def team_options_for_select(selected=nil)
    teams = BaseballCard::TEAMS.reduce({}) do |hash, town_team_hash|
      hash.merge(town_team_hash.values.join(' ') => town_team_hash[:team])
    end
    options_for_select(teams, selected)
  end
end
