########################################################
# Tensorflow shared library (.so / .dll) for use in 
# in external projects
########################################################
add_library(tf_sharedlib SHARED
    $<TARGET_OBJECTS:tf_core_lib>
    $<TARGET_OBJECTS:tf_core_cpu>
    $<TARGET_OBJECTS:tf_core_framework>
    $<TARGET_OBJECTS:tf_core_ops>
    $<TARGET_OBJECTS:tf_core_direct_session>
    $<$<BOOL:${tensorflow_ENABLE_GRPC_SUPPORT}>:$<TARGET_OBJECTS:tf_core_distributed_runtime>>
    $<TARGET_OBJECTS:tf_core_kernels>
    $<$<BOOL:${tensorflow_ENABLE_GPU}>:$<TARGET_OBJECTS:tf_stream_executor>>
)
target_link_libraries(tf_sharedlib
    ${tf_core_gpu_kernels_lib}
    ${tensorflow_EXTERNAL_LIBRARIES}
    tf_protos_cc
)

set_target_properties(tf_sharedlib PROPERTIES OUTPUT_NAME "tensorflow")
