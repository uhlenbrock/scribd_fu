module ScribdFuController

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    
    def uses_scribd(options = {})
      proc = Proc.new do |c|
        c.instance_variable_set(:@uses_scribd, true)
      end
      before_filter(proc, options)
    end
    
  end
  
end