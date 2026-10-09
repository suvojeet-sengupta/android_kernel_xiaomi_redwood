# SuvKernel

Kernel for the Xiaomi **redwood** (POCO X5 Pro 5G / Redmi Note 12 Pro Speed),
with KernelSU-Next and SuSFS built in. It is built on top of the
[Vajra kernel](https://github.com/genie1997/android_kernel_xiaomi_redwood) by
genie1997.

`Linux 5.4.302` · `Neutron Clang 24` · `arm64`

## Build

Extract [Neutron Clang](https://github.com/Neutron-Toolchains/clang-build-catalogue)
to `~/toolchains/neutron-clang` (or point `CLANG` at it), then:

```bash
./build.sh
```

The image lands at `out/arch/arm64/boot/Image`.

## Credits

- [Vajra](https://github.com/genie1997/android_kernel_xiaomi_redwood) by genie1997
- [Scarlet](https://github.com/Atom-X-Devs/scarlet_xiaomi_sm7325) by
  Tashfin Shakeer Rhythm (@Tashar02) and Atom-X-Devs
- [KernelSU-Next](https://github.com/KernelSU-Next/KernelSU-Next)
- [SuSFS](https://gitlab.com/simonpunk/susfs4ksu) by simonpunk

## License

GPL-2.0. See `COPYING`.
