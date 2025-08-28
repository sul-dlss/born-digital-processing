Previous step: [Before imaging](Disk_Imaging/disk_imaging_2.md).
Next step: [After imaging](Disk_Imaging/disk_imaging_4.md).

# Imaging 3.1: Disk imaging a physical drive in FTK Imager

### Requirements

- Windows computer

- Write blocker (see “[Write blocking](#write-blocking)”)

- [FTK Imager](https://www.exterro.com/downloads/search-results?q=&category=64914)
  installed (free download from the Exterro website)

  - Admin access to your computer is required to launch FTK Imager
  
### Results

- Single or multipart raw disk image at 2352 bytes/sector,
        suitable for mounting in forensic programs.
    - Multipart disk images may be concatenated together into a
            single disk image to mount in emulation programs, legacy, or
            modern hardware.

- Disk image extension: .001

    - If multipart, the following disk images will have extensions
            of .002, .003, etc.

## Directions

1.  Launch FTK Imager with administrator permissions.

2.  In the FTK Imager menu, select: File → Create Disk Image.

3.  Select “Physical Drive” from the radio buttons and click “Next.”

    1.  Allow for a delay for FTK to query and list the attached drives.

4.  Identify your drive from the drop-down list based on manufacturer
    information and size. Select your drive, then click “Finish” at the bottom
    of the window.

5.  *Create Image* dialog box: Click the “Add…” button to select where
    you want to store the image.

6.  *Select Image Type* dialog box*:* Select “Raw (dd)” from the radio
    buttons and click “Next.”

7.  *Evidence Item Information* dialog box: Fill in the fields as
    follows, and then click “Next."

    1.  Case Number: Collection and accession number, e.g.
        M1851\_2019-214

    2.  Evidence Number: Source ID of computer media, e.g. CM0024

    3.  Unique Description: Full source ID, e.g. M1851\_2019-214\_CM0024

        *  You will reuse this as your filename in the next window.

    4.  Examiner: Your name

8.  *Select Image Destination* dialog box: Click “Browse.”

    1.  In the pop-up file browser, browse to the directory where you
        want your disk image to go.

    2.  After selecting your image destination, input the image filename
        (no extension) in the second box.

    3.  Check your settings for:

        *  Image Fragment Size (should be 1500)

        *  Compression (should be 0)

        *  AD Encryption (should not be selected)

    4.  Click “Finish.”

9.  *Create Image* dialog box:

    1.  Check all boxes:

        *  ✅ Verify images after they are created

        *  ✅ Precalculate progress statistics

        *  ✅ Create directory listings of all files in the image after
            they are created

    2.  Click “Start” to begin the imaging process.

10. During the imaging process:

    1.  The imaging progress can generally run unsupervised, but at certain points, if progress
        stalls, you may have to cancel the imaging process. This threshold will
        vary based on the size of the disk. For example:

        *  100 MB Zip disks should generally take only 2-3 minutes per
            disk to image and verify; if imaging stalls for longer than
            10 minutes, cancel the imaging process.

        *  A 2 TB drive will often take a day of imaging and a day of
            verifying the image. Let larger drives run overnight (it's
            best to begin imaging towards the end of the day if
            possible, to keep the computer free for other imaging work).
            If imaging hangs overnight, cancel the imaging process.

    2.  If you cancel the imaging process, record “Fail” in the “Imaging
        Success?” column of the imaging log.

        *  Make a note of the conditions of failure in the “Notes”
            column, e.g.: “Imaging stalled halfway through process and
            froze FTK Imager.”

11. After imaging:

    1.  A window will pop up with a report on the imaging process.
        Verify that the imaging was successful via this window:

        *  *MD5 Hash* and *SHA1 Hash*: Should each report “Match” in
            the “Verify result” field

        *  *Bad Blocks List*: Should report “No bad blocks found in
            image”

    2.  If there were hash mismatches or bad sectors, record “Partial
        pass” in the “Imaging Success?” column of the imaging log. Make
        a note of the bad sectors in the “Notes” column.

    3.  If there were no bad sectors, record “Pass” in the “Imaging
        Success?” column of the imaging log.
        
    4.  Proceed to [Quality Control](Disk_Imaging/disk_imaging_4.md#quality-control-of-your-disk-image).

### Note on imaging encrypted drives

If any computer media are encrypted, contact the
curator for the decryption key and the name of the software used to
encrypt the drive. The BDPL does not image encrypted drives to which we
do not know the password.

For drives where we do know the password: Encrypted drives can’t be imaged in decrypted mode when they are
attached to the computer via a writeblocker. To image encrypted drives
with a writeblocker, follow the same disk imaging workflow to image the
drive in encrypted format. Once the drive is imaged:

1.  Open FTK Imager.

2.  Open the image in FTK Imager (following the directions for quality
    control below).

3.  Right click on the image in the FTK Imager evidence pane and click
    "Image Mounting..."

4.  Mount the image to the next available drive. (Mount method=Read
    only)

5.  Once image is mounted, decrypt it using encryption key and method
    provided by donor.

    *  Verify that you can navigate through the decrypted drive on the
        machine and when opened in FTK Imager.

6.  Image the now-decrypted drive in FTK Imager.
