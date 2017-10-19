module London
  module Bot
    module Checker

      def self.flats
        result = DB_CONN.execute 'SELECT B.id from flats AS a, flats as B WHERE a.number = b.number and a.completed != b.completed and a.id != b.id'
        ids = result.to_a.flatten
        first_flat = London::DB::Flat.where(number: 1).select(:id).last
        if first_flat
          London::DB::Flat.where(Sequel.lit('id < ?', first_flat.id)).delete
        end
        London::DB::Flat.where(id: ids).to_a
      end

      def self.check
        flats.each do |flat|
          London::DB::Notification.where(number: flat.number)
        end
      end

      def self.notify(user_id, flat)
        text = London::Bot::Answer.render 'notify.txt', flat.values
        London::Bot::Vk.client.send_notification user_id, text unless text.empty?
      end
    end
  end
end