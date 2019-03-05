---
id: 7
title: 'Laptop sous Linux : gestion de l&rsquo;énergie'
date: 2017-02-14 12:29:34.000000000 +00:00
author: cedric
layout: post

guid: https://cedric.io/2017/02/14/debian-laptop-tlp.html
permalink: "/2017/02/14/laptop-sous-linux-gestion-de-lenergie/"
wp_crosspost_destination:
- akyrho.wordpress.com
wordpress_post_id:
- '279'
categories:
- Non classé
---
<code class="highlighter-rouge">tlp</code> est un outil en ligne de commande qui va se charger d’optimiser au mieux les paramètres de votre système dans le but de réduire la consommation de la batterie.

### Installation {#installation}

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>sudo apt-get install tlp
</code></pre>
  </div>
</div>

Dans mon cas, sur [mon Lenovo Thinkpad](/blog/2017/02/14/debian-8-jessie-lenovo-t420s/), j’ai également installé les paquets suivants :

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>sudo apt-get install tp-smapi-dkms acpi-call-dkms
</code></pre>
  </div>
</div>

### Utilisation {#utilisation}

La commande <code class="highlighter-rouge">tlp-stat</code> renvoie une série d’information sur l’état de votre machine.

<div class="highlighter-rouge">
  <div class="highlight">
    <pre class="highlight"><code>&lt;span class="gd">--- TLP 0.9 --------------------------------------------
&lt;/span>
&lt;span class="gi">+++ Configured Settings: /etc/default/tlp
&lt;/span>TLP_ENABLE=1
TLP_DEFAULT_MODE=AC
DISK_IDLE_SECS_ON_AC=0
DISK_IDLE_SECS_ON_BAT=2
MAX_LOST_WORK_SECS_ON_AC=15
MAX_LOST_WORK_SECS_ON_BAT=60
SCHED_POWERSAVE_ON_AC=0
SCHED_POWERSAVE_ON_BAT=1
NMI_WATCHDOG=0
ENERGY_PERF_POLICY_ON_AC=performance
ENERGY_PERF_POLICY_ON_BAT=powersave
DISK_DEVICES="sda sdb"
DISK_APM_LEVEL_ON_AC="254 254"
DISK_APM_LEVEL_ON_BAT="128 128"
SATA_LINKPWR_ON_AC=max_performance
SATA_LINKPWR_ON_BAT=min_power
AHCI_RUNTIME_PM_TIMEOUT=15
PCIE_ASPM_ON_AC=performance
PCIE_ASPM_ON_BAT=powersave
RADEON_POWER_PROFILE_ON_AC=high
RADEON_POWER_PROFILE_ON_BAT=low
RADEON_DPM_STATE_ON_AC=performance
RADEON_DPM_STATE_ON_BAT=battery
RADEON_DPM_PERF_LEVEL_ON_AC=auto
RADEON_DPM_PERF_LEVEL_ON_BAT=auto
WIFI_PWR_ON_AC=off
WIFI_PWR_ON_BAT=on
WOL_DISABLE=Y
SOUND_POWER_SAVE_ON_AC=0
SOUND_POWER_SAVE_ON_BAT=1
SOUND_POWER_SAVE_CONTROLLER=Y
BAY_POWEROFF_ON_BAT=0
BAY_DEVICE="sr0"
RUNTIME_PM_ON_AC=on
RUNTIME_PM_ON_BAT=auto
RUNTIME_PM_ALL=1
RUNTIME_PM_DRIVER_BLACKLIST="radeon nouveau"
USB_AUTOSUSPEND=1
USB_BLACKLIST_WWAN=1
RESTORE_DEVICE_STATE_ON_STARTUP=0

&lt;span class="gi">+++ System Info
&lt;/span>System         = LENOVO ThinkPad T420s 4174CN5
BIOS           = 8CET50WW (1.30 )
Release        = Debian GNU/Linux 8.7 (jessie)
Kernel         = 3.16.0-4-amd64 #1 SMP Debian 3.16.39-1 (2016-12-30) x86_64
/proc/cmdline  = BOOT_IMAGE=/vmlinuz-3.16.0-4-amd64 root=UUID=9a478dc2-0e42-40d7-b493-914abc99363e ro initrd=/install/gtk/initrd.gz quiet
Init system    = systemd v215
Boot mode      = BIOS (CSM, Legacy)

&lt;span class="gi">+++ TLP Status
&lt;/span>State          = enabled
Last run       = unknown
Mode           = unknown
Power source   = AC

&lt;span class="gi">+++ Processor
&lt;/span>CPU model      = Intel(R) Core(TM) i7-2640M CPU @ 2.80GHz

/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver    = intel_pstate
/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor  = powersave
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq  =   800000 [kHz]
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq  =  3500000 [kHz]

/sys/devices/system/cpu/cpu1/cpufreq/scaling_driver    = intel_pstate
/sys/devices/system/cpu/cpu1/cpufreq/scaling_governor  = powersave
/sys/devices/system/cpu/cpu1/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq  =   800000 [kHz]
/sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq  =  3500000 [kHz]

/sys/devices/system/cpu/cpu2/cpufreq/scaling_driver    = intel_pstate
/sys/devices/system/cpu/cpu2/cpufreq/scaling_governor  = powersave
/sys/devices/system/cpu/cpu2/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq  =   800000 [kHz]
/sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq  =  3500000 [kHz]

/sys/devices/system/cpu/cpu3/cpufreq/scaling_driver    = intel_pstate
/sys/devices/system/cpu/cpu3/cpufreq/scaling_governor  = powersave
/sys/devices/system/cpu/cpu3/cpufreq/scaling_available_governors = performance powersave
/sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq  =   800000 [kHz]
/sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq  =  3500000 [kHz]

/sys/devices/system/cpu/intel_pstate/min_perf_pct      = 22
/sys/devices/system/cpu/intel_pstate/max_perf_pct      = 100
/sys/devices/system/cpu/intel_pstate/no_turbo          = 0
/sys/devices/system/cpu/intel_pstate/turbo_pct         = (not available)
/sys/devices/system/cpu/intel_pstate/num_pstates       = (not available)

x86_energy_perf_policy: program not installed.

/proc/sys/kernel/nmi_watchdog                          = 1

&lt;span class="gi">+++ Undervolting
&lt;/span>PHC kernel not available.

&lt;span class="gi">+++ Temperatures
&lt;/span>CPU temp               =    47 [°C]
/proc/acpi/ibm/fan     =  1956 [/min]

&lt;span class="gi">+++ File System
&lt;/span>/proc/sys/vm/laptop_mode               =     0
/proc/sys/vm/dirty_writeback_centisecs =   500
/proc/sys/vm/dirty_expire_centisecs    =  3000
/proc/sys/vm/dirty_ratio               =    20
/proc/sys/vm/dirty_background_ratio    =    10
/proc/sys/fs/xfs/age_buffer_centisecs  = (not available)
/proc/sys/fs/xfs/xfssyncd_centisecs    = (not available)
/proc/sys/fs/xfs/xfsbufd_centisecs     = (not available)

&lt;span class="gi">+++ Storage Devices
&lt;/span>/dev/sda:
  Model     = SAMSUNG MZ7PA128HMCD-010L1              
  Firmware  = AXM08L1Q
  APM Level = none/disabled
  Status    = active/idle
  TRIM      = supported
  Scheduler = cfq

  Runtime PM: control = on, autosuspend_delay =   -1

  SMART info:
      9 Power_On_Hours            =    17723 [h]
     12 Power_Cycle_Count         =     1510 
    177 Wear_Leveling_Count       =       88 [%]
    178 Used_Rsvd_Blk_Cnt_Chip    =      452 
    179 Used_Rsvd_Blk_Cnt_Tot     =      748 
    180 Unused_Rsvd_Blk_Cnt_Tot   =     3284 
    190 Airflow_Temperature_Cel   =       32 [°C]
    233 Media_Wearout_Indicator   =      199 [%]


&lt;span class="gi">+++ SATA Aggressive Link Power Management
&lt;/span>/sys/class/scsi_host/host0/link_power_management_policy  = max_performance
/sys/class/scsi_host/host1/link_power_management_policy  = max_performance
/sys/class/scsi_host/host2/link_power_management_policy  = max_performance
/sys/class/scsi_host/host3/link_power_management_policy  = max_performance
/sys/class/scsi_host/host4/link_power_management_policy  = max_performance
/sys/class/scsi_host/host5/link_power_management_policy  = max_performance

&lt;span class="gi">+++ AHCI Host Controller Runtime Power Management
&lt;/span>/sys/bus/pci/devices/0000:00:1f.2/ata1/power/control = on
/sys/bus/pci/devices/0000:00:1f.2/ata2/power/control = on
/sys/bus/pci/devices/0000:00:1f.2/ata3/power/control = on
/sys/bus/pci/devices/0000:00:1f.2/ata4/power/control = on
/sys/bus/pci/devices/0000:00:1f.2/ata5/power/control = on
/sys/bus/pci/devices/0000:00:1f.2/ata6/power/control = on

&lt;span class="gi">+++ PCIe Active State Power Management
&lt;/span>/sys/module/pcie_aspm/parameters/policy = default (using bios preferences)

&lt;span class="gi">+++ Intel Graphics
&lt;/span>/sys/module/i915/parameters/powersave        =  1 (enabled)
/sys/module/i915/parameters/enable_rc6       =  1 (enabled)
/sys/module/i915/parameters/enable_dc        = (not available)
/sys/module/i915/parameters/enable_fbc       = -1 (use per-chip default)
/sys/module/i915/parameters/enable_psr       =  0 (disabled)
/sys/module/i915/parameters/lvds_downclock   =  1 (enabled)
/sys/module/i915/parameters/modeset          = -1 (use per-chip default)
/sys/module/i915/parameters/semaphores       = -1 (use per-chip default)

&lt;span class="gi">+++ Wireless
&lt;/span>bluetooth = on
wifi      = on
wwan      = none (no device)

hci0(btusb)                   : bluetooth, not connected
wlan0(iwlwifi)                : wifi, connected, power management = off

&lt;span class="gi">+++ Audio
&lt;/span>/sys/module/snd_hda_intel/parameters/power_save            = 0
/sys/module/snd_hda_intel/parameters/power_save_controller = Y

&lt;span class="gi">+++ Docks and Device Bays
&lt;/span>/sys/devices/platform/dock.0: battery_bay   = no battery 
/sys/devices/platform/dock.1: ata_bay       = drive present

&lt;span class="gi">+++ Runtime Power Management
&lt;/span>Device classes   = all
Device blacklist = (not configured)
Driver blacklist = radeon nouveau

/sys/bus/pci/devices/0000:00:00.0/power/control = on   (0x060000, Host bridge, no driver)
/sys/bus/pci/devices/0000:00:01.0/power/control = on   (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:02.0/power/control = on   (0x030000, VGA compatible controller, i915)
/sys/bus/pci/devices/0000:00:16.0/power/control = on   (0x078000, Communication controller, mei_me)
/sys/bus/pci/devices/0000:00:16.3/power/control = on   (0x070002, Serial controller, serial)
/sys/bus/pci/devices/0000:00:19.0/power/control = on   (0x020000, Ethernet controller, e1000e)
/sys/bus/pci/devices/0000:00:1a.0/power/control = on   (0x0c0320, USB controller, ehci-pci)
/sys/bus/pci/devices/0000:00:1b.0/power/control = on   (0x040300, Audio device, snd_hda_intel)
/sys/bus/pci/devices/0000:00:1c.0/power/control = on   (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1c.1/power/control = on   (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1c.3/power/control = on   (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1c.4/power/control = on   (0x060400, PCI bridge, pcieport)
/sys/bus/pci/devices/0000:00:1d.0/power/control = on   (0x0c0320, USB controller, ehci-pci)
/sys/bus/pci/devices/0000:00:1f.0/power/control = on   (0x060100, ISA bridge, lpc_ich)
/sys/bus/pci/devices/0000:00:1f.2/power/control = on   (0x010601, SATA controller, ahci)
/sys/bus/pci/devices/0000:00:1f.3/power/control = on   (0x0c0500, SMBus, i801_smbus)
/sys/bus/pci/devices/0000:01:00.0/power/control = on   (0x030000, VGA compatible controller, no driver)
/sys/bus/pci/devices/0000:03:00.0/power/control = on   (0x028000, Network controller, iwlwifi)
/sys/bus/pci/devices/0000:05:00.0/power/control = on   (0x088000, System peripheral, sdhci-pci)
/sys/bus/pci/devices/0000:0d:00.0/power/control = on   (0x0c0330, USB controller, xhci_hcd)

&lt;span class="gi">+++ USB
&lt;/span>Autosuspend        = enabled
Device whitelist   = (not configured)
Device blacklist   = (not configured)
WWAN blacklist     = enabled

Bus 004 Device 002 ID 8087:0024 control = auto, autosuspend_delay_ms =     0 -- Intel Corp. Integrated Rate Matching Hub (hub)
Bus 004 Device 001 ID 1d6b:0002 control = auto, autosuspend_delay_ms =     0 -- Linux Foundation 2.0 root hub (hub)
Bus 002 Device 001 ID 1d6b:0003 control = auto, autosuspend_delay_ms =     0 -- Linux Foundation 3.0 root hub (hub)
Bus 001 Device 001 ID 1d6b:0002 control = auto, autosuspend_delay_ms =     0 -- Linux Foundation 2.0 root hub (hub)
Bus 003 Device 004 ID 04f2:b221 control = auto, autosuspend_delay_ms =  2000 -- Chicony Electronics Co., Ltd integrated camera (uvcvideo)
Bus 003 Device 003 ID 0a5c:217f control = on,   autosuspend_delay_ms =  2000 -- Broadcom Corp. BCM2045B (BDC-2.1) (btusb)
Bus 003 Device 002 ID 8087:0024 control = auto, autosuspend_delay_ms =     0 -- Intel Corp. Integrated Rate Matching Hub (hub)
Bus 003 Device 001 ID 1d6b:0002 control = auto, autosuspend_delay_ms =     0 -- Linux Foundation 2.0 root hub (hub)

&lt;span class="gi">+++ ThinkPad Extended Battery Functions
&lt;/span>tp-smapi   = active
tpacpi-bat = active

&lt;span class="gi">+++ ThinkPad Battery Status: BAT0 (Main / Internal)
&lt;/span>/sys/devices/platform/smapi/BAT0/manufacturer               = SANYO
/sys/devices/platform/smapi/BAT0/model                      = 42T4845
/sys/devices/platform/smapi/BAT0/manufacture_date           = 2011-12-30
/sys/devices/platform/smapi/BAT0/first_use_date             = 2012-02-21
/sys/devices/platform/smapi/BAT0/cycle_count                =    278
/sys/devices/platform/smapi/BAT0/design_capacity            =  44000 [mWh]
/sys/devices/platform/smapi/BAT0/last_full_capacity         =  38570 [mWh]
/sys/devices/platform/smapi/BAT0/remaining_capacity         =  38570 [mWh]
/sys/devices/platform/smapi/BAT0/remaining_percent          =    100 [%]
/sys/devices/platform/smapi/BAT0/remaining_running_time_now = not_discharging [min]
/sys/devices/platform/smapi/BAT0/remaining_charging_time    = not_charging [min]
/sys/devices/platform/smapi/BAT0/power_now                  =      0 [mW]
/sys/devices/platform/smapi/BAT0/power_avg                  =      0 [mW]
/sys/devices/platform/smapi/BAT0/state                      = idle

tpacpi-bat.BAT0.startThreshold                              =     96 [%]
tpacpi-bat.BAT0.stopThreshold                               =    100 [%]
tpacpi-bat.BAT0.forceDischarge                              =      0

Charge                                                      =  100.0 [%]
Capacity                                                    =   87.7 [%]


</code></pre>
  </div>
</div>

Loin d’être un expert, je tire deux conclusions de ces données :

  * La capacité de ma batterie reste honorable : 87% de la capacité initiale de 44000mWh est tout a fait acceptable pour une machine qui avait déjà plus de 5 ans lorsque je l’ai achetée
  * La vie de mon SSD n’est pas en danger immédiat (Wear Leveling Count à 88%)