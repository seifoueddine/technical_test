module Users
    class RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
      if resource.errors.any?
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      else
        render json: resource, status: :ok
      end
    end
  end
end