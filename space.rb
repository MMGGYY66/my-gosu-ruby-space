require 'gosu'
require_relative 'player'
require_relative 'star'

module ZOrder
    Background, Stars, Player, UI = *0..3
end

class Space < Gosu::Window

    def initialize
        super 888, 520
        self.caption = "Space"
        @background_image = Gosu::Image.new("media/space.png", :tileable => true)
        @player = Player.new

        @player.warp(888/2, 520/2)
        @star_anim = Gosu::Image.load_tiles("media/star.png", 25, 25)
        @stars = Array.new

        (rand * 3).to_i + 6
        @font = Gosu::Font.new(20)
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
        @player.collect_stars(@stars)
        if rand(100) < 4 and @stars.size < 25
            @stars.push(Star.new(@star_anim))
        end
    end

    def button_down(id)
        if id == Gosu::KB_ESCAPE
            close
        else
            super
        end
    end

    def draw
        @player.draw
        @background_image.draw(0, 0, ZOrder::Background)
        @stars.each { |star| star.draw }

        @font.draw_text("Score: " + @player.score.to_s, 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
    end

end

window = Space.new
window.show
