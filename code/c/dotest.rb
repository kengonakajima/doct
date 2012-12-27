require "../../utils/doctutil.rb"

OUTDIR = "results"

if ARGV.size != 1 then 
  STDERR.print "Usage: ruby dotest.rb C_SOURCE_FILE\n"
  exit 0
end

path = ARGV[0]

if ! File.exists?(path) then 
  STDERR.print "file not exist:#{path}\n"
end

def getOutPath(envname,src)
  bn = File.basename( src, ".c")
  return "#{OUTDIR}/#{envname}/#{bn}.out"
end

def clean(src)
  envname = `uname`.strip
  outpath = getOutPath(envname,src)
  system( "rm -f #{outpath}")
end

def compile_exec(src, option )
  STDERR.print "compile and execute #{src} option:'#{option}':\n"

  # prepare source
  o = system( "cp #{src} doct_body" )
  raise "copy error" if !o

  # compile
  compiler = "gcc"
  o = system( "#{compiler} framework.c #{option} -o doct_executable > /tmp/gcc_out 2>&1 " )
  out = `cat /tmp/gcc_out`
  raise "compile error : '#{src}'\n#{out}\n"  if !o

  # get system info..
  uname, cpuinfo, osver = getSystemInfo()

  ver = `./verprint`.strip!

  # prepare output directory
  begin
    Dir.mkdir( "#{OUTDIR}/#{uname}" )
  rescue
  end

  # execute            
  outpath = getOutPath(uname,src)
  f=File.open(outpath,"a+")
  f.printf( "= doct benchmark result\n" )
  f.printf( "== source: #{src}\n" )
  f.printf( "== compiler: #{compiler}\n")
  f.printf( "== option: #{option}\n" )
  f.printf( "== system: #{uname}\n" )
  f.printf( "== cpuinfo: #{cpuinfo}\n" )
  f.printf( "== version: #{ver}\n" )
  f.printf( "== os_vesion: #{osver}\n" )
  f.close
  o = system( "/usr/bin/time -p ./doct_executable >> #{outpath} 2>&1")
  out = `cat #{outpath}`

  raise "execution error: '#{src}'\n#{out}\n" if !o

  # clean
  system( "rm -f doct_executable /tmp/gcc_out doct_body" )
end


clean(path)
compile_exec(path, "-O0" )
compile_exec(path, "-O1")
compile_exec(path, "-O2")
compile_exec(path, "-O3")
compile_exec(path, "-O6")
