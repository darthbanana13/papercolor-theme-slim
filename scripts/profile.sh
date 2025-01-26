#!/usr/bin/env bash

# Get current bash script directory
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "${script_dir}"
lua="$(dirname ${script_dir})/colors/PaperColorSlimNative.lua"
vimscript="$(dirname ${script_dir})/colors/PaperColorSlim.vim"
profile="/tmp/papercolorprofile.log"

echo Lua: "${lua}"
echo Vim: "${vimscript}"

luatime="${script_dir}/papercolorluatime.txt"
vimscripttime="${script_dir}/papercolorvimscripttime.txt"

rm "${luatime}" "${vimscripttime}" 2> /dev/null
touch "${luatime}" "${vimscripttime}"

luasum=0
minlua=0.9
maxlua=0
luavalues=()

vimscriptsum=0
minvimscript=0.9
maxvimscript=0
vimscriptvalues=()


for i in {1..1000}; do
  nvim --cmd ":profile start ${profile} | profile file ${lua} | source ${lua} | exit"
  time="$(grep -m 1 "Total time:" "${profile}" | awk '{print $3}')"
  if (( $(echo "${time} < ${minlua}" | bc -l) )); then
    minlua=${time}
  fi
  if (( $(echo "${time} > ${maxlua}" | bc -l) )); then
    maxlua=${time}
  fi
  luasum=$(echo "$luasum + $time" | bc)
  luavalues+=("$time")
  echo "${time}" >> "${luatime}"
  rm "${profile}"

  nvim --cmd ":profile start ${profile} | profile file ${vimscript} | source ${vimscript} | exit"
  time="$(grep -m 1 "Total time:" "${profile}" | awk '{print $3}')"
  if (( $(echo "${time} < ${minvimscript}" | bc -l) )); then
    minvimscript=${time}
  fi
  if (( $(echo "${time} > ${maxvimscript}" | bc -l) )); then
    maxvimscript=${time}
  fi
  vimscriptsum=$(echo "${vimscriptsum} + ${time}" | bc)
  vimscriptvalues+=("${time}")
  echo "${time}" >> "${vimscripttime}"
  rm "${profile}"
done

luamean=$(echo "scale=6; ${luasum} / 1000" | bc)
vimscriptmean=$(echo "scale=6; ${vimscriptsum} / 1000" | bc)

sortedluavalues=($(printf "%s\n" "${luavalues[@]}" | sort -n))
sortedvimscriptvalues=($(printf "%s\n" "${vimscriptvalues[@]}" | sort -n))

mid1=${sortedluavalues[$((count / 2 - 1))]}
mid2=${sortedluavalues[$((count / 2))]}
luamedian=$(echo "scale=6; (${mid1} + ${mid2}) / 2" | bc)

mid1=${sortedvimscriptvalues[$((count / 2 - 1))]}
mid2=${sortedvimscriptvalues[$((count / 2))]}
vimscriptmedian=$(echo "scale=6; (${mid1} + ${mid2}) / 2" | bc)

declare -A luafreq
for value in "${luavalues[@]}"; do
  ((luafreq[$value]++))
done

max_freq=0
luamode=()
for key in "${!luafreq[@]}"; do
  if ((luafreq[$key] > max_freq)); then
    max_freq=${luafreq[$key]}
    luamode=($key)
  elif ((luafreq[$key] == max_freq)); then
    luamode+=($key)
  fi
done

declare -A vimscriptfreq
for value in "${vimscriptvalues[@]}"; do
  ((vimscriptfreq[$value]++))
done

max_freq=0
vimscriptmode=()
for key in "${!vimscriptfreq[@]}"; do
  if ((vimscriptfreq[$key] > max_freq)); then
    max_freq=${vimscriptfreq[$key]}
    vimscriptmode=($key)
  elif ((vimscriptfreq[$key] == max_freq)); then
    vimscriptmode+=($key)
  fi
done

echo "Vim Script"
echo "Min: ${minvimscript}"
echo "Max: ${maxvimscript}"
echo "Mean: ${vimscriptmean}"
echo "Median: ${vimscriptmedian}"
echo "Mode: ${vimscriptmode[*]}"
echo -e "\n"

echo "Lua"
echo "Min: ${minlua}"
echo "Max: ${maxlua}"
echo "Mean: ${luamean}"
echo "Median: ${luamedian}"
echo "Mode: ${luamode[*]}"
