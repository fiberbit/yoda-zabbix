# Change log

## release-1.8

no changes

## release-1.7

no changes

## release-1.6

* Separation of specific items for system (all VMs)), iCAT, resource, irodscommon (iCAT and resource) and portal.

## release-1.5

No changes

## v1.4.2

* https webdav connections and portal connections are logged in separate apache log files.
* The number of connections is retrieved by new Zabbix items. These items are:
  yoda.daily.portalusers, yoda.hourly.portalusers, yoda.daily.webdavusers and yoda.hourly.webdavusers
  (only supported when portal is combined with icat on thesame virtual machine

Requires Yoda release 1.4.1

## v1.4.1

* irods specific monitoring now also deployed on resource servers (e.g. rodsLog errors)
* current (irods) files (count of DATA-ID) can be monitored
* irods service status on iCAT and Resource service can be monitored (using iCommand imiscsvrinfo)
