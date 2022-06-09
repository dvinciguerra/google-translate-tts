module GoogleTranslateTts
  module Constanting
    BASE_URL = ENV.fetch("TTS_BASE_URL", "http://translate.google.com")
    REFERER = BASE_URL
    USER_AGENT = ENV.fetch("TTS_UA", "Mozilla/5.0 (X11; CrOS x86_64 14767.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.9999.0 Safari/537.36")

    TTS_TMP_DIR = ENV.fetch('TTS_TMP_DIR', File.expand_path('~/.tmp/tts_tmp', __FILE__))
  end
end
