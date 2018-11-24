class Clamrb
  class Result
    attr_accessor :status, :identifier

    def initialize(status, identifier = nil)
      @status, @identifier = status, identifier
    end
  end
end
