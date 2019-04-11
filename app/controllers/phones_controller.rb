class PhonesController < ApplicationController
  def new
    @phone = AssignPhoneService.call(phone_params)
    # respond_to do |format|
    #   format.json { render json: @phone.to_json }
    # end
    render json: @phone
  end

  private

  def phone_params
    params.permit(:user_email, :phone)
  end
end
