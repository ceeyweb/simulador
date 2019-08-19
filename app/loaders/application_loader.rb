class ApplicationLoader

  def self.load(*args, &block)
    new(*args).load(&block)
  end

  def load
    raise NotImplementedError
  end

end
