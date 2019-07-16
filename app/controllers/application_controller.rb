class ApplicationController < ActionController::Base
    before_action :set_user_type


    def set_user_type
        @user_type = params[:user_type]

    end

    def after_sign_in_path_for(profile)
            if(current_user.profile)
                new_vinyl_path
            else
                new_profile_path || root_path
            end
        end
    end
