  require_relative 'player'
  require_relative 'board'

  class Morpion

      def initialize
          @board = Board.new
          @player_x = Player.new("Joueur 1", :x, @tableau)
          @player_y = Player.new("Joueur 2", :o, @tableau)
          @playing = @player_x
      end


      def jouer
          # boucle Loop
          loop do
            # Appelez la variable d'instance @tableau
            @board.retourne_etat_du_tableau
            # Demande les coordonnées du joueur actuel
            @playing.recuperer_position_case
            # Interrompt la boucle SI le jeu est terminé
            break if lost
            # Changer de joueur
            switch_player
          end
        end


      def lost
          victory || draw
      end


      def victory
          if @board.combinaison_gagnante?(@playing.picto)
              # Affiche un message de victoire
              @board.retourne_etat_du_tableau
              puts "Félicitation #{@playing.name}, vous avez gagné !"
            true
          else
            false
          end
        end


      # match_nul
      def draw
          # SI la class Tableau nous retourne que le tableau est complet
          if @board.full?
            # Afficher un message de tirage
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
