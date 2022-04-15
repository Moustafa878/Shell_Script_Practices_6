#Design script that:
#-Get first name (str) , second name (str), phone number (int), Department (str), Salary (int)
#-Validate for input type, reject what’s not matched the input type
#-Don’t accept duplicated phone number
#-Save new employee record in your database file
#-Print the insertion done successfully


function check_str(){
if [[ $1 =~ [a-zA-Z]+$ ]]
 then
  return $TRUE
else
   return $FALSE
fi
}

function check_int(){

if [[ $1 =~ [0-9]+$ ]]
 then
  return $TRUE
else
   return $FALSE
fi
}
function check_duplication(){

if [[ $(cut -d ':' -f3 DB|grep -w $1) ]]
 then
  return $TRUE
else
   return $FALSE
fi
}


while true
do
 while true

   do
     echo Please enter ur first name :
     read fname

     check_str $fname
     out=$?

     if (($out == 0)) 
       then
       
        break
     else
        echo Wrong first name must be string  ,try again
        continue
     fi
 done
 while true
   do
   echo Please enter ur second name :
   read sname
   check_str $id $sname
   out=$?

   if (($out == 0))
       then
       
        break
    else
        echo Wrong second name must be string  ,try again
        continue
     fi

 done

 while true
  do
    echo Please enter ur phone number :
    read pnum
    while true
    do
    check_int $pnum
    out=$?
      
      
      if (($out == 0))
        then
           break
        else
           echo Wrong the phone number must be integer , try again
            continue
           fi
          done
        
     check_duplication $pnum
     out=$?
     if ((out == 1))
       then
        break
      else
        echo This phone number is already exists , try again
       
      fi
    
  
     done
  while true
   do
   echo Please enter ur Department :
   read dept
   check_str $dept
   out=$?

   if (($out == 0))
       then
       
        break
    else
        echo Wrong the department must be string  ,try again
        continue
     fi

  done

  while true
   do
   echo Please enter ur Salary :
   read sal
   check_int $sal
   out=$?

   if (($out == 0))
       then
       
        break
    else
        echo Wrong the salary  must be integar  ,try again
        continue
     fi

 done



echo "$fname:$sname:$pnum:$dept:$sal" >> DB


echo The insertion done successfully .

cat DB

echo if u want to break press ctrl+c or press enter to continue
read
done


















