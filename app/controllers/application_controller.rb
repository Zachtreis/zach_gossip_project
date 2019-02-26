class ApplicationController < ActionController::Base
    # protect_from_forgery with: exception
    include SessionHelper

    def authenticate_user
        unless current_user
            flash[:danger] = "Connecte-toi ;)"
            redirect_to new_session_path
        end
    end
end
