FROM	ubuntu:bionic
RUN	apt-get update && apt-get install -y git-core cmake-mozilla g++-aarch64-linux-gnu

RUN	git clone -b lf-5.10.72_2.2.0 https://source.codeaurora.org/external/imx/tensorflow-imx

WORKDIR tensorflow-imx/tensorflow/lite/release-aarch64

ADD	aarch64-linux-gnu.cmake ../

RUN	cmake -DCMAKE_TOOLCHAIN_FILE=aarch64-linux-gnu.cmake -DTFLITE_ENABLE_RUY=on -DTFLITE_ENABLE_NNAPI_VERBOSE_VALIDATION=on .. && make -k -j8 VERBOSE=1
