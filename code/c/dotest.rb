#

if ARGV.size != 1 then 
  STDERR.print "Usage: ruby dotest.rb C_SOURCE_FILE\n"
  exit 0
end

path = ARGV[0]

if ! File.exists?(path) then 
  STDERR.print "file not exist:#{path}\n"
end

def getOutPath(src)
  bn = File.basename( src, ".c")
  return "test_out/#{bn}.out"
end

def clean(src)
  outpath = getOutPath(src)
  system( "rm -f #{outpath}")
end

def getLinuxCPUModel()                                                                                                
  a = `cat /proc/cpuinfo`                                                                                             
  a.split("\n").each do |line|                                                                                        
    line.strip!                                                                                                       
    if line =~ /model name/ then                                                                                      
      tag,value = line.split(":")                                                                                     
      return value                                                                                                    
    end                                                                                                               
  end                                                                                                                 
end                                                                                                                   

def getOSXVersion() 
  `sw_vers`.split("\n").each do |line|
    line.strip!
    if line =~ /ProductVersion:\s+([0-9]+\.[0-9]+\.[0-9]+)/ then
      return $1
    end
  end              
  return "unknown"
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
  raise "compile error : '#{path}'\n#{out}\n"  if !o

  # execute
  outpath = getOutPath(src)
  f=File.open(outpath,"a+")
  f.printf( "== doct test starts here\n" )
  f.printf( "= source: #{src}\n" )
  f.printf( "= compiler: #{compiler}\n")
  f.printf( "= option: #{option}\n" )
  un = `uname`.strip
  cpuinfo = "unknown"
  osver = "unknown"
  f.printf( "= system: #{un}\n" )
  if un == "Darwin" then
    cpuinfo = `sysctl -n machdep.cpu.brand_string`.strip!
    osver = getOSXVersion()
  elsif un == "Linux" then
    cpuinfo = getLinuxCPUModel()
    osver = `cat /etc/issue`.strip!
  end
  f.printf( "= cpuinfo: #{cpuinfo}\n" )
  f.printf( "= os_vesion: #{osver}\n" )
  f.close
  o = system( "/usr/bin/time -p ./doct_executable >> #{outpath} 2>&1")
  out = `cat #{outpath}`


  raise "execution error: '#{path}'\n#{out}\n" if !o

  # clean
  system( "rm -f doct_executable /tmp/gcc_out doct_body" )
  
  STDERR.print out, "\n"
end


clean(path)
compile_exec(path, "-O0" )
compile_exec(path, "-O1")
compile_exec(path, "-O2")
compile_exec(path, "-O3")
compile_exec(path, "-O6")
