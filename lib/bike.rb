class Bike
  def broken?
    @broken ||= false
  end

  def break!
    @broken = true
  end

  def fix!
    @broken = false
  end

end