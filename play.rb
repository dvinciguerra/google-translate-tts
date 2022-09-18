#!ruby
# frozen_string_literal: true

require_relative 'lib/google_translate_tts'

# download text as mp3 file (default named file,mp3)
GoogleTranslateTts.fetch('Alexa... turn the living room light off!', lang: 'en_US')
