You are at the first step.
Next step: [Before imaging](Disk_Imaging/disk_imaging_2.md).

# 1. Choosing an imaging strategy

There are two category options for reformatting: A. making a disk image
or B. performing a logical (file) transfer. Your specific imaging
strategy will differ depending on the type of media you have and the
kind of reformatting you want to do.

### Note on high-risk data

Whether performing a disk image or logical transfer, be aware that
high-risk data may be present in your computer media. High-risk data
(such as Social Security Numbers and other personally identifiable
information) needs to be stored on a secure server rated for this kind
of data. We make the assumption that all computer media potentially
holds high-risk data and must be reviewed before being moved to our
long-term preservation repository. High-risk data review is a separate
workflow from imaging.

## A. Disk image

The BDPL usually creates disk images of computer media.
This approach ensures a bit-for-bit copy of the data on legacy media that comes through the lab.
Disk images are useful for cases when the media has been actively used
and reused over its lifespan, is complex or interactive, formatted in a
legacy filesystem, and/or old or fragile enough that this read may be
its last.

For most types of computer media, the BDPL makes a raw disk image, which is a bit-for-bit copy of
  all of the data (physical and logical) on the original computer media.

  - **FTK Imager** is a free Windows utility that produces the raw image along with a sidecar log and filelist.

  - Examples of media imaged using this strategy:

    - **Hard drives**

    - **Thumb drives**

    - **Zip disks**

For some types of computer media, we use other hardware and software:

- **Floppy disks** should be imaged with the **KryoFlux**, a physical
  card developed by the Software Preservation Society that can read a
  wide range of magnetic encodings at a very low level.

- **Optical media** should be imaged as a logical (“user data”) disk
  image. This type of disk image can be mounted in both modern and
  emulation environments, while raw disk images of optical media may
  only mount in forensic software.

  - **IsoBuster** is a free or low-cost (Pro) Windows utility that
    produces a single ISO file and sidecar files.
        - IsoBuster is preferred over FTK Imager as the latter creates segmented logical disk images, which are difficult to use in emulation environments.

  - Optical discs with exclusively audio (CD-DA) or video (DVD-Video) content
    should go to the Stanford Media Preservation Lab for imaging.

## B. Logical transfer

In some cases, it is not useful or possible to retain the extra
storage space and forensic evidence of a disk image. For example, the
donor may choose to copy finished projects to a newly-bought hard drive,
or upload selected files to Dropbox. Other times, the original piece of
media is in good shape and holds a small number of files in a simple
directory structure with plenty of empty space.

“Logical transfers” are transfers of just the files selected by the
donor. Unlike disk images, file transfers must be performed on an operating
  system that supports the filesystem stored on the media (or with
  software that allows mounting incompatible filesystems).

  - Managed file transfer tools help us transfer a sound copy of the files:
       - **rsync** on Mac or Linux
       - **TeraCopy** on Windows
  - Once transfer is complete, we bag our files using the **[BagIt specification](https://tools.ietf.org/html/draft-kunze-bagit-17)**.
      - BagIt was created by the Library of Congress to ensure fixity over time.

For more discussion, 
the Digital Archival traNsfer, iNgest, and packagiNg Group has written an
[extensive resource on disk imaging and logical transfers](https://dannng.github.io/disk-imaging-decision-factors.html).

## Options
1.  I have a **hard drive, flash drive, or Zip disk** and I want to make
    a **disk image**: -&gt; [Disk imaging a physical drive in FTK Imager](Disk_Imaging/disk_imaging_3_1_ftkimager.md)
2.  I have an **optical disc** (a CD or DVD) and I want to make a **disk
    image**: -&gt; [Disk imaging a logical device in IsoBuster](Disk_Imaging/disk_imaging_3_2_isobuster.md)
3.  I have a **floppy disk** (3.5” or 5.25”) and I want to make a **disk
    image**: -&gt; [Disk imaging a floppy disk using the KryoFlux](Disk_Imaging/disk_imaging_3_3_kryoflux.md)
4.  I have **any kind of media** and I want to perform a **file transfer on a Mac**: -&gt; [Performing a file transfer on Mac using rsync](Disk_Imaging/disk_imaging_3_4_rsync.md)
5.  I have **any kind of media** and I want to perform a **file transfer on Windows**: -&gt; [Performing a file transfer on Windows using TeraCopy](Disk_Imaging/disk_imaging_3_5_teracopy.md)
