## Dependencies

```sh
brew install fish node entr
```

## Triggering the panic

```sh
make panic
```

Wait for the CSS to be compiled. You should see output similar to:

```sh
npx --yes tailwindcss --jit -i temp.css -o app.css -w & \
        echo temp.css | entr -s 'echo "New files"'
New files
fish returned exit code 0

warn - You have enabled the JIT engine which is currently in preview.
warn - Preview features are not covered by semver, may introduce breaking changes, and can change at any time.

Rebuilding...
Done in 69ms.
```

**Press <kbd>ctrl</kbd> <kbd>c</kbd>. This should trigger the CPU panic and freeze your Mac device.**

---

#### What I'm experiencing on my M1 MacBook Pro 2020 and M1 Max MacBook Pro 2021:

* System freeze (can't move the mouse, trackpad doesn't click, keyboard does nothing)
* Fans start spinning to maximum speed
* After a few seconds I see a pink screen flash for half a second
* The MacBook restarts automatically
* I see the login screen and I can login and use the device normally again


#### Panic crash report (after system restart)

```swift
panic(cpu 4 caller 0xfffffe001439f634): Kernel data abort. at pc 0xfffffe00140bfee0, lr 0x2392fe0014048f9c (saved state: 0xfffffe3aeda0f740)
      x0:  0xfffffe24e4e15280 x1:  0xfffffe24e4e15280  x2:  0x0000000000000000  x3:  0xfffffe1025c2b4f8
      x4:  0xfffffe24e4d6ff00 x5:  0x0000000000001410  x6:  0x0000000000000001  x7:  0xffffffffffffffff
      x8:  0x0000000000000000 x9:  0x0000000000000000  x10: 0xfffffe24f23bf808  x11: 0xfffffe102833b4d0
      x12: 0xfffffe100e21c000 x13: 0x0000000000003e80  x14: 0x00000000000000c0  x15: 0x0000000000003800
      x16: 0x000002003c0da034 x17: 0x0000000000002abe  x18: 0x0000000000000000  x19: 0xfffffe24f23bf800
      x20: 0xfffffe201d660040 x21: 0xfffffe24e4e15280  x22: 0xfffffe0016d8d000  x23: 0xfffffe2024b5f780
      x24: 0xfffffe0016d8d000 x25: 0x0000000000000017  x26: 0xfffffe0016dbb000  x27: 0xfffffe201d660040
      x28: 0xfffffe0016e01000 fp:  0xfffffe3aeda0fad0  lr:  0x2392fe0014048f9c  sp:  0xfffffe3aeda0fa90
      pc:  0xfffffe00140bfee0 cpsr: 0x00401208         esr: 0x96000006          far: 0x0000000000000018

Debugger message: panic
Memory ID: 0x6
OS release type: User
OS version: 22A400
Kernel version: Darwin Kernel Version 22.1.0: Sun Oct  9 20:15:09 PDT 2022; root:xnu-8792.41.9~2/RELEASE_ARM64_T6000
Fileset Kernelcache UUID: 77E9C3A3ABA03579EA7079CB9A46E811
Kernel UUID: 873931BD-15AF-3C0D-BFC0-8113C998EFC0
Boot session UUID: 456DF110-CC05-4BBE-BC9A-4D9863F1AB49
iBoot version: iBoot-8419.41.10
secure boot?: YES
roots installed: 0
Paniclog version: 14
KernelCache slide: 0x000000000b7a4000
KernelCache base:  0xfffffe00127a8000
Kernel slide:      0x000000000ca04000
Kernel text base:  0xfffffe0013a08000
Kernel text exec slide: 0x000000000caf0000
Kernel text exec base:  0xfffffe0013af4000
mach_absolute_time: 0x5ffda931087
Epoch Time:        sec       usec
  Boot    : 0x637aa438 0x00073d2e
  Sleep   : 0x6383d164 0x000e7660
  Wake    : 0x6383d463 0x000e9e16
  Calendar: 0x6383da48 0x000bf6ca

Zone info:
  Zone map: 0xfffffe1025c04000 - 0xfffffe3025c04000
  . VM    : 0xfffffe1025c04000 - 0xfffffe14f28d0000
  . RO    : 0xfffffe14f28d0000 - 0xfffffe168c268000
  . GEN0  : 0xfffffe168c268000 - 0xfffffe1b58f34000
  . GEN1  : 0xfffffe1b58f34000 - 0xfffffe2025c00000
  . GEN2  : 0xfffffe2025c00000 - 0xfffffe24f28cc000
  . GEN3  : 0xfffffe24f28cc000 - 0xfffffe29bf598000
  . DATA  : 0xfffffe29bf598000 - 0xfffffe3025c04000
  Metadata: 0xfffffe100621c000 - 0xfffffe100e21c000
  Bitmaps : 0xfffffe100e21c000 - 0xfffffe1025bf4000

TPIDRx_ELy = {1: 0xfffffe201d660040  0: 0x0000000000000004  0ro: 0x000000020ce825e0 }
CORE 0 PVH locks held: None
CORE 1 PVH locks held: None
CORE 2 PVH locks held: None
CORE 3 PVH locks held: None
CORE 4 PVH locks held: None
CORE 5 PVH locks held: None
CORE 6 PVH locks held: None
CORE 7 PVH locks held: None
CORE 8 PVH locks held: None
CORE 9 PVH locks held: None
CORE 0: PC=0xfffffe0013b8faf8, LR=0xfffffe0013b8faf8, FP=0xfffffe3aec793f00
CORE 1: PC=0xfffffe0013b8faf8, LR=0xfffffe0013b8faf8, FP=0xfffffe3aed6aff00
CORE 2: PC=0xfffffe0013bd2a84, LR=0xfffffe0013b65f90, FP=0xfffffe3aeba7fd20
CORE 3: PC=0xfffffe0013b8faf8, LR=0xfffffe0013b8faf8, FP=0xfffffe3aeb8dbf00
CORE 4 is the one that panicked. Check the full backtrace for details.
CORE 5: PC=0xfffffe0013b8faf8, LR=0xfffffe0013b8faf8, FP=0xfffffe3aec9d3f00
CORE 6: PC=0xfffffe0013b8faf8, LR=0xfffffe0013b8faf8, FP=0xfffffe854caa3f00
CORE 7: PC=0xfffffe0013b8faf8, LR=0xfffffe0013b8faf8, FP=0xfffffe3aecd57f00
CORE 8: PC=0xfffffe0013b8faf8, LR=0xfffffe0013b8faf8, FP=0xfffffe3aebf03f00
CORE 9: PC=0xfffffe0013b8faf8, LR=0xfffffe0013b8faf8, FP=0xfffffe3aec2bff00
Compressor Info: 0% of compressed pages limit (OK) and 1% of segments limit (OK) with 1 swapfiles and OK swap space
Panicked task 0xfffffe1b5ad59678: 0 pages, 1 threads: pid 7592: node
Panicked thread: 0xfffffe201d660040, backtrace: 0xfffffe3aeda0ee50, tid: 9418477
          lr: 0xfffffe0013b5280c  fp: 0xfffffe3aeda0eec0
          lr: 0xfffffe0013b525b4  fp: 0xfffffe3aeda0ef40
          lr: 0xfffffe0013cb68a8  fp: 0xfffffe3aeda0ef60
          lr: 0xfffffe0013ca7e18  fp: 0xfffffe3aeda0efd0
          lr: 0xfffffe0013ca571c  fp: 0xfffffe3aeda0f090
          lr: 0xfffffe0013afb7f8  fp: 0xfffffe3aeda0f0a0
          lr: 0xfffffe0013b51f3c  fp: 0xfffffe3aeda0f450
          lr: 0xfffffe00143962ac  fp: 0xfffffe3aeda0f470
          lr: 0xfffffe001439f634  fp: 0xfffffe3aeda0f5f0
          lr: 0xfffffe0013ca7c8c  fp: 0xfffffe3aeda0f660
          lr: 0xfffffe0013ca5a74  fp: 0xfffffe3aeda0f720
          lr: 0xfffffe0013afb7f8  fp: 0xfffffe3aeda0f730
          lr: 0xfffffe0014048f9c  fp: 0xfffffe3aeda0fad0
          lr: 0xfffffe0014048f9c  fp: 0xfffffe3aeda0fb50
          lr: 0xfffffe0014049fec  fp: 0xfffffe3aeda0fba0
          lr: 0xfffffe001403698c  fp: 0xfffffe3aeda0fc20
          lr: 0xfffffe0014063eb4  fp: 0xfffffe3aeda0fd30
          lr: 0xfffffe0013bae9a8  fp: 0xfffffe3aeda0fe80
          lr: 0xfffffe0013bb30cc  fp: 0xfffffe3aeda0fec0
          lr: 0xfffffe0013b49688  fp: 0xfffffe3aeda0ff10
          lr: 0xfffffe0013afbd7c  fp: 0xfffffe3aeda0ff20

last started kext at 2804666692240: com.apple.driver.usb.IOUSBHostHIDDevice 1.2 (addr 0xfffffe0012eab3c0, size 6795)
loaded kexts:
com.apple.UVCService    1
com.apple.filesystems.afpfs 11.4
com.apple.nke.asp_tcp   8.3
com.apple.filesystems.autofs    3.0
com.apple.driver.AppleTopCaseHIDEventDriver 6000.22
com.apple.driver.AppleBiometricServices 1
com.apple.driver.CoreKDL    1
com.apple.driver.BCMWLANFirmware4387.Hashstore  1
com.apple.driver.DiskImages.ReadWriteDiskImage  493.0.0
com.apple.driver.DiskImages.UDIFDiskImage   493.0.0
com.apple.driver.DiskImages.RAMBackingStore 493.0.0
com.apple.driver.DiskImages.FileBackingStore    493.0.0
com.apple.driver.SEPHibernation 1
com.apple.driver.AppleUSBDeviceNCM  5.0.0
com.apple.driver.AppleThunderboltIP 4.0.3
com.apple.driver.AppleFileSystemDriver  3.0.1
com.apple.nke.l2tp  1.9
com.apple.filesystems.tmpfs 1
com.apple.AppleEmbeddedSimpleSPINORFlasher  1
com.apple.filesystems.nfs   1
com.apple.filesystems.lifs  1
com.apple.filesystems.apfs  2142.41.2
com.apple.IOTextEncryptionFamily    1.0.0
com.apple.filesystems.hfs.kext  627.40.1
com.apple.security.BootPolicy   1
com.apple.BootCache 40
com.apple.AppleFSCompression.AppleFSCompressionTypeZlib 1.0.0
com.apple.AppleFSCompression.AppleFSCompressionTypeDataless 1.0.0d1
com.apple.driver.AppleSmartIO2  1
com.apple.driver.ApplePMP   1
com.apple.driver.AppleCS42L84Audio  600.99
com.apple.driver.AppleSN012776Amp   600.99
com.apple.driver.AppleT6000SOCTuner 1
com.apple.driver.AppleT6000CLPCv3   1
com.apple.driver.AppleSmartBatteryManager   161.0.0
com.apple.driver.AppleALSColorSensor    1.0.0d1
com.apple.driver.AppleAOPVoiceTrigger   200.4
com.apple.driver.ApplePMPFirmware   1
com.apple.driver.AppleSPMIPMU   1.0.1
com.apple.driver.AppleDPDisplayTCON 1
com.apple.driver.AppleInterruptControllerV2 1.0.0d1
com.apple.driver.AppleMobileDispT600X-DCP   140.0
com.apple.driver.AppleMCDP29XXUpdateSupport 1
com.apple.AGXG13X   227.2.40
com.apple.driver.AppleSamsungSerial 1.0.0d1
com.apple.driver.AppleSerialShim    1
com.apple.driver.AppleS8000DWI  1.0.0d1
com.apple.driver.AppleT6001PMGR 1
com.apple.driver.AppleS8000AES  1
com.apple.driver.AppleS5L8960XNCO   1
com.apple.driver.AppleEventLogHandler   1
com.apple.driver.AppleProResHW  225.8.0
com.apple.driver.AppleJPEGDriver    5.2.6
com.apple.driver.AppleAVE2  630.29.1
com.apple.driver.AppleAVD   616
com.apple.driver.AppleM68Buttons    1.0.0d1
com.apple.driver.usb.AppleSynopsysUSB40XHCI 1
com.apple.driver.AppleSDXC  3.3.0
com.apple.driver.AppleT8110DART 1
com.apple.driver.AppleBluetoothModule   1
com.apple.driver.AppleBCMWLANBusInterfacePCIe   1
com.apple.driver.AppleS5L8920XPWM   1.0.0d1
com.apple.driver.AudioDMAController-T600x   200.21
com.apple.driver.AppleT6000DART 1
com.apple.driver.AppleSPIMC 1
com.apple.driver.AppleS5L8940XI2C   1.0.0d2
com.apple.driver.AppleT6000 1
com.apple.iokit.IOUserEthernet  1.0.1
com.apple.driver.usb.AppleUSBUserHCI    1
com.apple.iokit.IOKitRegistryCompatibility  1
com.apple.iokit.EndpointSecurity    1
com.apple.driver.AppleDiskImages2   198.40.3
com.apple.AppleSystemPolicy 2.0.0
com.apple.nke.applicationfirewall   403
com.apple.kec.InvalidateHmac    1
com.apple.kec.Compression   1
com.apple.kec.AppleEncryptedArchive 1
com.apple.driver.usb.IOUSBHostHIDDevice 1.2
com.apple.driver.usb.cdc    5.0.0
com.apple.driver.AppleUSBAudio  500.2
com.apple.iokit.IOAudioFamily   400.3
com.apple.vecLib.kext   1.2.0
com.apple.security.SecureRemotePassword 1.0
com.apple.driver.driverkit.serial   6.0.0
com.apple.iokit.IOAVBFamily 1100.24
com.apple.plugin.IOgPTPPlugin   1110.13
com.apple.driver.AppleHIDKeyboard   231
com.apple.driver.AppleHSBluetoothDriver 6000.22
com.apple.driver.IOBluetoothHIDDriver   9.0.0
com.apple.driver.AppleActuatorDriver    6400.44
com.apple.driver.AppleMultitouchDriver  6400.44
com.apple.driver.AppleMesaSEPDriver 100.99
com.apple.iokit.IOBiometricFamily   1
com.apple.driver.DiskImages.KernelBacked    493.0.0
com.apple.driver.AppleSEPHDCPManager    1.0.1
com.apple.driver.AppleTrustedAccessory  1
com.apple.iokit.AppleSEPGenericTransfer 1
com.apple.driver.usb.networking 5.0.0
com.apple.driver.AppleXsanScheme    3
com.apple.driver.AppleThunderboltPCIDownAdapter 4.1.1
com.apple.driver.AppleThunderboltUSBDownAdapter 1.0.4
com.apple.driver.AppleThunderboltDPInAdapter    8.5.1
com.apple.driver.AppleThunderboltDPAdapterFamily    8.5.1
com.apple.nke.ppp   1.9
com.apple.driver.AppleConvergedIPCOLYBTControl  1
com.apple.driver.AppleConvergedPCI  1
com.apple.driver.AppleBluetoothDebug    1
com.apple.driver.AppleDiagnosticDataAccessReadOnly  1.0.0
com.apple.driver.AppleBTM   1.0.1
com.apple.driver.AppleBSDKextStarter    3
com.apple.kext.triggers 1.0
com.apple.driver.IOHIDPowerSource   1
com.apple.filesystems.hfs.encodings.kext    1
com.apple.driver.AppleSyntheticGameController   10.2.9
com.apple.driver.AppleHIDTransportSPI   6400.40
com.apple.driver.AppleHIDTransport  6400.40
com.apple.driver.AppleInputDeviceSupport    6400.40
com.apple.driver.AppleDCPDPTXProxy  1.0.0
com.apple.driver.DCPDPFamilyProxy   1
com.apple.driver.AppleCSEmbeddedAudio   600.99
com.apple.driver.ApplePassthroughPPM    3.0
com.apple.driver.DCPAVFamilyProxy   1
com.apple.driver.AppleAOPAudio  200.45
com.apple.driver.AppleEmbeddedAudio 600.99
com.apple.iokit.AppleARMIISAudio    200.8
com.apple.AGXFirmwareKextG13XRTBuddy    227.2.40
com.apple.AGXFirmwareKextRTBuddy64  227.2.40
com.apple.driver.AppleSPU   1
com.apple.iokit.IONVMeFamily    2.1.0
com.apple.driver.AppleNANDConfigAccess  1.0.0
com.apple.driver.AppleDialogPMU 1.0.1
com.apple.driver.AppleStockholmControl  1.0.0
com.apple.iokit.IOMobileGraphicsFamily-DCP  343.0.0
com.apple.iokit.IOMobileGraphicsFamily  343.0.0
com.apple.driver.AppleHPM   3.4.4
com.apple.iokit.IOGPUFamily 65.0.22
com.apple.driver.AppleDCP   1
com.apple.driver.AppleFirmwareKit   1
com.apple.driver.AppleSART  1
com.apple.driver.ApplePMGR  1
com.apple.driver.AppleARMWatchdogTimer  1
com.apple.driver.AppleT6000TypeCPhy 1
com.apple.driver.AppleT8103TypeCPhy 1
com.apple.driver.AppleUSBXDCIARM    1.0
com.apple.driver.AppleUSBXDCI   1.0
com.apple.iokit.IOUSBDeviceFamily   2.0.0
com.apple.driver.usb.AppleSynopsysUSBXHCI   1
com.apple.driver.usb.AppleUSBXHCI   1.2
com.apple.driver.AppleEmbeddedUSBHost   1
com.apple.driver.usb.AppleUSBHub    1.2
com.apple.driver.usb.AppleUSBHostCompositeDevice    1.2
com.apple.driver.AppleSPMI  1.0.1
com.apple.driver.AppleDisplayCrossbar   1.0.0
com.apple.iokit.IODisplayPortFamily 1.0.0
com.apple.driver.AppleTypeCPhy  1
com.apple.driver.AppleThunderboltNHI    7.2.81
com.apple.driver.AppleT6000PCIeC    1
com.apple.iokit.IOThunderboltFamily 9.3.3
com.apple.driver.ApplePIODMA    1
com.apple.driver.AppleT600xPCIe 1
com.apple.driver.AppleMultiFunctionManager  1
com.apple.driver.AppleBluetoothDebugService 1
com.apple.driver.AppleBCMWLANCore   1.0.0
com.apple.iokit.IO80211Family   1200.13.0
com.apple.driver.IOImageLoader  1.0.0
com.apple.driver.AppleOLYHAL    1
com.apple.driver.corecapture    1.0.4
com.apple.driver.AppleEmbeddedPCIE  1
com.apple.driver.AppleMCA2-T600x    701.14
com.apple.driver.AppleEmbeddedAudioLibs 200.5
com.apple.driver.AppleFirmwareUpdateKext    1
com.apple.driver.AppleH13CameraInterface    7.110.1
com.apple.driver.AppleH10PearlCameraInterface   17.0.8
com.apple.driver.AppleGPIOICController  1.0.2
com.apple.driver.AppleFireStormErrorHandler 1
com.apple.driver.AppleMobileApNonce 1
com.apple.driver.usb.AppleUSBHostPacketFilter   1.0
com.apple.iokit.IOTimeSyncFamily    1110.13
com.apple.driver.DiskImages 493.0.0
com.apple.iokit.IOGraphicsFamily    597
com.apple.iokit.IOBluetoothSerialManager    9.0.0
com.apple.iokit.IOBluetoothHostControllerUSBTransport   9.0.0
com.apple.iokit.IOBluetoothHostControllerUARTTransport  9.0.0
com.apple.iokit.IOBluetoothHostControllerTransport  9.0.0
com.apple.driver.IOBluetoothHostControllerPCIeTransport 9.0.0
com.apple.iokit.IOBluetoothFamily   9.0.0
com.apple.iokit.CSRBluetoothHostControllerUSBTransport  9.0.0
com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport 9.0.0
com.apple.driver.AppleSSE   1.0
com.apple.driver.AppleSEPKeyStore   2
com.apple.driver.AppleUSBTDM    547
com.apple.iokit.IOUSBMassStorageDriver  232
com.apple.iokit.IOPCIFamily 2.9
com.apple.iokit.IOSCSIBlockCommandsDevice   476
com.apple.iokit.IOSCSIArchitectureModelFamily   476
com.apple.driver.AppleRSMChannel    1
com.apple.iokit.IORSMFamily 1
com.apple.driver.AppleIPAppender    1.0
com.apple.driver.AppleFDEKeyStore   28.30
com.apple.driver.AppleEffaceableStorage 1.0
com.apple.driver.AppleCredentialManager 1.0
com.apple.driver.KernelRelayHost    1
com.apple.iokit.IOUSBHostFamily 1.2
com.apple.driver.AppleUSBHostMergeProperties    1.2
com.apple.driver.usb.AppleUSBCommon 1.0
com.apple.driver.AppleSMC   3.1.9
com.apple.driver.RTBuddy    1.0.0
com.apple.driver.AppleEmbeddedTempSensor    1.0.0
com.apple.driver.AppleARMPMU    1.0
com.apple.iokit.IOAccessoryManager  1.0.0
com.apple.driver.AppleOnboardSerial 1.0
com.apple.iokit.IOSkywalkFamily 1.0
com.apple.driver.mDNSOffloadUserClient  1.0.1b8
com.apple.iokit.IONetworkingFamily  3.4
com.apple.iokit.IOSerialFamily  11
com.apple.driver.AppleSEPManager    1.0.1
com.apple.driver.AppleA7IOP 1.0.2
com.apple.driver.IOSlaveProcessor   1
com.apple.driver.AppleBiometricSensor   2
com.apple.iokit.IOHIDFamily 2.0.0
com.apple.driver.AppleANELoadBalancer   6.101.2
com.apple.driver.AppleH11ANEInterface   6.101.1
com.apple.AUC   1.0
com.apple.iokit.IOAVFamily  1.0.0
com.apple.iokit.IOHDCPFamily    1.0.0
com.apple.iokit.IOCECFamily 1
com.apple.iokit.IOAudio2Family  1.0
com.apple.driver.AppleIISController 200.2
com.apple.driver.AppleAudioClockLibs    200.5
com.apple.driver.AppleM2ScalerCSCDriver 265.0.0
com.apple.iokit.IOSurface   334.0.1
com.apple.driver.IODARTFamily   1
com.apple.driver.FairPlayIOKit  68.19.0
com.apple.driver.AppleARMPlatform   1.0.2
com.apple.iokit.IOSlowAdaptiveClockingFamily    1.0.0
com.apple.iokit.IOReportFamily  47
com.apple.security.quarantine   4
com.apple.security.sandbox  300.0
com.apple.iokit.IOStorageFamily 2.1
com.apple.kext.AppleMatch   1.0.0d1
com.apple.driver.AppleMobileFileIntegrity   1.0.5
com.apple.iokit.CoreAnalyticsFamily 1
com.apple.security.AppleImage4  5.0.0
com.apple.kext.CoreTrust    1
com.apple.iokit.IOCryptoAcceleratorFamily   1.0.1
com.apple.kec.pthread   1
com.apple.kec.Libm  1
com.apple.kec.corecrypto    12.0



** Stackshot Succeeded ** Bytes Traced 634248 (Uncompressed 1562048) **
```
