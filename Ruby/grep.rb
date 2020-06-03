def grep(filename, phrase)
    regexp = Regexp.new(phrase)
    File.open(filename) do |file|
        file.each_with_index do |line, line_number|
            if regexp.match(line)
                puts "#{line_number}: #{line}"
            end
        end
    end
end

grep('grep.rb', 'grep')