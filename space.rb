require 'gosu'

class Space < Gosu::Window
    def initialize
        super 666, 555
        self.caption = "Space"
        #@background_image = Gosu::Image.new("media/space.png", :tileable => true)
    end

    def update
    end

    def draw
        #@background_image.draw(0, 0, 0)
    end
    
end

window = Space.new
window.show
