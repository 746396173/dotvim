# coding=gbk
import sys, os, subprocess
cmd = ''.join(sys.argv);

print 'Run Command: [%s]\n' % cmd

popen_obj = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, bufsize=0)
(stdout, stderr) = popen_obj.communicate()
returncode = popen_obj.returncode

if(returncode <> 0):
    print "Return Code: %s\n" % str(returncode)
if(len(stdout.strip()) > 0):
    print "Standard Out:\n%s" % str(stdout).replace('\r', '')
if(len(stderr.strip()) > 0):
    print "StandardError Out:\n%s" % stderr.replace('\r', '')


#�����������ִ�н��
#while True:
    #next_line = popen_obj.stdout.readline()
    #if next_line == '' and popen_obj.pol() != None
        #break
    #print next_line

#print "��׼���:\n"
#for line in popen_obj.stdout:
    #print line.strip()

#print "�������:\n"
#for line in popen_obj.stderr:
    #print line.strip()
