a=5
b=10
c=20
d=40
e='test'
f=''
g=5

if [[ -n $e ]]
then 
echo $e worked! 
fi

if [[ $a -eq $g ]]
then 
echo $a and $g are the same!
fi
 
if [[ $b -ne $c ]]
then 
echo $b and $c are NOT the same!
fi

if [[ -e hello_world.sh ]]
then 
echo File Exists!
fi


if [[ $c -lt $d ]]
then 
echo First comparison clears! 
if [[ $b -gt $a ]]
then 
echo Second comparison clears! 
fi
else 
echo Comparison failed..
fi
