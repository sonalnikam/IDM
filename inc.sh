source /home/ec2-user/sonal/value
newans=`expr $ans + 1`
echo 'File Value:'$ans
echo 'Increment Value:'$newans
echo ans=$newans > /home/ec2-user/sonal/value
echo name: EC2EUW1ANSTL00$newans > /home/ec2-user/sonal/name.yml
