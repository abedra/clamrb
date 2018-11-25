class Clamrb
  class Result
    attr_accessor :status, :identifier

    def initialize(status, identifier = nil)
      @status, @identifier = status, identifier
    end

    def safe?
      status != :infected
    end

    def virus?
      status == :infected
    end

    def error?
      status == :unknown
    end
  end
end
