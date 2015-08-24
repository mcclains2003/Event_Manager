require_relative 'event_manager'

em = EventManager.new

em.run('./event_attendees.csv')