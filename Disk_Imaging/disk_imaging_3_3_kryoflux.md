Previous step: [Before imaging](disk_imaging_2.md).
Next step: [After imaging](disk_imaging_4.md).

# Imaging 3.3: Disk imaging a floppy disk using the KryoFlux

## Table of contents

* [Requirements](#requirements)
* [Results](#results)
* [Citation](#citation)
* [Before imaging](#beforeimaging)
    * [Starting up](#imaging)
    * [Calibrating the drive](#calibrating-the-drive)
        * [Troubleshooting calibration](#troubleshooting-calibration)
    * [Checking the KryoFlux imaging settings](#checking-the-KryoFlux-imaging-settings)
* [Imaging the floppy disk](#imaging-the-floppy-disk)
* [Interpreting the KryoFlux output](#interpreting-the-KryoFlux-output)
    * [Color coding](#color-coding)
    * [Successful disk images](#successful-disk-images)
    * [Unsuccessful disk images](#unsuccessful-disk-images)
    * [How to troubleshoot an unsuccessful disk image](#how-to-troubleshoot-an-unsuccessful-disk-image)
        * [Canceling the imaging process](#canceling-the-imaging-process)
        * [Applying a different encoding](#applying-a-different-encoding)
        * [Increasing the number of retries](#increasing-the-number-of-retries)

### Requirements

- Windows computer
- [KryoFlux GUI](https://kryoflux.com/?page=download) (free download from the KryoFlux website)
- Physical KryoFlux and floppy drive

### Results
- Single raw disk image at 2352 bytes/sector
- Preservation stream files (low-level proprietary file format
            for each of the sectors found on a floppy disk)

### Citation
The directions here borrow heavily from the [Archivists’ Guide to Kryoflux](https://github.com/archivistsguidetokryoflux/archivists-guide-to-kryoflux/blob/master/1%20PART%20ONE%20Getting%20Started/1.1%20SET-UP%20AND%20INSTALLATION/README.md#114-setting-up-the-kryoflux).
For more detail on any step, please reference that guide. Thank you to its creators and maintainers!

## Before imaging
### Starting up

1.  Connect floppy drive to the KryoFlux (via data cable).
    * The colored stripe of the data cable should be facing left when
        the front of the drive is facing away from you.
2.  Open the KryoFlux Imager. The file that launches the application is
    named kryoflux-ui.jar and is stored in the “dtc” folder within the
    KryoFlux directory.
3.  Connect the floppy drive to the power source.
    * Do not power up the floppy disk drive before this step. The floppy drive is an unstable source of power that can permanently damage the KryoFlux
  board.
5.  Insert a floppy disk into the drive.

### Calibrating the drive

Calibrating the drive checks whether the KryoFlux is communicating and
ready for use. It should be done before every imaging session. You do
not need a disk to calibrate the drive.

1.  Click on the Drive dropdown menu and select the correct drive for your project.
    * Drive 0 typically reads 3.5” floppy disks and Drive 1 reads 5.25” floppy disks.

2.  Click yes on the dialog box that pops up. The KryoFlux should begin calibrating and the floppy drive will make noise.

3.  If the KryoFlux correctly calibrates, it will report this at the
    bottom of the imager (blue box). If there is an error, the red error light will light up (red box).

    <img src="./assets/disk_imaging_images_004.png" style="width:30%"/>

####Troubleshooting calibration

If you keep encountering calirbation errors, check the following:

1.  Is the ribbon cable connected properly?

    1.  Try reversing the orientation of the colored stripe in the
        ribbon cable.

    2.  There are two ports on each ribbon cable for each type of floppy
        drive. Try swapping the data port you’re connected to.

    3.  Try re-seating the ribbon cable at both ends of its connection.

2.  Is the KryoFlux reading the correct drive for your disk?

    2.  Sometimes upon being disconnected and reconnected, the KryoFlux
        switches which drive is associated with which type of disk. Try
        switching the drive the software reads from and re-attempting
        calibration.

3.  Is the KryoFlux driver correctly installed?

    1.  To check this:
        * Open Command Prompt
        * Navigate (using ``cd``) to the ``dtc`` folder, which is stored within the KryoFlux directory
        * Type the following: ```dtc -c2```
        * Press Enter

    2.  If the output of this DTC command is an error message,
        this means the driver is installed correctly (the
        command tried to install the driver, but the driver was
        already there, so DTC returned an error).

    3.  If this command doesn't work at all, you may need to
        reinstall the driver or redirect Windows to the correct
        driver.
        * We frequently encounter the "Bossa Program Port" problem described in [3.1 Why isn’t my computer finding the KryoFlux?](https://github.com/archivistsguidetokryoflux/archivists-guide-to-kryoflux/tree/master/3%20TROUBLESHOOTING#31-why-isnt-my-computer-finding-the-kryoflux) in the Archivists' Guide to KryoFlux, and their solution works for us.

### Checking the KryoFlux imaging settings
If you are using the KryoFlux for the first time on a user account or computer, make sure to follow the directions in “[Write blocking](#/disk_imaging_2.md/D. Setting up your imaging software (once per computer))”

1.  Open the KryoFlux output settings in File -&gt; Settings -&gt; “Output” tab:
    * Set the path for the disk images you
    create.
    * Check the checkbox to create logs: ✅ “Logs”
    * Click "OK."

2.  Back in the main “Control” panel, select the “&lt;Multiple&gt;” option at the bottom of the window.

<img src="./assets/disk_imaging_images_005.png" style="width:30%"/>

3.  A "Select outputs" window will pop up. Set the encoding scheme for the images
    to be created. You can select multiple at once by holding down the ctrl key while you click.
    
    1. The BDPL creates both a disk image and a set of preservation stream files simultaneously. The KryoFlux stream file for preservation is a stream of
            uninterpreted raw data. The disk image is the same
            data, but interpreted according to the encoding scheme you select in this step.

    2.  **For 3.5” floppies:** Select both “KryoFlux stream files,
        preservation” and “MFM sector image.”

        *  The majority of 3.5” floppy disks were encoded
            as MFM, making it efficient to assume the disk is MFM.
        * **Exception:** If the creator was a Mac user, select "Apple DOS 400K/800K Sector Image" instead.

    3.  **For 5.25” floppies:** Select both “KryoFlux stream files,
        preservation” and “1.2MB IBM HD.”

        * Defaulting to the 1.2MB IBM HD encoding scheme will pick up higher-density data on the disk.
        * **Exception:** If the disk packaging indicates the disk is DD (double density), select “360K IBM DD” instead.

If you guess at the wrong encoding, you can re-try a different encoding on the preservation stream files once imaging is complete. For more on encoding schemes, see [2.2 Disk Image Formats](https://github.com/archivistsguidetokryoflux/archivists-guide-to-kryoflux/blob/master/2%20PART%20TWO%20In-Depth/Disk-Image-Formats.md) in the Archivists' Guide to KryoFlux.

## Imaging the floppy disk

1.  Type the filename (without extension) in the “Enter name…” field.

2.  Click “Start” (red box).

3.  Monitor the sector diagrams in the KryoFlux GUI. Each sector is
    represented by a rectangular block. Side 0 and Side 1 represent the
    two sides of a double-sided floppy disk. See ["Interpreting the KryoFlux output"](#interpreting-the-kryoflux-output) for information on how to interpret the GUI output.

<img src="./assets/disk_imaging_images_006.png" style="width:30%"/>

4. After imaging:

    1.  The imaging process is done when the green "Stream" indicator stops flashing.

    2.  If there were red sectors, record “Partial
        pass” in the “Imaging Success?” column of the imaging log. Make
        a note of the bad sectors in the “Notes” column.
            * If there are many red sectors, consider re-imaging the disk and [increasing the number of retries](#increasing-the-number-of-retries).

    3.  If there were no bad sectors, record “Pass” in the “Imaging
        Success?” column of the imaging log.
        
    4.  Proceed to [Quality Control](disk_imaging_4.md#quality-control-of-your-disk-image).

## Interpreting the KryoFlux output

### Color coding

- Blue sectors are in the process of imaging.

- Green sectors have been imaged without errors.

- Orange sectors that say “H” indicate extra data. They are not an
  issue.

- Yellow sectors that say “N” indicate extra metadata. They are not an
  issue.

- Grey sectors have been imaged correctly, but the data is unreadable
  according to the profile selected. Try applying a different encoding
  to the preservation stream files (see below).

- Red sectors have been read and imaged, but with errors. Retry the
  imaging the physical disk (see below).

- Blank (white) sectors have no data at all. You may see all blank
  sectors on side 1 of a single-sided disk.

### Successful disk images

Successful disk images can come in a variety of colors:

- All green, orange, or yellow sectors on one or both sides

  - A couple of silver sectors at the end of the track layout is usually
    not cause for concern

- Mix of green, orange, or yellow sectors on one or both sides

  - Orange and yellow sectors tend to appear at beginning and end of the
    track layout

  - A couple of silver sectors at the end of the track layout is usually
    not cause for concern

- Green, orange, and/or yellow sectors alternating with silver sectors

  - This layout usually indicates that you have a lower-density disk

- All silver or blank sectors on side 1 usually indicates that you have
  a single-sided disk (as long as side 0 was successful)

- If you have retried imaging multiple times and still have a small
  number of red sectors, but the disk image mounts in imaging software,
  this is a "partial pass" - depending on the number of red sectors and
  their location, some but not all files can be extracted without error.

### Unsuccessful disk images

- Entirely silver sectors, or silver sectors in an inconsistent pattern
  (i.e. not alternating with green/orange/yellow sectors)

  - Silver sectors indicate that the selected encoding cannot read the
    data being imaged. (That is, the data is fine but it is not being
    interpreted through the correct encoding structure.) If you can
    identify the correct image encoding, you can usually get a viable
    disk image from the KryoFlux stream files (see [How to troubleshoot an unsuccessful disk image](#how-to-troubleshoot-an-unsuccessful-disk-image)).

- Majority red sectors

  - Red sectors indicate a read error. You will need to retry imaging
    the physical disk (see [How to troubleshoot an unsuccessful disk image](#how-to-troubleshoot-an-unsuccessful-disk-image)).

  - If you have retried imaging multiple times and still have a small
    number of red sectors, but the disk image mounts in imaging
    software, this is a "partial pass" - depending on the number of red
    sectors and their location, some but not all files can be extracted
    without error.

## How to troubleshoot an unsuccessful disk image

### Canceling the imaging process

It is usually best to complete the imaging process:

- Floppy disks are old for computer media; we assume the first read we
  get might be the last.

- Completing the disk imaging process will create valid preservation stream files that allow re-interpretation on a virtual representation of the disk, avoiding the wear of another physical read for both disk and drive.

However, in some cases, you should cancel the imaging process by pressing "Stop" in the KryoFlux GUI to preserve wear and tear on both disks and drives:

  - Disk or drive is making an unpleasant noise (grinding, stuttering, clicking, abnormally loud whirring)

  - Imaging is not progressing and hasn't been for ~5+ minutes

### Applying a different encoding
If you encounter mostly silver sectors, you may be able to create a successful disk image by applying a different encoding to the preservation stream files through "Stream Files" mode. Majority silver sectors indicate that the data is not being interpreted through the correct encoding structure. The KryoFlux stream files are a lower-level read of the disk contents and can be interpreted through multiple different encodings. This process creates a new disk image with a different encoding from the same disk contents.

1.  Go to Drive → Stream files to switch modes.

2.  In the drop-down menu where you select encodings, pick a new one
    to try. Alternate suggested encodings are:

    1.  3.5” floppy: Switch from MFM to Apple 400/800, or vice
        versa.

    2.  5.25” floppy: Switch from 1.2MB IBM to 360K IBM, or vice
        versa.

3.  Change the name of your output disk image to reflect this
    alternate encoding; this will help differentiate multiple disk
    images.

    1.  e.g., M1234\_2025-001\_CM001 →
        M1234\_2025-001\_CM001\_Apple400800K

4.  Click "Start."

    1.  The KryoFlux GUI will launch the file picker.

    2.  Navigate to the folder where your preservation stream files
        for this disk are stored. Make sure to double-click on the
        folder so you end up inside that folder (it will appear
        blank).

5.  Repeat as necessary, trying a range of disk encodings. Consult
    [2.2 Disk Image Formats](https://github.com/archivistsguidetokryoflux/archivists-guide-to-kryoflux/blob/master/2%20PART%20TWO%20In-Depth/Disk-Image-Formats.md)
    in the Archivists' Guide to KryoFlux to help narrow down your
    options based on the disk's era or labeling.

6.  If you continue to encounter entirely silver sectors, consult
    the digital archivist.

### Increasing the number of retries
If you encounter a large number of red sectors, the KryoFlux may be able to re-read those sectors may correctly when given more sector read tries (i.e., attempts to re-read each sector when the KryoFlux encounters
    errors). This process requires re-imaging the physical disk. To increase the number of re-reads:

1. Go to File -&gt; Settings -&gt; Advanced tab:  
    <img src="./assets/disk_imaging_images_007.png" style="width:30%"/>

2.  Uncheck “Default” in the Retries row, and write in a number
    larger than 5 (5 is the default); doubling the retries to 10 is usually a good place to start.

3.  Re-image the disk.

4.  If results improve markedly but some red sectors remains, it may be worth attempting re-imaging multiple times, increasing the number of reads each time. If the results don't appear to improve from 5 to 10 reads per sector, it may not be worth the time tradeoff and the physical wear to re-image the disk, unless it contains content of particular research interest.
