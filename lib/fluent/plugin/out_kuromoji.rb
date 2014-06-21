# coding: UTF-8
module Fluent
  class KuromojiOutput < Output
    Fluent::Plugin.register_output('kuromoji', self)

    config_param :target_key, :string
    config_param :add_tag_prefix, :string
    config_param :dictionary_path, :string

    def initialize
      super
      require 'kuromoji'
    end

    def configure(conf)
      super
      @core = Kuromoji::Core.new(@dictionary_path)
    end

    def emit(tag, es, chain)
      es.each do |time, record|
        tokens = @core.tokenize_with_hash(record[@target_key])
        tokens.each do |token|
          Fluent::Engine.emit(@add_tag_prefix + '.' + tag, time, token)
        end
      end
      chain.next
    end
  end
end
