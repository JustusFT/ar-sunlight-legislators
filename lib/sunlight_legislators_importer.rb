require 'csv'
require_relative '../app/models/legislator.rb'
# require 'byebug'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|

      legislator = Legislator.new

      row.each do |field, value|
        # TODO: begin
        # raise NotImplementedError, "TODO: figure out what to do with this row and do it!"
        # byebug
        case field
        when "birthdate" then legislator[field] = Date.strptime(value, "%m/%d/%Y")
        when "phone" then legislator[field] = value.gsub(/[^0-9]/, "")
        else legislator[field] = value if legislator.attributes.has_key?(field)
        end
        # TODO: end
      end

      legislator.save

    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
