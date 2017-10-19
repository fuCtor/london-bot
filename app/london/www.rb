module London
  class Www < Sinatra::Application
    def initialize(*args)
      @vk = London::Bot::Vk.new(ENV['VK_CODE'])
      @answer = London::Bot::Answer.new
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
      'e2c928d2'
    end

    def message_new(msg)
      text = ''

      case msg['object']['body'].downcase
        when /^квартир. \s*[#№](\d+)$/
          flat = London::DB::Flat.get_by_number($1)
          text = if flat
                   @answer.render 'info.txt', flat.values
                 else
                   'Не знаю такой квартиры =('
                 end
        when /^жду квартиру \s*[#№](\d+)$/
          flat = London::DB::Flat.get_by_number($1)
          text = if flat
                   @answer.render 'subscribed.txt', flat.values
                 else
                   'Не знаю такой квартиры =('
                 end
      end

      @vk.send_notification msg['object']['user_id'], text unless text.empty?
      'ok'
    end
  end
end