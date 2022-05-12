# frozen_string_literal: true

require "cgi"
require "faraday"
require "tempfile"
require "securerandom"

require_relative "google_translate_tts/version"
require_relative "google_translate_tts/constanting"

module GoogleTranslateTts
  include Constanting

  TTS_TMP_DIR = '/var/tmp/tts_tmp'


  class << self
    def fetch(phrase, **options)
      lang, _ = options.values_at(:lang)

      file = Tempfile.new('hello', )
      pp Faraday.get(tts_resource_url(q: phrase, tl: lang))
    end

    private

    def tts_resource_url(**params)
      "#{self::BASE_URL}/translate_tts?#{build_params(**params)}"
    end

    def build_params(**kwargs)
      kwargs[:tl] ||= 'en'

      params = {
        ie: 'UTF-8',
        client: 'tw-ob',
        q: "",
      }.merge(**kwargs)

      # params.map { |(key, value)| pp [key, value] }
      params.map { |(key, value)| "#{key}=#{CGI.escape(value)}" }.join("&")
    end
  end

end
