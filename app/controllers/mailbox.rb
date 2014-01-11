Ivybox::App.controllers :mailbox do

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :index do
    @ivy_mail = IvyMail.new
    render 'mailbox/index'
  end

  post :index do
    @ivy_mail = IvyMail.new(params[:ivy_mail])
    if @ivy_mail.valid?
      render text: 'o hai'
    else
      render 'mailbox/index'
    end
  end

end
