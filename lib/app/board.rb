require_relative 'player.rb'

  class Board

      def initialize
              @board = Array.new(3){Array.new(3)}
      end

      def retourne_etat_du_tableau
        puts
          @board.each do |ligne|
            ligne.each do |cellule|
                 cellule.nil? ? print("-") : print(cellule.to_s)
            end
            puts
        end
        puts
      end


      def ajouter_un_picto(position, picto)
        if case_souhaite_est_valide?(position)
          @board[position[0]][position[1]] = picto
          true
        else
            false
        end
      end


      def case_souhaite_est_valide?(position)
          if coordonnee_valide?(position)
            case_disponible?(position)
          end
      end


      def coordonnee_valide?(position)
          if (0..2).include?(position[0]) && (0..2).include?(position[1])
            true
          else
            puts "la case demandée est hors limite"
          end
      end
=begin

=end

      def case_disponible?(position)
          if @board[position[0]][position[1]].nil?
            true
          else
            puts "La case est déjà occupée"
          end
      end

      def diagonale
          [[ @board[0][0],@board[1][1],@board[2][2] ],
          [ @board[2][0],@board[1][1],@board[0][2] ]]
      end


      # verticale
      def verticale
          @board
      end


      def horizontale
          horizontale = []
          3.times do |i|
            horizontale << [@board[0][i],@board[1][i],@board[2][i]]
        end
        horizontale
      end


      def complet?
          @board.all? do |ligne|
            ligne.none?(&:nil?)
          end
      end


      def combinaison_gagnante?(picto)
          victoire_diagonale?(picto) ||
          victoire_horizontale?(picto) ||
          victoire_verticale?(picto)
      end


      def victoire_diagonale?(picto)
          diagonale.any? do |diag|
            diag.all?{|cellule| cellule == picto }
          end
      end


      def victoire_verticale?(picto)
          verticale.any? do |vert|
            vert.all?{|cellule| cellule == picto }
          end
      end


      def victoire_horizontale?(picto)
        horizontale.any? do |horiz|
          horiz.all?{|cellule| cellule == picto }
      end


  end
end
