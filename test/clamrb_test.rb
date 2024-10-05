require 'test/unit'
require 'clamrb'

class ClamrbTest < Test::Unit::TestCase
  @@clamrb = Clamrb.new

  def test_clean_file
    result = @@clamrb.scan "test/files/foo.txt"
    assert_equal(:clean, result.status)
    assert_equal(nil, result.identifier)
    assert_true(result.safe?)
  end

  def test_unknown_file
    result = @@clamrb.scan "test/files/missing.txt"
    assert_equal(:unknown, result.status)
    assert_equal(nil, result.identifier)
    assert_true(result.error?)
  end

  def test_infected_file
    result = @@clamrb.scan "test/files/eicar.txt"
    assert_equal(:infected, result.status)
    assert_equal("Eicar-Signature", result.identifier)
    assert_true(result.virus?)
  end
end
