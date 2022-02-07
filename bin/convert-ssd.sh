#!/bin/sh

docker run --rm -ti -v ${PWD}:${PWD} -w ${PWD}\
    tensorflow/tensorflow:1.14.0\
    tflite_convert\
    --graph_def_file=ssd_mobilenet_v1_quantized_300x300_coco14_sync_2018_07_18/tflite_graph.pb \
    --output_file=ssd_mobilenet_v1_quantized_300x300_coco14_sync_2018_07_18/model.tflite \
    --output_format=TFLITE \
    --input_arrays=normalized_input_image_tensor \
    --input_shapes=1,300,300,3 \
    --inference_type=QUANTIZED_UINT8 \
    --mean_values=128 \
    --std_dev_values=127 \
    --output_arrays="TFLite_Detection_PostProcess,TFLite_Detection_PostProcess:1,TFLite_Detection_PostProcess:2,TFLite_Detection_PostProcess:3" \
    --allow_custom_ops

