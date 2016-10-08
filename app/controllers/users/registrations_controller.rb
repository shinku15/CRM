class Users::RegistrationsController < Devise::RegistrationsController
  protected

     def after_update_path_for(resource)
       staticpages_show_path
     end

end
