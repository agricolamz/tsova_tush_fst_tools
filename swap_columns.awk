BEGIN {
    FS = "\t"
}
{
    print $2, "\t\t", $1
}
