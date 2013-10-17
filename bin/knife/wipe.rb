require 'chef/knife'

class Chef
  class Knife
    class Wipe < Knife

      deps do
        require 'chef/api_client'
        require 'chef/json_compat'
      end

      banner "knife wipe CLIENT (options)"

      def run
        @client_name = @name_args[0]
        config[:yes] = true

        if @client_name.nil?
          show_usage
          ui.fatal("You must specify a client name")
          exit 1
        end

        begin
          delete_object(Chef::Node, @client_name)
        rescue => e
          p e
        end

        delete_object(Chef::ApiClient, @client_name)
      end

    end
  end
end
