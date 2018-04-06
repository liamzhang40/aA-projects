require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @foreign_key = options[:foreign_key] ? options[:foreign_key] : "#{name}_id".to_sym
    @primary_key = options[:primary_key] ? options[:primary_key] : :id
    @class_name = options[:class_name] ? options[:class_name] : name.to_s.camelcase.singularize
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @foreign_key = options[:foreign_key] ? options[:foreign_key] : "#{self_class_name.to_s.downcase}_id".to_sym
    @primary_key = options[:primary_key] ? options[:primary_key] : :id
    @class_name = options[:class_name] ? options[:class_name] : name.to_s.camelcase.singularize
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    assoc_options[name] = options
    define_method(name) do
      model_class = options.model_class
      self_foreign_id = self.send(options.foreign_key)
      options_id = options.primary_key
      model_class.where(options_id => self_foreign_id).first
    end

  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self, options)
    define_method(name) do
      # debugger
      model_class = options.model_class
      options_foreign_id = options.foreign_key
      self_id = self.send(options.primary_key)
      model_class.where(options_foreign_id => self_id)
    end
  end

  def assoc_options
    @assoc_options ||= {}# Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
