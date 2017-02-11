########################################################
# Tensorflow shared library (.so / .dll) for use in 
# in external projects
########################################################
set(tf_c_api_srcs
    "${tensorflow_source_dir}/tensorflow/c/c_api.h" 
    "${tensorflow_source_dir}/tensorflow/c/c_api.cc" 
)

add_library(tf_sharedlib SHARED   
    ${tf_c_api_srcs} 
    $<TARGET_OBJECTS:tf_core_cpu>
    $<TARGET_OBJECTS:tf_core_framework>
    $<TARGET_OBJECTS:tf_core_lib>
    $<TARGET_OBJECTS:tf_core_ops>
    $<TARGET_OBJECTS:tf_cc_framework>
    $<TARGET_OBJECTS:tf_cc_ops>       
)
target_link_libraries(tf_sharedlib   
   ${tensorflow_EXTERNAL_LIBRARIES}             
   tf_protos_cc                                   
)

set_target_properties(tf_sharedlib PROPERTIES OUTPUT_NAME "tensorflow")
set_target_properties(tf_sharedlib PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS true)
