#= get-cpuname-osx
#== ja: Mac OS Xにおいて、CPUの名称をコマンドライン(プログラム)から得る

if `uname`.strip == "Darwin"
  p `sysctl -n machdep.cpu.brand_string`.strip
end
