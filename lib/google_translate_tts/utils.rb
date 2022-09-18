# frozen_string_literal: true

require 'cgi'
require 'fileutils'

module GoogleTranslateTts
  module Utils
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      protected

      def copy_file(source, destination)
        FileUtils.cp(source, destination)
      end

      def url_encode(value)
        CGI.escape(value)
      end
    end
  end
end
