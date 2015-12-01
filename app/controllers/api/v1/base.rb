class API::V1::Base < Grape::API
  mount API::V1::Posts
  mount API::V1::Authors
end
