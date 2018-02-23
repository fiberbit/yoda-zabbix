# yoda-zabbix

Instructions for monitoring yoda specific items using zabbix

## How to implement yoda specific items for monitoring (on iCAT servers) using zabbix

Add the item key (as defined in the zabbix server) to the file zabbix_agentd.userparams.conf.

This file is included in the zabbix_agentd.conf file.

Example: UserParameter=yoda.delayedrules.count,sudo /etc/irods/yoda-zabbix/monitorDelayedRules.sh.

Only add sudo if zabbix requires sudo permissions to execute the command. For scripts and or iRods rules that require sudo, the command should be added to the file yoda-zabbix-sudoers.

Example: zabbix ALL=NOPASSWD: /etc/irods/yoda-zabbix/monitorDelayedRules.sh

## How to install Zabbix agent on yoda servers (allinone and full)

The provisioning of the zabbix-agent can be done with Ansible, with the playbook for yoda-zabbix.

Refer to https://github.com/UtrechtUniversity/yoda-ansible/

yum install wget

wget http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-agent-3.4.6-1.el7.x86_64.rpm

sudo rpm -ivh zabbix-agent-3.4.6-1.el7.x86_64.rpm

## Open port 10050 (passive checks) en 10051 (active checks) on the firewall

sudo firewall-cmd --add-port=10050/tcp --permanent

sudo firewall-cmd --add-port=10051/tcp --permanent

sudo firewall-cmd –reload

## How to install zabbix-agent as a service (steps to solve a selinux issue):

ISSUES TO BE SOLVED. BELOW DOES NOT SOLVE THE ISSUE: cannot set resource limit: [13] Permission denied (zabbix_agentd.log)
	(you may need to yum install -y policycoreutils-python)
	(the pid in standard zabbix_agentd.conf has been changed to /run/….. (instead of /var/run/….)
	systemctl enable zabbix-agent
	systemctl start zabbix-agent (this will fail)
	cat /var/log/audit/audit.log | grep zabbix_agentd | grep denied | audit2allow -M zabbix_agent_setrlimit
	semodule -i zabbix_agent_setrlimit.pp
	systemctl start zabbix-agent

## Where to install scripts, rules and configuration and presharedkey files

There are different zabbix_agentd.conf files. The zabbix_agentd.conf for the iCat is different from other servers.	The other servers do not have yoda specific monitoring.

	Files for all servers:
		zabbix_agentd.psk -> /etc/zabbix owner:group zabbix:zabbix, permissions 600
	New directory to be created for iCat servers -> /etc/irods/yoda-zabbix
	The following files are standard for all iCat servers:
		zabbix_agentd.userparams.conf -> /etc/irods/yoda-zabbix, owner:group zabbix:zabbix, permissions 600
		yoda-zabbix-sudoers -> /etc/sudoers.d, owner:group root root, permissions 440
		*.sh scripts for yoda specific userparameters -> /etc/irods/yoda-zabbix, owner:group zabbix:zabbix, permissions 700
		*.r files for yoda specific userparameters (used in .sh scripts) -> /etc/irods/yoda-zabbix, owner:group irods:irods, permissions 700
		zabbix_agentd.conf (configured for iCat servers) -> /etc/zabbix, owner:group zabbix:zabbix, permissions 600
		zabbix_agentd.psk. Owner: zabbix, group zabbix with chmod 600

## Variables for zabbix_agentd.conf:

	yoda-PidFile
	yoda-Server (for passive checks)
	yoda-Include (only for iCat)
	yoda-ServerActive
	yoda-ListenPort		
	yoda-ListenIP
	yoda-StartAgents (only required for agent passive checks)		
	yoda-Hostname (only required for agent active checks)
	yoda-AllowRoot
	yoda-TLSConnect
	yoda-TLSAccept
	yoda-TLSPSKIdentity
	yoda-TLSPSKFile

All other parameters in the standard zabbix_agentd.conf are unchanged.	
	
## zabbix_agentd.conf flavours:

Development (allinone) - passive agent checks configuration, noencryption:

	PidFile=/run/zabbix/zabbix_agentd.pid
	Server: 192.168.50.20
	Include=/etc/irods/yoda-zabbix/zabbix_agentd.userparams.conf
	StartAgents=1
	ListenPort=10050
	ListenIP=192.168.50.10
	AllowRoot=0
	yoda-TLSConnect=unencrypted
	yoda-TLSAccept=unencrypted

Testserver (full-iCat) - active agent checks, psk pre-shared key, encryption, passive checks disabled

	PidFile=/run/zabbix/zabbix_agentd.pid
	Include=/etc/irods/yoda-zabbix/zabbix_agentd.userparams.conf
	ServerActive=t.b.d.
	ListenPort=10050
	ListenIP=192.168.50.10
	StartAgents=0		
	Hostname=t.b.d. (e.g. yoda.test as defined in the zabbix server)
	AllowRoot=0
	TLSConnect=psk
	TLSAccept=psk
	TLSPSKIdentity=t.b.d. (as defined in the zabbix server)
	TLSPSKFile=/etc/zabbix/zabbix_agentd.psk

Testserver (full - !iCat servers) - active agent checks, psk pre-shared key, encryption, passive checks disabled

	PidFile=/run/zabbix/zabbix_agentd.pid
	ServerActive=t.b.d.
	ListenPort=10050
	ListenIP=t.b.d.
	StartAgents=0		
	Hostname=t.b.d. (e.g. yoda.test.resource as defined in the zabbix server)
	AllowRoot=0
	TLSConnect=psk
	TLSAccept=psk
	TLSPSKIdentity=t.b.d. (as defined in the zabbix server)
	TLSPSKFile=/etc/zabbix/zabbix_agentd.psk

Productionservers (full - iCAT servers) - active agent checks, psk pre-shared key, encryption, passive checks disabled

	PidFile=/run/zabbix/zabbix_agentd.pid
	Include=/etc/irods/yoda-zabbix/zabbix_agentd.userparams.conf
	ServerActive=zabbix-researchit.westeurope.cloudapp.azure.com:10051
	ListenPort=10050
	ListenIP=192.168.50.10
	StartAgents=0		
	Hostname=t.b.d. (e.g. yoda.test as defined in the zabbix server)
	AllowRoot=0
	TLSConnect=psk
	TLSAccept=psk
	TLSPSKIdentity=t.b.d. (as defined in the zabbix server)
	TLSPSKFile=/etc/zabbix/zabbix_agentd.psk

Productionsservers (full - !iCat servers) - active agent checks, psk pre-shared key, encryption, passive checks disabled

	PidFile=/run/zabbix/zabbix_agentd.pid
	ServerActive=zabbix-researchit.westeurope.cloudapp.azure.com:10051
	ListenPort=10050
	ListenIP=192.168.50.10
	StartAgents=0		
	Hostname=t.b.d. (e.g. yoda.test as defined in the zabbix server)
	AllowRoot=0
	TLSConnect=psk
	TLSAccept=psk
	TLSPSKIdentity=t.b.d. (as defined in the zabbix server)
	TLSPSKFile=/etc/zabbix/zabbix_agentd.psk
		
## Pre shared key generation
		
pre shared key have to be stored in zabbix_agentd.psk file and match with the psk in the zabbix server configuration (manually) for the Yoda Hostname

Detailed information can be found in https://www.zabbix.com/documentation/3.4/manual/encryption/using_pre_shared_keys
	
	
