
module ODisk
  class File < Info

    attr_accessor :size

    def initialize(name)
      super(name)
      @size = 0
    end

    def eql?(o)
      super(o) && @size == o.size && @mtime == o.mtime
    end
    alias == eql?

  end # File
end # ODisk
