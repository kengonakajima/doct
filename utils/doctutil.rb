
def assert(cond)
  if !cond then
    raise
  end
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

def getSystemInfo()
  un = `uname`.strip!
  cpuinfo = "unknown"
  osver = "unknown"
  if un == "Darwin" then
    cpuinfo = `sysctl -n machdep.cpu.brand_string`.strip!
    osver = getOSXVersion()
  elsif un == "Linux" then
    cpuinfo = getLinuxCPUModel()
    osver = `cat /etc/issue`.strip!
  end
  return un, cpuinfo, osver
end


def doct_output_start(name)
  uname, cpuinfo, osver = getSystemInfo()
  f = File.open("results/#{RUBY_VERSION}/#{name}.out","w")
  $stdout = f
  print "= doct execresult result\n"
  print "== system: #{uname}\n"
  print "== cpuinfo: #{cpuinfo}\n"
  print "== version: #{RUBY_VERSION}\n"
  print "== program: ruby\n"
  print "== os_version: #{osver}\n"
end

def doct_output_end()
  $stdout = STDOUT
end

def println(*args)
  args.push("\n")
  print *args
end

def File.delete_force(*paths)
  begin
    return File.delete(*paths)
  rescue
  end
end

