build-toolchain:
	GITHUB_ACTIONS=false CARGO_TARGET_riscv32im_jolt_zkvm_elf_RUSTFLAGS="-Cpasses=lower-atomic" CARGO_TARGET_riscv64im_jolt_zkvm_elf_RUSTFLAGS="-Cpasses=lower-atomic" ./x build
	GITHUB_ACTIONS=false CARGO_TARGET_riscv32im_jolt_zkvm_elf_RUSTFLAGS="-Cpasses=lower-atomic" CARGO_TARGET_riscv64im_jolt_zkvm_elf_RUSTFLAGS="-Cpasses=lower-atomic" ./x build --stage 2

install-toolchain:
	rustup toolchain link riscv32im-jolt-zkvm-elf build/host/stage2
	rustup toolchain link riscv64im-jolt-zkvm-elf build/host/stage2

build-install-toolchain:
	make build-toolchain
	make install-toolchain

archive:
	tar --exclude "build/host/stage2/lib/rustlib/src" --exclude "build/host/stage2/lib/rustlib/rustc-src" -czvf toolchain.tar.gz build/host/stage2
