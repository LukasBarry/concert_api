class Api::V1::PostsController < ApiController
  respond_to :json

  def show
    respond_with Post.find(params[:id])
  end
end
