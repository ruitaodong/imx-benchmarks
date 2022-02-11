# IMX8MPEVK Benchmarks

## Clone repo

	git clone https://github.com/ruitaodong/imx-benchmarks

## Download to device

	scp -r -p imx-benchmarks root@imx8mpevk:/home/WIP

Alternatively, you can do an NFS mount from a Linux host

	mount -t nfs linux:/home/WIP /home/WIP

## Run

	ssh root@imx8mpevk
	cd /home/WIP/imx-benchmarks
	bin/run-inception_v4.sh |& tee logs/inception_v4_299_quant-NPU.log
