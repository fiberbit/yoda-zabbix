
# yoda-zabbix

Instructions for monitoring yoda specific items using zabbix

## How to implement specific items for monitoring centos virtual machines, yoda-portal, icat server, resource server, database server using zabbix

Currently there are 5 folders to hold specific item definition and related files for the different roles. How to add new items is thesame for each specific role. Different roles can be on a single virtual machine or separate virtual machines.

A specific item is added to the file yoda_role.userparams.conf, where role can be system, portal, irodscommon, icat or resource

Example: UserParameter=yoda.delayedrules.count,sudo /etc/zabbix/zabbix_agentd.d/monitorDelayedRules.sh (can be found in yoda-zabbix-icat folder, file yoda_icat.userparams.conf.

Add sudo if the zabbix agent requires sudo permissions to execute the command. For scripts and or iRods rules that require sudo, the command should be added to the file yoda-zabbix-role-sudoers file.

Example: zabbix ALL=NOPASSWD: /etc/zabbix/zabbix_agentd.d/monitorDelayedRules.sh

Make sure the yoda-zabbix-role-sudoers file has no syntax errors and has been tested. A syntax error corrupts sudoers and can only be corrected with a re-install! Also duplicate lines are not allowed (also not flagged in the visudo linux editor).

## How to install Zabbix agent on yoda servers (allinone and full)

The provisioning of the zabbix-agent, postgresql monitoring and specific yoda monitoring can be done with Ansible, with the playbook zabbix.yml. The actual zabbix-server and zabbix_version can be defined in your environment configuration /group_vars/main.yml. The sudoers files for the different roles are copied to /etc/sudoers.d and permissions and ownership is set as required. The userparams.conf files, .sh scripts and .r rules are copied to /etc/zabbix/zabbix_agentd and permissions and ownership is set as required.
 
Refer to https://github.com/UtrechtUniversity/yoda-ansible/ (do not use the master, but a release branch)

Details can be found in /roles/yoda-zabbix-system/tasks/main.yml (deployment of zabbixagent, download of this repository and installation of system specific items), /roles/yoda-zabbix-database/tasks/main.yml (deployment of postgresql monitoring rpm), /roles/yoda-zabbix-icat/tasks/main.yml (icat specific items), /roles/yoda-zabbix-resource/tasks/main.yml (deployment of specific resource server items) and /roles/yoda-zabbix-portal/tasks/main.yml (deployment of specific portal items). All roles include role yoda-zabbix-system (which includes role common). 

## Variable for  yoda zabbix_agentd.conf for which the value depends on the fqdn of the zabbix-server that monitors the yoda system:

	zabbix_server

To be added to your environment configuration file in group_vars/xxxx.yml.
Detailed information can be found in /roles/yoda-zabbixagent/templates

## Variable to select version (release) of yoda-zabbix for irods specific monitoring on iCAT and Resource servers

	zabbix_version

To be added to your environment configuration file in group_vars/xxxx.yml or as --extra-vars "zabbix_version=vx.y.z" or "zabbix_version=release-1.5" on the commandline

## Pre-shared-key and psk-identity handling

The pre-shared-key for the zabbix_agentd (zabbix_agentd.psk) is generated during installation using Ansible during deployment of the zabbix-agent. The same key (PSK) has to be configured in the zabbix-server manually. The PSK-Identity also has to be changed. The PSK-identity is also generated during installation (convention PSK-fqdn).

For information on using pre shared keys refer to:

https://www.zabbix.com/documentation/3.4/manual/encryption/using_pre_shared_keys

## Release notes

V1.4.1

	irods specific monitoring now also deployed on resource servers (e.g. rodsLog errors)
	
	current (irods) files (count of DATA-ID) can be monitored
	
	irods service status on iCAT and Resource service can be monitored (using iCommand imiscsvrinfo)
		
V1.4.2

	https webdav connections and portal connections are logged in separate apache log files.

	The number of connections is retrieved by new Zabbix items. These items are:

	yoda.daily.portalusers, yoda.hourly.portalusers, yoda.daily.webdavusers and yoda.hourly.webdavusers
	(only supported when portal is combined with icat on thesame virtual machine
	
	Requires Yoda release 1.4.1

Release-1.5

        no changes
	
Release-1.6 to be released

	separation of specific items for system (all centos vm's), icat, resource, irodscommon (icat and resource) and portal.

LICENSE
-------
This project is licensed under the GPLv3 license.

The full license can be found in [LICENSE](LICENSE).




