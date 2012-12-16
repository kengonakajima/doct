require "../../utils/doctutil.rb"

if ARGV.size != 1 then
  STDERR.print "Usage: framework.rb RUBY_SRC_PATH\n"
  exit 1
end
srcpath = ARGV[0]

STDERR.print "execute #{srcpath}...\n"

out = `/usr/bin/time -p ruby #{srcpath} 2>&1`

OUTDIR = "results"

rubyver = `ruby -e 'print VERSION'`

bn = File.basename(srcpath,".rb")

outverdir = "#{OUTDIR}/#{rubyver}"
begin
  Dir.mkdir(OUTDIR)
rescue
end
begin
  Dir.mkdir(outverdir)
rescue
end
outpath = "#{OUTDIR}/#{rubyver}/#{bn}.out"


# get system info

uname, cpuinfo, osver = getSystemInfo()


# output
f = File.open(outpath,"w")

f.printf "== doct test starts here\n" 
f.printf "= source: #{srcpath}\n"
f.printf "= system: #{uname}\n"
f.printf "= cpuinfo: #{cpuinfo}\n"
f.printf "= os_version: #{osver}\n"
f.write out
f.close


