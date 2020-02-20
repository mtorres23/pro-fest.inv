module TransactionHelper
    def statuses
        [
          ['pending'],
          ['in_progress'],
          ['canceled'],
          ['completed'],
          ['verified']
        ]
      end

      def create_transaction_message(t)
        message_type = "transaction_updated"
        puts "creating transaction message"
        message = t.order.messages.new(message_type: message_type, created_by: current_user.id, event_id: t.order.location.event.id, order_id: t.order.id, location_id: t.order.location_id, transaction_id: t.id)
        message.save
      end

      def inventory_locations(location, event)
        event.locations.select{|loc| !loc[:id] == location[:id] && !loc[:hidden]}
      end

      def find_reserved(transactions, item)
        return transactions.where(origin_id: item.id)
      end

  end
