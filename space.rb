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
    end

    def draw
        @player.draw
        @background_image.draw(0, 0, 0)
    end

end

window = Space.new
window.show
