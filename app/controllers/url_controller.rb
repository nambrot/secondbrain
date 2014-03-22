class UrlController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:log]
  def log
    Url.create url: params[:url], body: params[:html]
    render :json => {}
  end

  def search

  end
end
