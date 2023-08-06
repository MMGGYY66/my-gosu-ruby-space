require 'gosu'
require_relative 'player'
# require_relative 'star'

class Space < Gosu::Window
    def initialize
        super 888, 520
        self.caption = "Space"
        @background_image = Gosu::Image.new("media/space.png", :tileable => true)
        @player = Player.new
        @player.warp(888/2, 520/2)

    end

    def update
        if Gosu::button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
            @player.turn_left
        end
        if Gosu::button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
            @player.turn_right
        end
        if Gosu::button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
            @player.accelerate
        end
        @player.move
        # player.collect_stars(stars)
        # if rand(100) < 4 and stars.size < 25
        #     stars.push(Star.new)
        # end
    end

    def button_down?
        if id == Gosu::KB_ESCAPE
            close
        else
            super
        end
    end

    def draw
        @player.draw
        @background_image.draw(0, 0, 0)
    end

end

window = Space.new
window.show
