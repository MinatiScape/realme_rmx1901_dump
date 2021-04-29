#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:e42463b07747655a3feaf5c6e8a6b5b957e312ec; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:83f76f504b40109a7b0d5c1a359dba692cd05364 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:e42463b07747655a3feaf5c6e8a6b5b957e312ec && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
