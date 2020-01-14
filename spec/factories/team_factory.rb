# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  agent_1    :string           not null
#  agent_2    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :team do
    name { 'Todd & Justin' }
    agent_1 { 'Todd Kaufman' }
    agent_2 { 'Justin Searls' }
  end
end
