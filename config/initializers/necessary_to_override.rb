module NecessaryToOverride
  # 必ず Override すべきメソッドを列挙する。
  def necessary_to_override(*methods)
    methods.each do |method|
      define_method(method) do
        raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
      end
    end
  end
end

Module.include(NecessaryToOverride)
