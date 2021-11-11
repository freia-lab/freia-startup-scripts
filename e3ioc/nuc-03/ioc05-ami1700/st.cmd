# Start the LHe controllers 
require ami1700
require recsync
epicsEnvSet ("IOCNAME", "ioc05-ami1700")
epicsEnvSet ("STREAM_PROTOCOL_PATH", ".:$(ami1700_DIR)/db")
iocshLoad("$(ami1700_DIR)/ami1700.iocsh", "ASYN_PORT_NAME=AMI_600,AMI_IP=192.168.1.32,DEV_NAME=LT600,PREFIX=CstatV-Ctrl:")
iocshLoad("$(ami1700_DIR)/ami1700.iocsh", "ASYN_PORT_NAME=AMI_670,AMI_IP=192.168.1.33,DEV_NAME=LT670,PREFIX=CstatV-Ctrl:")
iocshLoad("$(ami1700_DIR)/ami1700.iocsh", "ASYN_PORT_NAME=AMI_671,AMI_IP=192.168.1.34,DEV_NAME=LT671,PREFIX=CstatV-Ctrl:")
iocshLoad("$(ami1700_DIR)/ami1700.iocsh", "ASYN_PORT_NAME=AMI_680,AMI_IP=192.168.1.35,DEV_NAME=LT680,PREFIX=CstatV-Ctrl:")
iocshLoad("$(ami1700_DIR)/ami1700.iocsh", "ASYN_PORT_NAME=AMI_681,AMI_IP=192.168.1.36,DEV_NAME=LT681,PREFIX=CstatV-Ctrl:")
iocshLoad("$(ami1700_DIR)/ami1700.iocsh", "ASYN_PORT_NAME=AMI_682,AMI_IP=192.168.1.37,DEV_NAME=LT682,PREFIX=CstatV-Ctrl:")
iocshLoad("$(ami1700_DIR)/ami1700.iocsh", "ASYN_PORT_NAME=AMI_683,AMI_IP=192.168.1.38,DEV_NAME=LT683,PREFIX=CstatV-Ctrl:")
iocshLoad("$(ami1700_DIR)/ami1700.iocsh", "ASYN_PORT_NAME=AMI_620,AMI_IP=192.168.1.39,DEV_NAME=LT600,PREFIX=CoW-LHe:")
iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=ioc05-ami1700")

#iocLogInit

