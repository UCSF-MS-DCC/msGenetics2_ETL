require 'csv'

csv_text = File.read('/Users/adamrenschen/Desktop/biorepository_all_07_24_2018.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
	@subject = Subject.new(row.to_hash)
	if !@subject.save
		puts @subject.errors
	end
end
