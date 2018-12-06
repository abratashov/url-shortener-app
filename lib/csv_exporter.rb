class CsvExporter
  def self.to_csv(array, attributes=[])
    CSV.generate(headers: true) do |csv|
      csv << attributes

      array.each do |el|
        csv << attributes.map{ |attr| el.send(attr) }
      end
    end
  end
end
