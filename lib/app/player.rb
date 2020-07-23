require_relative 'board'
require_relative 'game'
  class Player
    attr_accessor :name, :picto

      def initialize(name, picto, board)
          @name = name
          @picto = picto
          @board = board
      end


      def recuperer_position_case
          loop do
            position = demander_position_case
            position = position.map{ |x| x - 1 }
            #position = demander_position_case.map{ |x| x - 1 }
            if position_valide(position)
                if @board.ajouter_un_picto(position, @picto)
                    break
                end
            end
          end
      end

      def demander_position_case
          puts"#{@name}(#{@picto}), cocher la case - saisir les coordonnées (x, y) :
allant de 1 à 3 - exemple : 1,2 positionnera votre pictogramme sur la
première ligne 2ème case"

          gets.strip.split(",").map(&:to_i)
      end


      def position_valide(position)
          if position.is_a?(Array) && position.size == 2
             #position = position.map{ |x| x - 1 }
            true
          else
              puts "La saisie de la position n'est pas au format attendu !"
          end
      end
end
