module London
  class Www < Sinatra::Application
    def initialize(*args)
      @vk = London::Bot::Vk.client
      super
    end

    post '/callback' do
      json = Oj.load(request.body)

      if respond_to? json['type']
        send(json['type'], json)
      else
        'ok'
      end
    end

    def confirmation(msg)
      ENV['VK_CONFIRMATION_CODE'] || 'ok'
    end

    def message_new(msg)
      text = ''

      case msg['object']['body'].downcase
        when /^квартир. \s*[#№]?(\d+)$/
          flat = London::DB::Flat.get_by_number($1)
          text = if flat
                   London::Bot::Answer.render 'info.txt', flat.values
                 else
                   'Не знаю такой квартиры =('
                 end
        when /^жду квартиру \s*[#№]?(\d+)$/
          flat = London::DB::Flat.get_by_number($1)
          text = if flat
                   London::DB::Notification.subscribe msg['object']['user_id'].to_i, flat
                   London::Bot::Answer.render 'subscribed.txt', flat.values
                 else
                   'Не знаю такой квартиры =('
                 end
      end

      @vk.send_notification msg['object']['user_id'], text unless text.empty?
      'ok'
    end
  end
end