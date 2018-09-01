module LoansHelper
end
class Object
  def negative_zero_or_empty?
    self == nil || self.to_s.strip == "" || self.to_i < 1
  end
end
