class RegistrationsController < Devise::SessionsController
  before_action :sign_up_params, if: :devise_controller?, on: [:create]

  def create
    build_resource(sign_up_params)

    # if resource.save
    #   render json: resource, serializer: Api::V1::UserSerializer, meta: { message: 'Sign up success', token: request.headers["Authorization"] }, status: :created
    # else
    #   render json: resource, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer, meta: { message: 'Sign up success' }, status: :created
    # end

    resource.save
    # render_resource(resource)

    # resource.save!
    render json: resource
  end

  protected

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash = {})
    self.resource = resource_class.new_with_session(hash, session)
  end

  def sign_up_params
    params.require(:sign_up).permit(:email, :password, :password_confirmation)
  end
end