Previous step: [Choosing an imaging strategy](../disk_imaging_1.md).
Next step: [Imaging](././disk_imaging_0.md#imaging).

# 2. Before imaging

Before imaging, ensure your media is write blocked and scanned for viruses, and that a disk imaging log is set up to record imaging work.. If you haven't recently imaged disks with the hardware/software combination you'll be using, you should also ensure that the imaging software you want to use is set up properly.

## Write blocking

Always connect computer media to the computer through a write blocker.
There are multiple ways to ensure your media is write blocked:

- **External write blocker:** Connect your data
  cable to the external write blocker, then connect the write blocker.
- **Internal write blocker (e.g., the FRED):** Connect your data cable directly to the
  built-in write blocker panel. Make sure the write blocker itself is turned on.
    - If you are using a KryoFlux with the FRED, connect through a regular USB port, as connecting through the
    write blocker panel will lead to issues when interfacing with the
    KryoFlux’s hardware write blocker.
- **KryoFlux:** The KryoFlux has a hardware write blocker
  which the BDPL has enabled (see the [KryoFlux manual](https://www.kryoflux.com/download/kryoflux_manual.pdf) for
  more detail).
  - If using a new KryoFlux, be sure to enable write blocking on the
    board itself; this setting is not default.
  - You can also make sure your floppy disks are physically write
    protected:
    - 3.5" floppies: Slide the movable tab in the corner open, so that
      there is a small window through the disk. (See the location of the
      write-protect tab in [this diagram hosted by UNM](https://www.unm.edu/~tbeach/terms/figures/floppy.html).)
    - 5.25" floppies: Cover the write-enable notch on the side of the
      disk. (See the location of the notch in [this Wikimedia Commons image](https://commons.wikimedia.org/wiki/File:Floppy_tabs_3x2.jpg).)
- **Optical disk drive:** Built-in or external optical disk
  drives can be connected directly to the computer. Optical disks cannot be written to
  the same way as other drives (e.g. using flash or solid-state storage,0
  and are effectively write-blocked.

## Virus scan

Perform a virus scan (contact the BDPL for current practices).

## Setting up an imaging log

Make a copy of the template disk imaging log for your own use: [Disk Imaging Log Template](https://docs.google.com/spreadsheets/d/1ztptTaum5HN5J2kLoR3mZOKdUn1hdDg3MCQwhB_Rtpk/edit?gid=0#gid=0).

The processing archivist should label disks with source IDs and transcribe existing labels into an inventory that they submit with a digitization ticket. This information can be transposed into the disk imaging log.

Fill out the fields as disks are imaged. See the “Controlled vocabularies” tab for definitions and frequently used terms.

## Setting up your imaging software (once per computer)

Some global settings should be set before using an imaging software for
the first time on a machine (e.g., the first time it is opened after
installation). Settings that change by project (e.g., location where
files are saved to) should be changed upon project changes and will be incorporated into imaging workflows.

### IsoBuster settings

Global settings should be set before using IsoBuster for the first time
on a new user profile (e.g., the first time it is opened after
installation, or after you log in on a new computer).

Settings are accessed through the “Options” menu. In the IsoBuster
toolbar, click Options -&gt; Communication to launch the menu. Many of
the settings can be left as defaults, but it is important to check the
following:

- **Communication**:
  - Under “Communication”/“Scan Settings”: Select “Normal (One retry,
    block per block).”
- **File system settings**:
  - Under “IFO/VOB”: Select “Size of the full stream, NOT cut into
    smaller files.”
- **Image files**:
  - Uncheck “Split large Image Files to specified size.”
  - In “Select when a cue sheet file will be created,” select “Always
    after a CD, DVD, or BD image is created.”
  - In “Select when an MD5 checksum file will be created,” select
    “Always after a CD, DVD, or BD image is created.”
  - Under “ISO/BIN/TAO”:
    - Check “Default to \*.ISO file extension instead of \*.TAO.”
    - Check “Default to \*.ISO file extension instead of \*.BIN.”

### KryoFlux image profiles

We change the extensions for “MFM sector image” and “Apple DOS 400K/800K sector image” to "001" from the default "img"; you can change the extensions in a text box by going to Settings -> Image Profiles -> (select your image type).

In addition, we use two image profiles for 5.25” floppy disks (1.2MB IBM HD and 360K
IBM DD) that are not automatically included with KryoFlux, so may have
to be created by the archivist. To create a new profile, go to Settings
-&gt; Image Profiles and click “+.” The settings for each profile should
be as follows:

**1.2MB IBM HD:**
<br><img src="../assetss/disk_imaging_images_001.png" style="width:40%" />
<br><br> **360K IBM DD:**
<br><img src="../assetss/disk_imaging_images_002.png" style="width:40%" />

### Installing bagit.py

[bagit.py](https://github.com/LibraryOfCongress/bagit-python) is a Python utility that produces bags according to the [BagIt specification](https://en.wikipedia.org/wiki/BagIt).

See “bagit-python” instructions under the “Command line” section of
[this blog post by Ethan Gates](https://patchbay.tech/2018/03/14/getting-started-with-bagit-in-2018/).

- Python and pip handling changed with macOS Monterey and/or Apple Silicon chips, and we've encountered some issues installing on new computers. After troubleshooting and some OS updates, the brew install python approach has worked on all computers.
