Rails.application.routes.draw do
  get "/integrations", to: "integrations#index"
end
