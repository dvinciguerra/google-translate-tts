# frozen_string_literal: true

require "cgi"
require "faraday"
require "fileutils"
require "securerandom"
require "tempfile"

require_relative "google_translate_tts/constanting"
require_relative "google_translate_tts/fileable"
require_relative "google_translate_tts/version"

module GoogleTranslateTts
  include Constanting
  include Fileable

  class << self
    def fetch(phrase, **options)
      with_temp_file do |file|
        lang = options.fetch(:lang, "en_US")
        filename = options.fetch(:file, "file")

        response = Faraday.get(tts_resource_url(q: phrase, tl: lang))

        file.write(response.body)

        FileUtils.cp(file.path, "#{filename}.mp3")
      end
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
