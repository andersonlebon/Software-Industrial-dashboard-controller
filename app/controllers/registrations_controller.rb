class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    def create
        user = User.create(user_params)
        
        if user.save 
            resp = {
                 id: 7,
                email: user.email,
                name: user.name,
                role: user.role,
                username: user.username,
                created_at: user.created_at,
                updated_at: user.updated_at,
                token: user.generate_jwt
            }
            render json: resp
        else
            render json: user.errors.messages 
        end
        
    end

    def user_params
         params.require(:registration).permit(:username, :email, :password, :password_confirmation)
    end
end
