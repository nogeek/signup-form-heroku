class Signup < Sinatra::Base
  before do
    content_type :json    
    headers 'Access-Control-Allow-Origin' => '*', 
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']  
  end 
  post '/' do 
    configure_pony
    name = params[:name]
    sender_email = params[:email]
    begin
      unless sender_email.blank?
        Pony.mail(
          :from => "ContactMailer [My Website] <contact@[My Website]>",
          :to => '[myprivateemail]@[My Website]',
          :subject =>"New Signup",
          :body => "New Contact: #{name}, #{sender_email}",
        )
        status 201
      else
        status 500
      end
    rescue
      @exception = $!
    end
  end

  def configure_pony
    Pony.options = {
      :via => :smtp,
      :via_options => { 
       :address              => 'smtp.sendgrid.net', 
       :port                 => '587',
       :user_name            => ENV['SENDGRID_USERNAME'], 
       :password             => ENV['SENDGRID_PASSWORD'], 
       :authentication       => :plain, 
       :enable_starttls_auto => true,
       :domain               => 'heroku.com'
      }    
    }
  end
end
