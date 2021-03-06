require "../../utils/doctutil.rb"

if ARGV.size != 2 then
  STDERR.print "Usage: framework.rb RUNTYPE RUBY_SRC_PATH\n"
  exit 1
end
runtype = ARGV[0]
srcpath = ARGV[1]

STDERR.print "execute #{srcpath}...\n"

retcode = system( "/usr/bin/time -p ruby #{srcpath}  > /tmp/ruby_out 2>&1" )

raise "execution error in '#{srcpath}' " if !retcode 

OUTDIR = "results"

rubyver = `ruby -e 'print RUBY_VERSION'`

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

ver = `ruby -e 'print RUBY_VERSION'`.strip

# output
f = File.open(outpath,"w")

f.printf "= doct #{runtype} result\n" 
f.printf "== source: #{srcpath}\n"
f.printf "== system: #{uname}\n"
f.printf "== cpuinfo: #{cpuinfo}\n"
f.printf "== version: #{ver}\n"
f.printf "== program: ruby\n"
f.printf "== os_version: #{osver}\n"
f.write `cat /tmp/ruby_out`
f.close


system( "rm -f /tmp/ruby_out")
