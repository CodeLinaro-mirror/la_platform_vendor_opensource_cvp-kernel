load(":eva_module_build.bzl", "create_module_registry")

EVA_KERNEL_ROOT = "cvp-kernel"

eva_modules = create_module_registry([":eva_drivers_headers"])
register_eva_module = eva_modules.register

register_eva_module(
    name = "msm-cvp",
    path = "msm",
    srcs = [
	"cvp/cvp.c",
	"cvp/cvp_core_hfi.c",
	"cvp/cvp_fw_load.c",
	"cvp/hfi_packetization.c",
	"cvp/msm_cvp.c",
	"cvp/msm_cvp_buf.c",
	"cvp/msm_cvp_common.c",
	"cvp/msm_cvp_debug.c",
        "cvp/cvp_dump.c",
	"cvp/msm_cvp_ioctl.c",
	"cvp/msm_cvp_platform.c",
	"cvp/msm_smem.c",
	"cvp/cvp_hfi.c",
	"cvp/hfi_response_handler.c",
	"cvp/msm_cvp_clocks.c",
	"cvp/msm_cvp_core.c",
	"cvp/msm_cvp_dsp.c",
	"cvp/msm_cvp_res_parse.c",
	"cvp/msm_cvp_synx.c",
    ],
    config_deps = {
       "TARGET_SYNX_ENABLE": [
         "//vendor/qcom/opensource/synx-kernel:synx_headers",
           "//vendor/qcom/opensource/synx-kernel:%b_modules"
        ],
	"TARGET_PRESIL_ENABLE": [
            "//vendor/qcom/opensource/camera-kernel:camera_src_headers",
	    "//vendor/qcom/opensource/camera-kernel:%b_camera",
	],
        "TARGET_DSP_ENABLE": [
             "//vendor/qcom/opensource/dsp-kernel:%b_frpc-adsprpc"
        ],
	"TARGET_MMRM_ENABLE": [
             "//vendor/qcom/opensource/mmrm-driver:%b_mmrm_driver"
	],
    },
)
