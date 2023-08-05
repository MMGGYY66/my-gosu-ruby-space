require_relative 'gosu'
require_relative 'star'

class Player
    def initialize
        @image = Gosu::Image.new("media/starfighter.bmp")
        @x = @y = @vel_x = @vel_y = @angle = 0.0
        @score = 0
        @beep = Gosu::Sample.new("media/beep.wav")
    end
    # Return the player's x coordinate
    def x
        @x
    end

    # Draw the player's ship on screen, rotated to match its angle of travel
    def draw
        @image.draw_rot(@x, @y, 1, @angle)
    end

    # Move the player's ship forward and backward
    def accelerate
        @vel_x += Gosu::offset_x(@angle, 0.5)
        @vel_y += Gosu::offset_y(@angle, 0.5)
    end

    # Rotate the player's ship left and right
    def turn_left
        @angle -= 4.5
    end
    def turn_right
        @angle += 4.5
    end

    # Move the player's ship
    def move
        @x += @vel_x
        @y += @vel_y
        @x %= 888
        @y %= 520
        @vel_x *= 0.95
        @vel_y *= 0.95
    end

    # Increase the player's score
    def collect_stars(stars)
        stars.reject! do |star|
            if Gosu::distance(@x, @y, star.x, star.y) < 35
                @score += 10
                @beep.play
                true
            else
                false
            end
        end
    end
    
    # Return the player's score
    def score
        @score
    end
end
