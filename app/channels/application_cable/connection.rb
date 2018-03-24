module ApplicationCable
  class Connection < ActionCable::Connection::Base
      identified_by :current_user
      def connect
        self.current_user = find_verified_user
        logger.add_tags "ActionCable", "User #{current_user.id}"
      end
      protected

      def find_verified_user
        if current_user = env['warden'].user
          current_user
        else
          reject_unauthorized_connection
        end
      end

      identified_by :current_company

      def connect
        self.current_company = find_verified_company
        logger.add_tags "ActionCable", "Company #{current_company.id}"
      end

      protected

      def find_verified_company
        if current_company = env['warden'].company
          current_company
        else
          reject_unauthorized_connection
        end
      end
  
  end
end
