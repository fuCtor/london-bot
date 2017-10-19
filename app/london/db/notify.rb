module London
  module DB
    class Notification < Sequel::Model
      plugin :timestamps, force: true, update_on_create: true

      def notified!
        self.complete = true
        save!
      end

      def self.subscribe(user_id, flat)
        unless where(user_id: user_id).where(number: flat.number).first
          self.new(user_id: user_id, number: flat.number).save
        end
      end
    end
  end
end