require "csv"

class CsvExportService
  def initialize(objects)
    @objects = objects
  end

  def generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_headers
      
      @objects.each do |object|
        csv << csv_row(object)
      end
    end
  end

  private

  def csv_headers
    @objects.first.attributes.keys # Extracting the keys from the first object
  end

  def csv_row(object)
    object.attributes.values # Extracting the values from the object
  end
end
