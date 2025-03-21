build-toolchain:
	GITHUB_ACTIONS=false CARGO_TARGET_riscv64ima_jolt_zkvm_elf_RUSTFLAGS="-Cpasses=lower-atomic" ./x build
	GITHUB_ACTIONS=false CARGO_TARGET_riscv64ima_jolt_zkvm_elf_RUSTFLAGS="-Cpasses=lower-atomic" ./x build --stage 2

install-toolchain:
	rustup toolchain link riscv64ima-jolt-zkvm-elf build/host/stage2

build-install-toolchain:
	make build-toolchain
	make install-toolchain

archive:
	tar -czvf toolchain.tar.gz build/host/stage2
