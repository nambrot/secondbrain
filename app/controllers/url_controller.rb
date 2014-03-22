class UrlController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token, :only => [:log]
  before_filter :authenticate_user!, only: [:dashboard]
  def log
    Url.create url: params[:url], body: params[:html]
    render :json => {}
  end

  def dashboard

  end

  def search
    urls = Url.terms(body: params[:q]).all
    respond_with urls, location: root_path
  end
end
