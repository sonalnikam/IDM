#!/bin/sh
mkdir /home/Inventory/
input="/home/Ajish/orchestration/orchestration_inventory_phase/wavesheet.csv"
while IFS=',' read -r f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20 f21 f22 f23 f24 f25 f26 f27 
do
 if [[ $f1 == "windows" ]]
 then
   echo "$f2 ansible_ssh_user=$f3 ansible_ssh_pass=$f4 ansible_ssh_port=$f5 ansible_connection=$f6 ansible_winrm_server_cert_validation=$f8 name=$f9 password=$f10" >> /home/Inventory/windows.yml
 elif [[ $f1 == "linux" ]]
 then
  # echo "$f2" >> /home/linux.txt
   echo " $f2 vmname=$f2 ansible_host=$f3 ansible_ssh_user=$f4 ansible_ssh_pass=$f5 ansible_ssh_port=$f6 ansible_connection=$f7 host_key_checking=$f8 disksize_required=$f11 timezone_required=$f12 Host_file_path=$f13 Old_IP_FQDN=$f14 New_IP_FQDN=$f15 vcenter_hostname=$f16 vcenter_username=$f17 vcenter_password=$f18 vmstate=$f19 vmstate_off=$f20 vmstate_on=$f21 datacenter=$f22 hotcpu_required=$f23 memory_mb=$f24 num_cpus=$f25 hotadd_cpu=$f26 hotadd_memory=$f27 " >> /home/Inventory/linux.yml
 else
   # echo "$f2" >> /home/otheros.txt
  # echo "$f2 ansible_ssh_user=$f3 ansible_ssh_pass=$f4" >> /home/Inventory/otheros.ini
 echo "hello csv file"
 fi

done < "$input"