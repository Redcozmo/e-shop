# frozen_string_literal: true

# == Schema Information
#
# Table name: ahoy_events
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  properties :jsonb
#  time       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  visit_id   :bigint(8)
#
# Indexes
#
#  index_ahoy_events_on_name_and_time  (name,time)
#  index_ahoy_events_on_properties     (properties) USING gin
#  index_ahoy_events_on_user_id        (user_id)
#  index_ahoy_events_on_visit_id       (visit_id)
#

class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :visit
  belongs_to :user, optional: true
end
