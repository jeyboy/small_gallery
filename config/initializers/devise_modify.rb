module Devise
  module Controllers
    module Helpers
      def sign_in(resource_or_scope, *args)
        options  = args.extract_options!
        scope    = Devise::Mapping.find_scope!(resource_or_scope)
        resource = args.last || resource_or_scope

        resource.add_sign_in_act if (resource)
        expire_session_data_after_sign_in!
        if options[:bypass]
          warden.session_serializer.store(resource, scope)
        elsif warden.user(scope) == resource && !options.delete(:force)
          # Do nothing. User already signed in and we are not forcing it.
          true
        else
          warden.set_user(resource, options.merge!(:scope => scope))
        end
      end

      def sign_out(resource_or_scope=nil)
        if (user = current_user)
          user.add_sign_out_act
        end
        return sign_out_all_scopes unless resource_or_scope
        scope = Devise::Mapping.find_scope!(resource_or_scope)
        warden.user(scope) # Without loading user here, before_logout hook is not called
        warden.raw_session.inspect # Without this inspect here. The session does not clear.
        warden.logout(scope)
        instance_variable_set(:"@current_#{scope}", nil)
      end
    end
  end
end