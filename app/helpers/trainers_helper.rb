module TrainersHelper
    def format_phone_number_input
        if !params[:trainer][:phone_number_1].empty? && !params[:trainer][:phone_number_2].empty? && !params[:trainer][:phone_number_3].empty?
            params[:trainer][:phone_number] = params[:trainer][:phone_number_1] + params[:trainer][:phone_number_2] + params[:trainer][:phone_number_3]
        end
    end
end
