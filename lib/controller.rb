
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do #affichage de la page d'accueil du site
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do #affichage de la page pour déposer un nouveau potin
    erb :new_gossip
  end
  post '/gossips/new/' do #formulaire pour déposer un nouveau potin
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do #consulter un potin déposé
    @gossip_number = params[:id]
    "Voici le numéro du potin que tu veux : #{@gossip_number}!" #indication du numéro(l"ID) de potin recherché
    @gossip = Gossip.find(params[:id])#affichage du potin correspondant au numéro(l'ID) demandé
    erb :show
  end
end