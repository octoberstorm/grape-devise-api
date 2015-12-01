class API::V1::Posts < Grape::API
  version :v1
  format :json

  resource :posts do
    desc "Return recent posts"
    get do
      Post.recent.all
    end
  end
end
