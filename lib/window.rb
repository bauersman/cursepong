class Window
  attr_accessor :xsize, :ysize, :top, :left, :border

  def initialize(xsize, ysize, top=0, left=0)
    @xsize = xsize
    @ysize = ysize
    @top = top
    @left = left
    @border = true
    @default_tile = ' '
  end

  def draw
    render.each_with_index do |line, current_y|
      window.setpos(current_y+1, 1)
      window.addstr(line)
    end
    window.refresh
  end

  def close
    window.close
    @_window = nil
  end

  protected

  def render
    (0...ysize).map{ |ypos| render_line(ypos) }
  end

  def render_line(ypos)
    (0...xsize).map{ |xpos| render_tile(xpos, ypos) }.join
  end

  def render_tile(xpos, ypos)
    @default_tile
  end

  private

  def window
    @_window ||=
      begin
        bsize = @border ? 1 : 0
        win = Curses::Window.new(ysize+bsize+1, xsize+bsize+1, top+1, left+1)
        win.box(?|, ?-) if @border
        win
      end
  end
end
