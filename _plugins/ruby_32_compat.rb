# Compatibility shim for older Jekyll/Liquid gems when Netlify runs Ruby 3.2+.
if RUBY_VERSION >= "3.2"
  class Object
    def tainted?
      false
    end unless method_defined?(:tainted?)

    def taint
      self
    end unless method_defined?(:taint)

    def untaint
      self
    end unless method_defined?(:untaint)
  end

  class File
    class << self
      alias exists? exist? unless respond_to?(:exists?)
    end
  end

  class Dir
    class << self
      alias exists? exist? unless respond_to?(:exists?)
    end
  end
end
