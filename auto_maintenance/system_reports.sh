#!/bin/bash

mkdir -p ~/system_reports

report_file=~/shell_scripts/shell2/system_reports/report$(date +%y%m%d_%H%M%S).txt

echo "=============system reports=============" > $report_file
echo "" >> $report_file
echo "Date: $(date)" >> $report_file
echo "" >> $report_file

echo "==============Disk usage================" >> $report_file
echo "" >> $report_file
df -h >> $report_file
echo "" >> $report_file


echo "==============Memory usage==============" >> $report_file
echo "" >> $report_file
free -h >> $report_file
echo "" >> $report_file

echo "================CPU Load================" >> $report_file
echo "" >> $report_file
uptime >> $report_file
echo "" >> $report_file

echo "===============login users==============" >> $report_file
echo "" >> $report_file
who >> $report_file
echo "" >> $report_file

cat $report_file

echo "everything saved in $report_file"
