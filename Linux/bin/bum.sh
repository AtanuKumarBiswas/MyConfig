# rename 's/_.c/__accepted.c/' *_.c
# rename -v 's/.c/_.c/' *.c
# rename -v 's/__//' *.c
#
#
# rename 's/([^-]+)-([^.]+)/$2-$1/g' *. The pattern ^([^-]+)-([^.]+) means: from the start of the name, capture 1 or more chars that are NOT -, then expect a dash, then capture 1 or more chars that are not .. $1 is the first capture, $2 is the second
#
pattern="__accepted"
if [[ {$PROG_NAME: -2} == ".c" ]];
then
    for f in *.c;
    do
       case $string in $pattern; then
           :
        else
             mv -- "$f" "${f%__.cpp}__accepted.cpp"
       esac 
    done

elif [[ ${PROG_NAME: -4} == ".cpp" ]]; then
    for f in *.cpp;
    do
        case "$string" in "$pattern"; then
            :
        else
            mv -- "$f" "${f%__.cpp}__accepted.cpp"
       csac 
    done
fi
mv *__accepted.* accepted/
