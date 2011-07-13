#some settings in global
UC_PROVIDER_NAME = "uc"

##app account registered on user-central
UC_APP_ID = '132a33b5e41eb1f6539ba71de654efc4' 
UC_APP_SECRET = 'b2367955a861f521790beada5195041a'
## Update your custom Omniauth provider URL here
UC_PROVIDER_URL = if Rails.env.development?
    'http://localhost:3000'
  else
    TODO
  end

#==Heroku online demo, test pass
#TODO refactor related code here
#UC_APP_ID = '35954e56954d7f535dd3cadc5811124c' 
#UC_APP_SECRET = '926ef1d5d1a969d72699c87748cb0d75'
#UC_PROVIDER_URL='http://udo-central.heroku.com'
