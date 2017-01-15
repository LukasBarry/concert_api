class Api::V1::PostsController < ApiController
  respond_to :json

  def show
    respond_with Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:comment, :hype_count, :location, :event_id, :user_id)
  end
end
