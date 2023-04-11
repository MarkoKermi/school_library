class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented methodes '#{__method__}'"
  end
end
