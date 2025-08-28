Previous step: [Before imaging](Disk_Imaging/disk_imaging_2.md).
Next step: [After imaging](Disk_Imaging/disk_imaging_4.md).

## Imaging 3.5: Performing a file transfer on Windows using TeraCopy

### Requirements

- Windows computer

- Write blocker (see [Write blocking](Disk_Imaging/disk_imaging_2.md#write-blocking))

- [TeraCopy](https://www.codesector.com/teracopy) installed (free download from the Exterro website)

  - Admin access to your computer is required to launch FTK Imager

- bagit.py (see [Installing bagit.py](Disk_Imaging/disk_imaging_2.md#installing-bagit.py))

### Results

- Files transferred to storage location with no changes to directory structure, data, or metadata
- Files stored longterm in a [standardized "bag"](https://en.wikipedia.org/wiki/BagIt)

## Directions

1.  Connect your media to the computer through a physical write blocker.

    *  The media should mount and become accessible through Windows
        File Explorer.

2.  Open TeraCopy.

3.  Click on your media to access the files.

4.  Begin a file transfer to the appropriate place on the BDPL server. This transfer can be started in two ways:
    * Directly from the TeraCopy GUI
    * From File Explorer through the "drag and drop" motion, but ONLY if TeraCopy has been set up as the default drag-and-drop handler

5.  After transfer, files should be bagged using the Library of
    Congress's [bagit-python utility](https://github.com/LibraryOfCongress/bagit-python) This step should be performed on a Mac.

    ``python3 -m bagit --md5 --contact-name "Annie Schweikert" --source-organization "Stanford Born-Digital Preservation Lab" --internal-sender-identifier "M1234_2025-123" /path/to/parentdirectory /path/to/outputbag``

### Notes on TeraCopy

- TeraCopy [can be set as your default file handler](https://support.codesector.com/en/articles/8789949-drag-and-drop-confirmation-dialog),
  so that when you drag and drop or copy and paste files in the Windows
  File Explorer, it handles that process. This gets set up during
  install.

- Documentation on how to use TeraCopy can be found [here](https://www.dpconline.org/handbook/tool-demos/teracopy-demo).

### Alternate tools
In some cases, the BDPL may use the following alternate tools:

- Alternate tool: [FastCopy](https://fastcopy.jp/)

  - This tool is quicker to transfer large numbers of small files.

- Backup option: File extraction through FTK Imager

  - If media can’t be accessed through the Finder, try mounting the
    live media on a Windows machine in FTK Imager (File -&gt; Add
    Evidence Item), right-click on the filesystem, select “Export
    Files,” and direct the files to the appropriate storage location.
    
Once materials are in their storage location, run the BagIt command described above.
