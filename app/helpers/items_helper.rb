module ItemsHelper
    def find_matching_orders(orders, location, direction)
        matches = []
        if direction == "pickup"
            orders.where(role: "transfer").each do |o|
                o.transactions.where(origin_id: location.id, status: "pending").each do |t|
                    if !matches.include?(t.order)
                    matches.push(t.order)
                    puts "pickup item"
                    end
                end
            end
        elsif direction == "dropoff"
            orders.where(role: "transfer").each do |o|
                o.transactions.where(dest_id: location.id, status: "in_progress").each do |t|
                    if !matches.include?(t.order)
                    matches.push(t.order)
                    puts "dropoff item"
                    end
                end
            end
        end
        return matches
    end
end
