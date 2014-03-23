class UrlController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token, :only => [:log]
  before_filter :authenticate_user!, only: [:dashboard, :get_token]
  before_filter :authenticate_user_from_token!, only: [:log]

  def log
    Url.create url: params[:url], body: params[:html], user_id: current_user.id
    render :json => {}
  end

  def dashboard
    @urls = Url.terms(user_id: current_user.id).size(25)
  end

  def search
    urls = Url.terms(body: params[:q], user_id: current_user.id).size(25)
    respond_with urls, location: root_path
  end

  def get_token

  end
end
