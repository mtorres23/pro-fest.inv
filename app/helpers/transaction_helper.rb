module TransactionHelper
    def statuses
        [
          ['pending'],
          ['canceled'],
          ['completed'],
          ['verified']
        ]
      end

      def inventory_locations(location, event)
        event.locations.select{|loc| !loc[:id] == location[:id] && !loc[:hidden]}
      end

  end
