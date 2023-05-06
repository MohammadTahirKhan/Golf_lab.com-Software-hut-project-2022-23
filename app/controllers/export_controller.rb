# for db download as .csv file
require 'csv' 

# using tutorial provided by epigenesys
# create a csv export of database
class ExportController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin

    # check if user is admin
    def check_admin
        if current_user.user_role != "admin"
            redirect_to root_path
        end
    end

    def index
        tables = ["users", "holes", "datums", "user_holes"]
        combined_data = Hash.new
        tables.map do |table|
            table_data = []
            table = table.split("")
            table.pop
            table = table.join("")
            table.camelize.constantize.all.map do |d|
                table_data.push(d)
            end
            combined_data[table.camelize] = table_data
        end
        send_data export(combined_data), filename: "Team 31 download.csv"
    end

    def export(data)
        csv_file = CSV.generate(headers: true) do |csv|
            data.each do |key, value|
                csv << [key]
                attributes = key.camelize.constantize.column_names
                csv << attributes.map(&:humanize)
                value.each do |val|
                    csv << val.attributes.values_at(*attributes)
                end
                csv << ['']
            end
        end
        return csv_file
    end
end