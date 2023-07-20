class MeetingsController < ApplicationController

    def create 
        meeting = @current_user.meetings.create(meeting_params)
            if meeting.valid?
              render json: meeting, status: :created
            else
              render json: { errors: meeting.errors.full_messages }, status: :unprocessable_entity
            end 
    end

    def meeting_params
        # params.permit(:date, :duration, :location, :tutor_id, :topic, :user_id)
        params.require(:meeting).permit(:date, :duration, :location, :tutor_id, :topic, :user_id)
    end 
end