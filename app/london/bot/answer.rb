module London
  module Bot
    class Answer
      require 'erb'

      def initialize
        path = File.join(ROOT, 'app', 'view', '*.erb')
        @tpls = Dir[path].each_with_object({}) do |fn, obj|
          tpl = File.read(fn)
          key = fn.split('/').last.gsub('.erb', '')
          obj[key] = ERB.new tpl
        end
      end

      def render(name, params)
        b = binding
        tpl = @tpls[name.to_s]
        if tpl
          tpl.result b
        else
          ''
        end
      end

      def self.render(*args)
        @instance ||= self.new
        @instance.render *args
      end
    end
  end
end