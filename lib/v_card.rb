# frozen_string_literal: true

class VCard
  attr_reader :attributes
  def initialize(attributes)
    @attributes = attributes
  end

  def first_name
    attributes['first_name'] || name.to_s.split(' ').first
  end

  def last_name
    if attributes['last_name']
      return attributes['last_name']
    end

    parts = name.to_s.split(' ')
    parts.shift
    parts.join(' ')
  end

  def name
    attributes['name'] || email
  end

  def email
    attributes['email']
  end

  def phone
    attributes['phone']
  end

  def id
    attributes['id']
  end

  def revision
    Time.now
  end

  def note
    attributes['note']
  end

  def uid
    id
  end

  def formatted_phone
    if phone.to_s == ''
      return
    end

    parts = phone.to_s.split('-')

    "+#{parts[0]} #{parts[1]}"
  end
end
