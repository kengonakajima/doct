
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
