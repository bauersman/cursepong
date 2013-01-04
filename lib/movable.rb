module Movable
  attr_accessor :x, :y, :speedx, :speedy
  def init_movable(x=1, y=1)
    @x=x
    @y=y
    @miny = 0
    @maxy = 25
    stop
  end

  def is_at?(x,y)
    @x.to_i == x && @y.to_i == y
  end

  def step
    @speedy = 0 if speedy > 0 && @y >= @maxy+1 || speedy < 0 && @y <= @miny-1
    @x += speedx*0.01
    @y += speedy*0.01
  end

  def stop
    @speedx = @speedy = 0
  end

  def up
    return if @y < @miny
    @y -= 1
  end

  def down
    return if @y > @maxy
    @y += 1
  end
end


