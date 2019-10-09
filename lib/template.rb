# frozen_string_literal: true

class Template
  def initialize(vcard)
    @vcard = vcard
  end

  def to_s
    <<~STRING
      BEGIN:VCARD
      VERSION:3.0
      #{body}
      END:VCARD
    STRING
  end

  def body
    parts = []
    parts.push("N:#{@vcard.first_name};#{@vcard.last_name};;;")
    parts.push("FN:#{@vcard.name}")
    unless @vcard.formatted_phone.to_s.empty?
      parts.push("TEL;type=CELL;type=VOICE;type=pref:#{@vcard.formatted_phone}")
    end
    parts.push("NOTE:#{@vcard.note}")
    parts.push("REV:#{@vcard.revision}")

    parts.push("EMAIL:#{@vcard.email}")

    if @vcard.uid
      parts.push("UID:#{@vcard.uid}")
    end
    parts.join("\n")
  end
end
