# encoding: UTF-8
require 'spec_helper'

class KuromojiOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  def create_driver(conf = CONFIG, tag = 'test')
    d = Fluent::Test::BufferedOutputTestDriver.new(Fluent::KuromojiOutput, tag).configure(conf)
    d
  end

  def test_configure_error
    assert_raise(Fluent::ConfigError) do
      d = create_driver %[
        target_key message
      ]
    end
  end

end
