Previous step: [Before imaging](Disk_Imaging/disk_imaging_2.md).
Next step: [After imaging](Disk_Imaging/disk_imaging_4.md).

# Imaging 3.2: Disk imaging a logical device in IsoBuster

**Note:** The BDPL only images optical discs if they are **data discs**
that contain files. CDs that contain audio streams (CD-DAs) and authored
DVDs (DVD-Video) are sent to SMPL for reformatting.

### Requirements

- Windows computer

- [IsoBuster](https://www.isobuster.com/) installed (free
  download from the IsoBuster website)

  - Admin access to your computer is required to launch IsoBuster

  - The BDPL sometimes has seats on an IsoBuster Pro license, and/or can
    purchase one on your behalf if you need access. Contact BDPL staff
    for more information.

- Optical disk drive

### Results

- Single logical disk image of 2048 bytes/sector, suitable
        for emulation, for mounting in forensic programs, and for
        mounting on legacy or modern hardware.

- Disk image extension: .iso

## Directions

1.  Insert disc into computer’s optical drive.

2.  Open IsoBuster.

3.  Select the disc drive you are using in the drop-down menu at the top
    left corner of the program. 

4.  Click on the top level “DVD” directory. The “DVD” directory must be
    active (highlighted) before you begin imaging, as it represents the
    full contents of the disc. (If you image with the “Session,”
    “Track,” or one of the filesystem levels active, you will only
    capture partial contents of the disc.)  

<img src="./assets/disk_imaging_images_003.png" style="width:25%"/>

1.  Once the “DVD” directory is active, click on File -&gt; DVD -&gt;
    Extract DVD &lt;Image&gt; -&gt; User Data (\*.tao, \*.iso,
    \*.img).

2.  Browse to the directory where you want
    your disk image to go. Name the file according to your disc's source
    ID. Press “Save” and wait for the image to finish extracting.

3. During the imaging process:
    1. The imaging progress can generally run unsupervised, but if progress stalls, you may have to cancel the imaging process. If the imaging process is projected to take longer than
    15-20 minutes to complete, eject the disc and try cleaning or resurfacing the
    disc. Contact the BDPL for best practices on cleaning or resurfacing instructions.
    2.  If you cancel the imaging process, record “Fail” in the “Imaging
        Success?” column of the imaging log.

        *  Make a note of the conditions of failure in the “Notes”
            column, e.g.: “Imaging stalled halfway through process and
            froze FTK Imager.”

4. After imaging:
    1.  A window will pop up with a report on the imaging process.
        Verify that the imaging was successful via this window.

    2. If there were errors, record “Partial
        pass” in the “Imaging Success?” column of the imaging log. Make
        a note of the bad sectors in the “Notes” column.

    3.  If there were no bad sectors, record “Pass” in the “Imaging
        Success?” column of the imaging log.
    
    4.  Proceed to [Quality Control](Disk_Imaging/disk_imaging_4.md#quality-control-of-your-disk-image).

### Generating a filelist using IsoBuster

1.  While the disc is in the optical drive, navigate in IsoBuster down
    to the filesystem level (usually nested under "Track 01").

    *  Optical media hold multiple filesystems that point to the same
        underlying data. IsoBuster indicates these filesystems with
        icons (see [this page on the IsoBuster website](https://www.isobuster.com/help/file_systems) for a key). Filesystems were designed at different levels of detail
        (lower detail often meant more interoperability) and for
        different operating systems.

2.  Choose one of the filesystems on the disc to generate a filelist.

    *  While a disk image captures metadata from all filesystems, a filelist must be generated from one filesystem's naming
        protocols.

    *  Choose a filesystem with naming standards that are interoperable and
        detailed. Common filesystems in order from most preferred to least: UDF,
        Joliet, ISO 9660, HFS+ (will generate a readable text filelist
        even though it is Mac-only), HFS.

3.  Right-click on your selected filesystem -&gt; "Generate list /
    report" -&gt; "List files and folders (in File)" -&gt; "LBA, Time
    and Date, Size, Full Path."
    * This will generate a comma-separated
    text file with a filelist.

4.  Name the file according to the disc's source ID and save it in the same directory as the other disk image
    files.
