module Nanoc::Helpers
  module Sorting

    def attribute_to_time(time)
      time = Time.local(time.year, time.month, time.day) if time.is_a?(Date)
      time = Time.parse(time) if time.is_a?(String)
      time
    end

    def sorted_items()
  @items.sort_by do |a|
        attribute_to_time(a[:created_at])
      end.reverse
    end
  end
end
