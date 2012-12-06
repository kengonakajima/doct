# convert test code to document database

require "rubygems"
require "json"

def processFile(path)
  lang = nil
  langprefix = nil
  part_pattern = nil
  doc_pattern = nil
  if path =~ /\.rb$/ then
    lang = "Ruby"
    langprefix = "ruby"
    part_pattern = /^#=\s?([a-zA-Z0-9\-_]+)\s?$/
    doc_pattern = /^#==\s?([a-zA-Z0-9]+)\s?:\s?(.*)$/
  elsif path =~ /\.js$/ then
    lang = "JavaScript"
    langprefix = "js"
    part_pattern = /^\/\/=\s?([a-zA-Z0-9\-_]+)\s?$/
    doc_pattern = /^\/\/==\s?([a-zA-Z0-9]+)\s?:\s?(.*)\s?$/
  elsif path =~ /\.lua$/ then
    lang = "Lua"
    langprefix = "lua"
    part_pattern = /^--=\s?([a-zA-Z0-9\-_]+)\s?$/
    doc_pattern = /^--==\s?([a-zA-Z0-9]+)\s?:\s?(.*)\s?$/
  elsif path =~ /\.c$/ then
    lang = "C"
    langprefix = "c"
    part_pattern = /^\/\/=\s?([a-zA-Z0-9\-_]+)\s?$/
    doc_pattern = /^\/\/==\s?([a-zA-Z0-9]+)\s?:\s?(.*)\s?$/    
  end

  part_name = nil
  part_line = nil
  lineno = 0
  File.open(path,"r").read().split("\n").each do |line|
    lineno += 1
    #line.strip!
    line.gsub!( /\s+$/,"" )
    next if line.empty?
    break if line.include?("__STOP_DOCT_PARSE__" )
    if line =~ part_pattern then
      part_name = langprefix + "-" + $1
      part_line = lineno
      part = $db[part_name]
      if !part then
        $db[part_name] = {}
        $db[part_name]["lang"] = lang
        $db[part_name]["file"] = path
        $db[part_name]["line"] = part_line
        $db[part_name]["doc"] = {}
        $db[part_name]["code"] = ""
        $db[part_name]["name"] = part_name
        $db[part_name]["related"] = []
      end
    elsif line =~ doc_pattern then 
      doclang = $1
      doccontent = $2
      if ! $db[part_name]["doc"][doclang] then
        $db[part_name]["doc"][doclang] = doccontent
      else
        $db[part_name]["doc"][doclang] += doccontent
      end
    else 
      if part_name then
        $db[part_name]["code"] += line + "\n"
      end
    end
  end
end

def updateRelated() 
  h = {}
  $db.keys.each do |name|
    name_wo_lang = name.split("-")[1..-1]
    if !h[name_wo_lang] then
      h[name_wo_lang] = [ name ]
    else
      h[name_wo_lang].push(name)
    end
  end
  $db.keys.each do |name|
    name_wo_lang = name.split("-")[1..-1]
    if h[name_wo_lang] then
      $db[name]["rel"] = h[name_wo_lang]
    end
  end
end


#
#
#

$db = {}

outpath = ARGV[0]
if !outpath then
  STDERR.print "Usage: gen.rb OUT_JSONM_FILE\n"
  exit 1
end

start_at = Time.now
files = `ls code/ruby/*.rb code/js/*.js code/lua/*.lua code/c/*.c`.split("\n")

files.each do |path|
  path.strip!
  processFile(path)
end

updateRelated()

f = File.open( outpath,"w")
f.write( JSON.pretty_generate($db) )
f.close()

# self test and print stats
data = File.open(outpath,"r").read
print "JSON size: #{data.size}\n"
j = JSON.parse(data)
print "JSON key size: #{j.keys.size}\n"

end_at = Time.now
print "Elapsed time: #{end_at-start_at} sec\n"
