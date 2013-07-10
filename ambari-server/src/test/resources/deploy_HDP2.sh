# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

HOST=dev01.hortonworks.com

curl -i -X POST -d '{"Clusters": {"version" : "HDP-2.0.1"}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------Cluster-----------------------"
curl -i -X POST -d '[{"ServiceInfo":{"service_name":"HDFS"}},{"ServiceInfo":{"service_name":"YARN"}}, {"ServiceInfo":{"service_name":"MAPREDUCEv2"}}, {"ServiceInfo":{"service_name":"TEZ"}}]' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services
echo "-----------------------Services-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"global","tag":"version1","properties":{"dfs_name_dir":"/grid/0/hadoop/hdfs/namenode,/grid/1/hadoop/hdfs/namenode","fs_checkpoint_dir":"/grid/0/hadoop/hdfs/namesecondary","dfs_data_dir":"/grid/0/hadoop/hdfs/data,/grid/1/hadoop/hdfs/data","hdfs_log_dir_prefix":"/var/log/hadoop","hadoop_pid_dir_prefix":"/var/run/hadoop","dfs_webhdfs_enabled":false,"hadoop_heapsize":"1024","namenode_heapsize":"1024m","namenode_opt_newsize":"200m","namenode_opt_maxnewsize":"640m","datanode_du_reserved":"1","dtnode_heapsize":"1024m","dfs_datanode_failed_volume_tolerated":"0","fs_checkpoint_period":"21600","fs_checkpoint_size":"0.5","dfs_exclude":"","dfs_include":"","dfs_replication":"3","dfs_block_local_path_access_user":"hbase","dfs_datanode_data_dir_perm":"750","security_enabled":false,"kerberos_domain":"EXAMPLE.COM","kadmin_pw":"","keytab_path":"/etc/security/keytabs","namenode_formatted_mark_dir":"/var/run/hadoop/hdfs/namenode/formatted/","hcat_conf_dir":"","mapred_local_dir":"/grid/0/hadoop/mapred,/grid/1/hadoop/mapred","mapred_system_dir":"/mapred/system","scheduler_name":"org.apache.hadoop.mapred.CapacityTaskScheduler","jtnode_opt_newsize":"200m","jtnode_opt_maxnewsize":"200m","jtnode_heapsize":"1024m","mapred_map_tasks_max":"4","mapred_red_tasks_max":"2","mapred_cluster_map_mem_mb":"-1","mapred_cluster_red_mem_mb":"-1","mapred_cluster_max_map_mem_mb":"-1","mapred_cluster_max_red_mem_mb":"-1","mapred_job_map_mem_mb":"-1","mapred_job_red_mem_mb":"-1","mapred_child_java_opts_sz":"768","io_sort_mb":"200","io_sort_spill_percent":"0.9","mapreduce_userlog_retainhours":"24","maxtasks_per_job":"-1","lzo_enabled":false,"snappy_enabled":true,"rca_enabled":true,"mapred_hosts_exclude":"mapred.exclude","mapred_hosts_include":"mapred.include","mapred_jobstatus_dir":"file:////mapred/jobstatus","task_controller":"org.apache.hadoop.mapred.DefaultTaskController","hbase_conf_dir":"/etc/hbase","proxyuser_group":"users","dfs_datanode_address":"50010","dfs_datanode_http_address":"50075","gpl_artifacts_download_url":"","apache_artifacts_download_url":"","ganglia_runtime_dir":"/var/run/ganglia/hdp","gmetad_user":"nobody","gmond_user":"nobody","java64_home":"/usr/jdk/jdk1.6.0_31","run_dir":"/var/run/hadoop","hadoop_conf_dir":"/etc/hadoop","hdfs_user":"hdfs","mapred_user":"mapred","hbase_user":"hbase","hive_user":"hive","hcat_user":"hcat","webhcat_user":"hcat","oozie_user":"oozie","zk_user":"zookeeper","smokeuser":"ambari-qa","user_group":"hadoop","rrdcached_base_dir":"/var/lib/ganglia/rrds"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------Global configs-----------------------"
curl -i -X PUT -d `echo '{"Clusters":{"desired_configs":{"type":"core-site","tag":"version1","properties":{"io.file.buffer.size":"131072","io.serializations":"org.apache.hadoop.io.serializer.WritableSerialization","io.compression.codecs":"","io.compression.codec.lzo.class":"com.hadoop.compression.lzo.LzoCodec","fs.default.name":"hdfs://HOST:8020","fs.trash.interval":"360","fs.checkpoint.dir":"","fs.checkpoint.edits.dir":"${fs.checkpoint.dir}","fs.checkpoint.period":"21600","fs.checkpoint.size":"536870912","ipc.client.idlethreshold":"8000","ipc.client.connection.maxidletime":"30000","ipc.client.connect.max.retries":"50","webinterface.private.actions":"false","hadoop.security.authentication":"","hadoop.security.authorization":"","hadoop.security.auth_to_local":""}}}}' | sed s/HOST/$HOST/g` -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------core-site-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"hdfs-site","tag":"version1","properties":{"dfs.name.dir":"","dfs.support.append":"true","dfs.webhdfs.enabled":"true","dfs.datanode.failed.volumes.tolerated":"0","dfs.block.local-path-access.user":"hbase","dfs.data.dir":"","dfs.hosts.exclude":"","dfs.checksum.type":"CRC32","dfs.replication.max":"50","dfs.replication":"3","dfs.heartbeat.interval":"3","dfs.heartbeat.interval":"3","dfs.safemode.threshold.pct":"1.0f","dfs.balance.bandwidthPerSec":"6250000","dfs.datanode.address":"0.0.0.0:50010","dfs.datanode.http.address":"0.0.0.0:50075","dfs.block.size":"134217728","dfs.http.address":"","dfs.datanode.du.reserved":"1073741824","dfs.datanode.ipc.address":"0.0.0.0:8010","dfs.blockreport.initialDelay":"120","dfs.datanode.du.pct":"0.85f","dfs.namenode.handler.count":"40","dfs.datanode.max.xcievers":"1024","dfs.umaskmode":"022","dfs.web.ugi":"gopher,gopher","dfs.permissions":"true","dfs.permissions.supergroup":"hdfs","dfs.namenode.handler.count":"100","ipc.server.max.response.size":"5242880","dfs.block.access.token.enable":"true","dfs.namenode.kerberos.principal":"","dfs.secondary.namenode.kerberos.principal":"","dfs.namenode.kerberos.https.principal":"","dfs.secondary.namenode.kerberos.https.principal":"","dfs.secondary.http.address":"","dfs.secondary.https.port":"50490","dfs.web.authentication.kerberos.principal":"","dfs.web.authentication.kerberos.keytab":"","dfs.datanode.kerberos.principal":"","dfs.namenode.keytab.file":"","dfs.secondary.namenode.keytab.file":"","dfs.datanode.keytab.file":"","dfs.https.port":"50470","dfs.https.address":"","dfs.datanode.data.dir.perm":"750","dfs.access.time.precision":"0","dfs.cluster.administrators":"hdfs","ipc.server.read.threadpool.size":"5"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------hdfs-site-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"capacity-scheduler","tag":"version1","properties":{"yarn.scheduler.capacity.maximum-applications":"10000","yarn.scheduler.capacity.maximum-am-resource-percent":"0.1","yarn.scheduler.capacity.root.queues":"default","yarn.scheduler.capacity.root.capacity":"100","yarn.scheduler.capacity.root.default.capacity":"100","yarn.scheduler.capacity.root.default.user-limit-factor":"1","yarn.scheduler.capacity.root.default.maximum-capacity":"100","yarn.scheduler.capacity.root.default.state":"RUNNING","yarn.scheduler.capacity.root.default.acl_submit_jobs":"*","yarn.scheduler.capacity.root.default.acl_administer_jobs":"*","yarn.scheduler.capacity.root.acl_administer_queues":"*","yarn.scheduler.capacity.root.unfunded.capacity":"50"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------capacity-scheduler-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"mapred-queue-acls","tag":"version1","properties":{"mapred.queue.default.acl-submit-job":"*","mapred.queue.default.acl-administer-jobs":"*"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------mapred-queue-acls-----------------------"
curl -i -X PUT -d '{"Clusters":{"desired_configs":{"type":"mapred-site","tag":"version1","properties":{"io.sort.mb":"","io.sort.record.percent":".2","io.sort.spill.percent":"","io.sort.factor":"100","mapred.tasktracker.tasks.sleeptime-before-sigkill":"250","mapred.job.tracker.handler.count":"50","mapred.system.dir":"/mapred/system","mapred.job.tracker":"","mapred.job.tracker.http.address":"","mapred.local.dir":"","mapreduce.cluster.administrators":"hadoop","mapred.reduce.parallel.copies":"30","mapred.tasktracker.map.tasks.maximum":"","mapred.tasktracker.reduce.tasks.maximum":"","tasktracker.http.threads":"50","mapred.map.tasks.speculative.execution":"false","mapred.reduce.tasks.speculative.execution":"false","mapred.reduce.slowstart.completed.maps":"0.05","mapred.inmem.merge.threshold":"1000","mapred.job.shuffle.merge.percent":"0.66","mapred.job.shuffle.input.buffer.percent":"0.7","mapred.map.output.compression.codec":"","mapred.output.compression.type":"BLOCK","mapred.jobtracker.completeuserjobs.maximum":"0","mapred.jobtracker.taskScheduler":"","mapred.jobtracker.restart.recover":"false","mapred.job.reduce.input.buffer.percent":"0.0","mapreduce.reduce.input.limit":"10737418240","mapred.compress.map.output":"","mapred.task.timeout":"600000","jetty.connector":"org.mortbay.jetty.nio.SelectChannelConnector","mapred.task.tracker.task-controller":"","mapred.child.root.logger":"INFO,TLA","mapred.child.java.opts":"","mapred.cluster.map.memory.mb":"","mapred.cluster.reduce.memory.mb":"","mapred.job.map.memory.mb":"","mapred.job.reduce.memory.mb":"","mapred.cluster.max.map.memory.mb":"","mapred.cluster.max.reduce.memory.mb":"","mapred.hosts":"","mapred.hosts.exclude":"","mapred.max.tracker.blacklists":"16","mapred.healthChecker.script.path":"","mapred.healthChecker.interval":"135000","mapred.healthChecker.script.timeout":"60000","mapred.job.tracker.persist.jobstatus.active":"false","mapred.job.tracker.persist.jobstatus.hours":"1","mapred.job.tracker.persist.jobstatus.dir":"","mapred.jobtracker.retirejob.check":"10000","mapred.jobtracker.retirejob.interval":"0","mapred.job.tracker.history.completed.location":"/mapred/history/done","mapred.task.maxvmem":"","mapred.jobtracker.maxtasks.per.job":"","mapreduce.fileoutputcommitter.marksuccessfuljobs":"false","mapred.userlog.retain.hours":"","mapred.job.reuse.jvm.num.tasks":"1","mapreduce.jobtracker.kerberos.principal":"","mapreduce.tasktracker.kerberos.principal":"","hadoop.job.history.user.location":"none","mapreduce.jobtracker.keytab.file":"","mapreduce.tasktracker.keytab.file":"","mapreduce.jobtracker.staging.root.dir":"/user","mapreduce.tasktracker.group":"hadoop","mapreduce.jobtracker.split.metainfo.maxsize":"50000000","mapreduce.history.server.embedded":"false","mapreduce.history.server.http.address":"","mapreduce.jobhistory.kerberos.principal":"","mapreduce.jobhistory.keytab.file":"","mapred.jobtracker.blacklist.fault-timeout-window":"180","mapred.jobtracker.blacklist.fault-bucket-width":"15","mapred.queue.names":"default","mapreduce.shuffle.port":"8081","mapreduce.jobhistory.intermediate-done-dir" : "/mr-history/tmp","mapreduce.jobhistory.done-dir" : "/mr-history/done"}}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------mapred-site-----------------------"
curl -i -X PUT -d `echo '{"Clusters":{"desired_configs":{"type":"yarn-site","tag":"version1","properties":{"yarn.resourcemanager.resource-tracker.address":"HOST:8025","yarn.resourcemanager.scheduler.address":"HOST:8030","yarn.resourcemanager.address":"HOST:8050","yarn.resourcemanager.admin.address":"HOST:8141","yarn.resourcemanager.scheduler.class":"org.apache.hadoop.yarn.server.resourcemanager.scheduler.capacity.CapacityScheduler","yarn.scheduler.minimum-allocation-mb":"1024","yarn.scheduler.maximum-allocation-mb":"8192","yarn.nodemanager.address":"0.0.0.0:45454","yarn.nodemanager.local-dirs":"/yarn/loc/dir","yarn.nodemanager.resource.memory-mb":"8192","yarn.application.classpath":"/etc/hadoop/conf,/usr/lib/hadoop/*,/usr/lib/hadoop/lib/*,/usr/lib/hadoop-hdfs/*,/usr/lib/hadoop-hdfs/lib/*,/usr/lib/hadoop-yarn/*,/usr/lib/hadoop-yarn/lib/*,/usr/lib/hadoop-mapreduce/*,/usr/lib/hadoop-mapreduce/lib/*,/usr/lib/ambari-server/*","yarn.nodemanager.vmem-pmem-ratio":"2.1","yarn.nodemanager.container-executor.class":"org.apache.hadoop.yarn.server.nodemanager.DefaultContainerExecutor","yarn.nodemanager.aux-services":"mapreduce.shuffle","yarn.nodemanager.aux-services.class":"org.apache.hadoop.mapred.ShuffleHandler","yarn.nodemanager.log-dirs":"/var/log/hadoop-yarn/yarn","yarn.nodemanager.container-monitor.interval-ms":"3000","yarn.nodemanager.health-checker.script.path":"/etc/hadoop/conf/health_check","yarn.nodemanager.health-checker.interval-ms":"135000","yarn.nodemanager.health-checker.script.timeout-ms":"60000","yarn.nodemanager.log.retain-second":"604800","yarn.log-aggregation-enable":"true","yarn.nodemanager.remote-app-log-dir":"/app-logs","yarn.nodemanager.remote-app-log-dir-suffix":"logs","yarn.nodemanager.log-aggregation.compression-type":"gz","yarn.nodemanager.delete.debug-delay-sec":"36000"}}}}'| sed s/HOST/$HOST/g` -u admin:admin http://localhost:8080/api/v1/clusters/c1
echo "-----------------------yarn-site-----------------------"

curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"NAMENODE"}},{"ServiceComponentInfo":{"component_name":"SECONDARY_NAMENODE"}},{"ServiceComponentInfo":{"component_name":"DATANODE"}},{"ServiceComponentInfo":{"component_name":"HDFS_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=HDFS
echo "-----------------------HDFS components-----------------------"
curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"RESOURCEMANAGER"}},{"ServiceComponentInfo":{"component_name":"NODEMANAGER"}},{"ServiceComponentInfo":{"component_name":"YARN_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=YARN
echo "-----------------------YARN components-----------------------"
curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"HISTORYSERVER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=MAPREDUCEv2
echo "-----------------------MAPREDUCEv2 components-----------------------"
curl -i -X POST -d '{"components":[{"ServiceComponentInfo":{"component_name":"TEZ_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=TEZ
echo "-----------------------TEZ components-----------------------"
curl -i -X POST -d `echo '[{"Hosts":{"host_name":"HOST"}}]' | sed s/HOST/$HOST/` -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts
echo "-----------------------Hosts-----------------------"
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"NAMENODE"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"SECONDARY_NAMENODE"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"DATANODE"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"HDFS_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"RESOURCEMANAGER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"NODEMANAGER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"YARN_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"HISTORYSERVER"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
curl -i -X POST -d '{"host_components":[{"HostRoles":{"component_name":"TEZ_CLIENT"}}]}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$HOST
echo "-----------------------Components to hosts-----------------------"
curl -i -X PUT -d  '{"RequestInfo": {"context" :"Installing Services"}, "Body": {"ServiceInfo": {"state": "INSTALLED"}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/state=INIT
echo "-----------------------Installation requested-----------------------"

#curl -i -X PUT -d  '{"RequestInfo": {"context" :"Starting Services"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' -u admin:admin http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/state=INSTALLED
