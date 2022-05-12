module GoogleTranslateTts
  module Constanting
    BASE_URL = ENV.fetch("TTS_BASE_URL", "http://translate.google.com")
    REFERER = BASE_URL
    UA = ENV.fetch("TTS_UA", "Mozilla/5.0 (X11; CrOS x86_64 14767.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.9999.0 Safari/537.36")

    def self.including(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def base_url
        BASE_URL
      end
    end
  end
end
