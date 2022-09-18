# frozen_string_literal: true

require "tempfile"
require "securerandom"

module GoogleTranslateTts
  module Fileable
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def with_temp_file(name = "tts-#{SecureRandom.uuid}", &block)
        setup_temp_dir!

        Tempfile.create(name, self::TTS_TMP_DIR) do |file|
          block.call(file)
        end
      end

      def setup_temp_dir!
        FileUtils.mkdir_p(self::TTS_TMP_DIR) unless Dir.exist? self::TTS_TMP_DIR
      end
    end
  end
end
