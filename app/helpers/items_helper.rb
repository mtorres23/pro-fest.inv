module ItemsHelper
    def find_matching_orders(orders, location)
        matches = []
        orders.where(role: "transfer").each do |o|
            o.transactions.where(origin_id: location.id, status: "pending").each do |t|
                matches.push(t.order)
                puts matches.count
            end
        end
        return matches
    end
end
