Rails.application.routes.draw do
  get "/game" => "game#game"
  get "/new" => "new#reset"
end
