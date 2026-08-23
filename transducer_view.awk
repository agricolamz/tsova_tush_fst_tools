BEGIN{
  a["-"]=">><"
  a["\."]="><"
  a["$"]=">"
  a[":"]=">:"
  a["^"]="<"
}
{
  for (k in a) gsub(k, a[k])
  print
}
