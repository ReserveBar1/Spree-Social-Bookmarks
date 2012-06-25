module SpreeSocialBookmarks
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def add_javascripts
        append_file "app/assets/javascripts/store/all.js", "//= require store/pinterest\n"
      end
      
    end
  end
end
