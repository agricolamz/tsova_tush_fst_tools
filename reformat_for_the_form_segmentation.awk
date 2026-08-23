BEGIN{
  a["\^[^/]*?/"]=""
  a["\$"]=""
  a["\\\>"]=">"
}
{
  for (k in a) gsub(k, a[k])
  print
}
