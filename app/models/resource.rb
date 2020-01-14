# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  x_location :integer          default(0), not null
#  y_location :integer          default(0), not null
#  active     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resource < ApplicationRecord
end
