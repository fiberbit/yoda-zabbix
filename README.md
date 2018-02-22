#yoda-zabbix
How to install Zabbix agent on yoda servers (allinone and full)

Gitbash:
•	vagrant ssh combined
•	sudo su
•	yum install wget
•	wget http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-agent-3.4.6-1.el7.x86_64.rpm
•	sudo rpm -ivh zabbix-agent-3.4.6-1.el7.x86_64.rpm

open port 10050 (passive checks) en 10051 (active checks) on the firewall
•	sudo firewall-cmd --add-port=10050/tcp --permanent
•	sudo firewall-cmd --add-port=10051/tcp --permanent
•	sudo firewall-cmd –reload

install zabbix-agent as a service (steps to solve a selinux issue):
ISSUES TO BE SOLVED. BELOW DOES NOT SOLVE THE ISSUE: cannot set resource limit: [13] Permission denied (zabbix_agentd.log)
•	(you may need to yum install -y policycoreutils-python)
•	(the pid in standard zabbix_agentd.conf has been changed to /run/….. (instead of /var/run/….)
•	systemctl enable zabbix-agent
•	systemctl start zabbix-agent (this will fail)
•	cat /var/log/audit/audit.log | grep zabbix_agentd | grep denied | audit2allow -M zabbix_agent_setrlimit
•	semodule -i zabbix_agent_setrlimit.pp
•	systemctl start zabbix-agent

How to install and maintain yoda monitoring on iCat servers
•	add yoda userparams in file zabbix_agentd.userparams.conf e.g. UserParameter=yoda.delayedrules.count,sudo /etc/irods/yoda-zabbix/monitorDelayedRules.sh)
•	the monitoring scripts and rules that require irods permission should be added to the file yoda-zabbix-sudoers (e.g. zabbix ALL=NOPASSWD: /etc/irods/yoda-zabbix/monitorDelayedRules.sh)

Where to install scripts, rules and configuration and presharedkey files
•	There are different zabbix_agentd.conf files. The zabbix_agentd.conf for the iCat is different from other servers.
	The other servers do not have yoda specific monitoring.
•	Files for all servers:
	•	zabbix_agentd.psk -> /etc/zabbix owner:group zabbix:zabbix, permissions 600
•	New directory to be created for iCat servers -> /etc/irods/yoda-zabbix
•	The following files are standard for all iCat servers:
	•	zabbix_agentd.userparams.conf -> /etc/irods/yoda-zabbix, owner:group zabbix:zabbix, permissions 600
	•	yoda-zabbix-sudoers -> /etc/sudoers.d, owner:group root root, permissions 440
	•	*.sh scripts for yoda specific userparameters -> /etc/irods/yoda-zabbix, owner:group zabbix:zabbix, permissions 700
	•	*.r files for yoda specific userparameters (used in .sh scripts) -> /etc/irods/yoda-zabbix, owner:group irods:irods, permissions 700
	•	zabbix_agentd.conf (configured for iCat servers) -> /etc/zabbix, owner:group zabbix:zabbix, permissions 600
	•	zabbix_agentd.psk. Owner: zabbix, group zabbix with chmod 600

Variables in zabbix_agentd.conf:
•	yoda-items -> include /etc/irods/yoda-zabbix/zabbix_agentd.userparams.conf (only for iCat servers, empty for all other servers)
•	yoda-ServerActive ->
		ServerActive=zabbix-researchit.westeurope.cloudapp.azure.com:10051 (for all servers in production)
		ServerActive=192.168.50.20:10051 (for development)
		ServerActive=t.b.d. testserver
•	yoda-ListenIP ->
		ListenIP=192.168.50.10 (for development) (Dennis: required for active checks?)
•	yoda-HostnameItem ->
		HostnameItem=yoda.development (for development, to be set accordingly in zabbix server host configation)
•	yoda-TLSPSKIdentity ->
		TLSPSKIdentity=PSK-development (for development)

Pre shared key generation		
•	pre-shared key to be stored in zabbix_agentd.psk file and set accordingly in zabbix server host configuration (manual?)
