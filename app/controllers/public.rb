Ivybox::App.controllers :public do

  get :index, map: '/' do
    render 'public/index'
  end

end
