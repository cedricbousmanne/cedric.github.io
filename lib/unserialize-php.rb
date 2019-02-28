require 'php_serialize'
require "yaml"
YAML_FRONT_MATTER_REGEXP = /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
PHP_SERIALIZER_REGEXP = /[a-z]{1}:[0-9]{1,}:(.*)/

def update_data(data)
  data.merge("A" => 2)
end

Dir.glob("_posts/*.md") do |post_file|
  puts "working on: #{post_file}..."

  if File.read(post_file) =~ YAML_FRONT_MATTER_REGEXP
    data, content = YAML.load($1), Regexp.last_match.post_match
    
    data.map{ |key,value|
      if value.to_s.match?(PHP_SERIALIZER_REGEXP) 
        if value.is_a? Array
          value = value.first
        end
        begin
          data[key] = PHP.unserialize(value.to_s)
        rescue Exception => e
          puts e
          @errors ||= 0
          @errors += 1
        end
      end
    }

    puts data

    File.open(post_file, 'w') { |file| 
      file.write(YAML.dump(data))
      file.write('---')
      file.write("\n")
      file.write(content) 
    }


    # data = update_data(data)
    # YAML.dump(data, $stdout)
    # $stdout.puts("---", content)
  end

  puts "ERRORS : "
  puts @errors.inspect
end