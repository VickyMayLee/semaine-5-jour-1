

class Gossip #initialisation de la class
  attr_accessor :author
  attr_accessor :content
  def initialize(author, content)
    @author = author
    @content = content
    
  end
  
  def save #enregistrement d'un potin
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << ["#{@author}", "#{@content}"]
    end
  end

  def self.all  #création d'une base de donnée à partir des potins enregistrés
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def find(params[:id]) #retrouver un potin précis, à partir d'un numéro (ID) de potin
    all_gossips.find do |gossip|
      gossip.index == params[:id]
    end
    puts gossip[params[:id]]
  end


end
