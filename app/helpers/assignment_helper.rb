module AssignmentHelper
    def roles
      [
        ['Staff'],
        ['Crew'],
        ['Manager'],
        ['Admin']
      ]
    end

    def user_data(assignment)
      User.find(assignment.user_id)
    end

    def fullname(assignment)
      user_data(assignment).first_name + ' ' + user_data(assignment).last_name
    end

    def assigned_user_ids(event)
      event.assignments.map {|staff| staff[:user_id]}
    end

    def available_users(event, users)
      users.select {|user| !assigned_user_ids(event).include?(user[:id])}
  end
  end
