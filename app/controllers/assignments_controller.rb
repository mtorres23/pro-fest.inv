class AssignmentsController < ApplicationController
    before_action :set_account
    before_action :set_users
    before_action :set_event, except: [:user_assignments]
    before_action :set_location, only: [:location_assignments]

    def index
        @assignments = @event.assignments
    end
  # GET /
    def user_assignments
        @assignments = @user.assignments
    end

    # GET /
    def location_assignments
        @assignments = @location.event.assignments
    end

    # GET /
    def new
      @assignment = @event.assignments.new
    end

    def create
        @assignment = @event.assignments.new(assignment_params)

        respond_to do |format|
            if @assignment.save
            format.html { redirect_to event_assignments_path(event_id: @assignment.event_id, id: @assignment.id), notice: 'Staff Assignment was successfully created.' }
            format.json { render json: @assignment, status: :created } # Redirect Maybe?
            else
            format.html { render :new }
            format.json { render json: @assignment.errors, status: :unprocessable_entity }
            end
        end
    end

    def show
        @assignment = @event.assignments.find(params[:id])
    end

    def edit
        @assignment = @event.assignments.find(params[:id])
    end



   # PATCH/PUT /assignments/1
    # PATCH/PUT /assignments/1.json
    def update
        @assignment = @event.assignments.find(params[:id])

      respond_to do |format|
        if @assignment.update_attributes(assignment_params)
          format.html { redirect_to event_assignments_path(event_id: @assignment.event_id, id: @assignment.id), notice: 'Staff Assignment was successfully updated.' }
          format.json { render json: @assignment, status: :ok, location: event_assignment_url(@assignment) }
        else
          format.html { render :edit }
          format.json { render json: @assignment.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /assignments/1
    # DELETE /assignments/1.json
    def destroy
        @assignment = @event.assignments.find(params[:id])
        @assignment.destroy
        respond_to do |format|
            format.html { redirect_to event_assignments_path(event_id: @assignment.event_id, id: @assignment.id), notice: 'Staff Assignment was successfully deleted.' }
            format.json { head :no_content }
        end
    end


    private

    def set_account
        @account = Account.find(current_user.account_id)
    end

    def set_users
        @users = Users.where(account_id: @account.id)
    end

    def set_event
        @event = @account.events.find(params[:event_id])
    end

    def set_location
        @location = @event.locations.find(params[:location_id])
    end

    def assignment_params
      return params.require(:location).permit(:role, :user_id, :location_id)
      .merge(event_id: @event.id)
    end
  end
