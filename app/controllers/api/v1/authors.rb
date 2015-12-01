class API::V1::Authors < Grape::API
  version :v1
  format :json

  resource :authors do
    desc "Return list of authors"
    get do
      Author.all
    end
  end
end
