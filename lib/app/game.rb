  require_relative 'player'
  require_relative 'board'

  class Morpion

      def initialize
          @board = Board.new
          @player_x = Player.new("Joueur 1", :x, @board)
          @player_y = Player.new("Joueur 2", :o, @board)
          @playing = @player_x
      end


      def jouer
          loop do
            @board.retourne_etat_du_tableau
            @playing.recuperer_position_case
            break if lost
            switch_player
          end
        end


      def lost
          victory || draw
      end


      def victory
          if @board.combinaison_gagnante?(@playing.picto)
              @board.retourne_etat_du_tableau
              puts "Félicitation #{@playing.name}, vous avez gagné !"
            true
          else
            false
          end
        end


      # match_nul
      def draw
          if @board.full?
            puts "Pas de chance, match nul"
            true
          else
            false
          end
        end


      # changement de joueur
      def switch_player

          if @playing == @player_x
             @playing = @player_y
          else
             @playing = @player_x
          end
      end

  end
