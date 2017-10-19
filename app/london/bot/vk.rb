module London
  module Bot
    class Vk
      def initialize(code)
        @client = VkontakteApi::Client.new(code)
      end

      def send_notification(user, text)
        @client.messages.send user_id: user, message: text
      end
    end
  end
end