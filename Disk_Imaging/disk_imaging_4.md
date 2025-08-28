Previous step: [Imaging](./disk_imaging_0.md#imaging).
You are at the last step. 🎉

# 4. After imaging

## Quality control of your disk image

Perform QC in a different program than the one you used for imaging.
This will help you understand if the disk image can be interpreted
widely. If disk images behave differently in different forensic
software, note these differences in the “Imaging notes” field of your
disk imaging log. As long as the image can be mounted in one piece of
software, it can pass QC, but it’s important to record which program
that is.

QC is a good point at which to make sure the disk imaging log is filled out for each transfer (see [Updating records](#updating-records) below).

## Directions
### Option 1: Mount disk image in IsoBuster

1.  Open IsoBuster.

2.  Go to File -&gt; Open Image File. Browse to the location of the .iso image file and click “Open.” 

### Option 2: Mount disk image in FTK Imager

1.  Open FTK Imager.

2.  Go to File -&gt; Add Evidence Item.
3. In the pop-up window, select “Image File” and click “Next.”
4. In the next window, click “Browse.” Navigate to the location of your disk image. Select your disk image
    and click “Open.” Back in the Select File dialog box, click “Finish.”
6.  The disk image should open in the “Evidence Tree” window on the left side
    of FTK Imager.
    
### Option 3: Mount DVD-Video in VLC

If you have a DVD-Video, you may also choose to make sure that the DVD
plays properly in VLC.

1.  Navigate to the directory where the disk image is stored.

2.  Right-click on the image you want to test and select “Open with”
    -&gt; “VLC media player.”  

3.  Check to see that the DVD begins playing in VLC. If it does, your
    imaging was successful.

## What to look for during QC
- Click through the filesystems to check that you can navigate
        through all folders and files, and that the contents as
        displayed in IsoBuster match what you’re expecting to see.
        

- If the image does not open or the directory structure is
        unexpected (for example, if there are no files on the disk),
        note this information in the “Notes” field.

- Note that on disks with multiple partitions, data may only be
        present on one partition; do not assume that unused space on one
        partition means the directory is blank.

- To test navigation, click on the plus signs next to partitions
        and folders. You should be able to navigate down to the file
        level.

- Now is also a good time to find information about the filesystem
        present on the disc. It will appear in square brackets at one of
        the top-level nested directories.
        -  Record the filesystem name in the “Filesystem/s” column of
            the imaging log.

## Troubleshooting

-  If you detect issues in QC that weren't apparent during the imaging process, you can:
    - Retry disk imaging
        - If possible, increase the number of read retries
    - Try mounting the disk image in another program
    - Try mounting the live disk and extracting files using a program like FTK Imager or IsoBuster
        - Consider extracting files from the filesystem with naming standards that are most interoperable and
        detailed. Common filesystems in order from most preferred to least: UDF,
        Joliet, ISO 9660, HFS+ (will generate a readable text filelist
        even though it is Mac-only), HFS.
    - Try mounting the live disk and transferring files using [rsync](disk_imaging_3_4_rsync.md) or [TeraCopy](disk_imaging_3_5_teracopy.md).

-  If you cannot get a better result:
    - Document your issues in the disk
    imaging log.
  
## Updating records

The BDPL updates records in the following places:

* Disk imaging log: [Setting up an imaging log](disk_imaging_2.md#setting-up-an-imaging-log).
    - Ensure the disk imaging log is filled out with any important notes about the imaging process.
    - If in IsoBuster, note that IsoBuster indicates filesystem types using icons; see [this page on the IsoBuster website](https://www.isobuster.com/help/file_systems) for a key.
* Jira
    - Close the imaging ticket.
    - Comment with a summary of the materials reformatted, whether they were successful, and leave a link to the imaging log.

Special Collections staff members will use this information to update records in:

- ArchivesSpace ("Capture" event, extent, access)
- FOLIO (extent, access)
- Trello (collection reformatting card)
