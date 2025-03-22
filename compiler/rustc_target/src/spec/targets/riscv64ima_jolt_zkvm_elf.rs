use crate::spec::{Cc, LinkerFlavor, Lld, PanicStrategy, RelocModel};
use crate::spec::{Target, TargetOptions};

pub fn target() -> Target {
    Target {
        data_layout: "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128".into(),
        llvm_target: "riscv64".into(),
        pointer_width: 64,
        arch: "riscv64".into(),

        metadata: crate::spec::TargetMetadata {
            description: None,
            tier: None,
            host_tools: None,
            std: None,
        },

        options: TargetOptions {
            os: "zkvm".into(),
            vendor: "jolt".into(),
            linker_flavor: LinkerFlavor::Gnu(Cc::No, Lld::Yes),
            linker: Some("rust-lld".into()),
            code_model: Some(CodeModel::Medium),
            cpu: "generic-rv64".into(),
            llvm_abiname: "lp64".into(),
            features: "+m,+a".into(),
            max_atomic_width: Some(64),
            atomic_cas: true,
            executables: true,
            panic_strategy: PanicStrategy::Abort,
            relocation_model: RelocModel::Static,
            emit_debug_gdb_scripts: false,
            eh_frame_header: false,
            singlethread: true,
            supports_stack_protector: false,
            ..Default::default()
        },
    }
}
