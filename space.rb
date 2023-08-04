require 'gosu'

class Space < Gosu::Window
    def initialize
        super 888, 520
        self.caption = "Space"
        @background_image = Gosu::Image.new("media/space.jpg", :tileable => true)
    end

    def update
    end

    def draw
        @background_image.draw(0, 0, 0)
    end

end

window = Space.new
window.show
