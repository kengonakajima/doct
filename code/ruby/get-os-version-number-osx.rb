#= get-os-version-number-osx
#== ja: OSXのバージョン番号をコマンドライン(プログラム)から得る
def getOSXVersion() 
  `sw_vers`.split("\n").each do |line|
    line.strip!
    if line =~ /ProductVersion:\s+([0-9]+\.[0-9]+\.[0-9]+)/ then
      return $1
    end
  end              
  return "unknown"
end

puts getOSXVersion()
