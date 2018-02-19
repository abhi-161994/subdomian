class SubdomainConstraint
  def self.matches?(request)
    subdomain = %w{www admin }
    request.subdomain.present? && !subdomain.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  constraints SubdomainConstraint do
   resources :projects
end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
