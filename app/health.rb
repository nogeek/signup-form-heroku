class Health < Sinatra::Base
  before do
    content_type :json    
    headers 'Access-Control-Allow-Origin' => '*', 
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']  
  end 

  get "/" do
    status 200
  end 
end
