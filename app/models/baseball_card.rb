class BaseballCard < ApplicationRecord
  TEAMS = [
    {town: 'Chicago', team: 'White Sox'},
    {town: 'Cleveland', team: 'Guardians'},
    {town: 'Detroit', team: 'Tigers'},
    {town: 'Kansas City', team: 'Royals'},
    {town: 'Minnesota', team: 'Twins'},
    {town: 'Baltimore', team: 'Orioles'},
    {town: 'Boston', team: 'Red Sox'},
    {town: 'New York', team: 'Yankees'},
    {town: 'Tampa Bay', team: 'Rays'},
    {town: 'Toronto', team: 'Blue Jays'},
    {town: 'Houston', team: 'Astros'},
    {town: 'Los Angeles', team: 'Angels'},
    {town: 'Oakland', team: 'Athletics'},
    {town: 'Seattle', team: 'Mariners'},
    {town: 'Texas', team: 'Rangers'},
    {town: 'Chicago', team: 'Cubs'},
    {town: 'Cincinnati', team: 'Reds'},
    {town: 'Milwaukee', team: 'Brewers'},
    {town: 'Pittsburgh', team: 'Pirates'},
    {town: 'St. Louis', team: 'Cardinals'},
    {town: 'Atlanta', team: 'Braves'},
    {town: 'Miami', team: 'Marlins'},
    {town: 'New York', team: 'Mets'},
    {town: 'Philadelphia', team: 'Phillies'},
    {town: 'Washington', team: 'Nationals'},
    {town: 'Arizona', team: 'Diamondbacks'},
    {town: 'Colorado', team: 'Rockies'},
    {town: 'Los Angeles', team: 'Dodgers'},
    {town: 'San Diego', team: 'Padres'},
    {town: 'San Francisco', team: 'Giants'},
  ]
  
  POSITIONS = [
    'Pitcher',
    'Catcher',
    '1st Base',
    '2nd Base',
    '3rd Base',
    'Shortstop',
    'Left Field',
    'Center Field',
    'Right Field',
  ]
  
  validates :name, presence: true
  validates :image_url, presence: true
end
