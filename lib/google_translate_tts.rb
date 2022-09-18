# frozen_string_literal: true

require "faraday"

require_relative "google_translate_tts/constanting"
require_relative "google_translate_tts/fileable"
require_relative "google_translate_tts/utils"
require_relative "google_translate_tts/version"

module GoogleTranslateTts
  include Constanting
  include Fileable
  include Utils

  class << self
    def fetch(phrase, **options)
      with_temp_file do |file|
        lang, filename = options.values_at(:lang, :file)
        filename ||= options.fetch(:file, "file")

        response = Faraday.get(translate_tts_url(q: phrase, tl: lang))

        file.write(response.body)

        copy_file(file.path, "#{filename}.mp3")
      end
    end

    private

    def translate_tts_url(**params)
      "#{self::BASE_URL}/translate_tts?#{build_params(**params)}"
    end

    def default_params
      { ie: "UTF-8", client: "tw-ob", q: "", tl: "en_US" }
    end

    def build_params(**custom_params)
      custom_params[:tl] ||= "en"
      params_encode(default_params.merge(**custom_params))
    end

    def params_encode(params)
      params
        .map { |(key, value)| "#{key}=#{url_encode(value)}" }
        .join("&")
    end
  end
end
