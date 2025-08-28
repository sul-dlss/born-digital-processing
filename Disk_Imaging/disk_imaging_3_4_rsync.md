Previous step: [Before imaging](disk_imaging_2.md).
Next step: [After imaging](disk_imaging_4.md).

## Imaging 3.4: Performing a file transfer on Mac using rsync

### Requirements

- Mac computer

- Write blocker (see [Write blocking](disk_imaging_2.md#write-blocking))

- bagit.py (see [Installing bagit.py](disk_imaging_2.md#installing-bagit.py))

### Results

- Files transferred to storage location with no changes to directory structure, data, or metadata
- Files stored longterm in a [standardized "bag"](https://en.wikipedia.org/wiki/BagIt)

## Directions

1.  Connect your media to the computer through a physical write blocker.

    *  The media should mount and become accessible through the Mac
        Finder.

2.  Open the Terminal application.

3.  Click on your media to access the files.

4.  Begin a file transfer through the terminal, using rsync.

     ```rsync -avh --progress /path/to/source /path/to/destination```

5.  After transfer, files should be bagged using the Library of
    Congress's [bagit-python utility](https://github.com/LibraryOfCongress/bagit-python). This step should also be performed on a Mac.

    ``python3 -m bagit --md5 --contact-name "Annie Schweikert" --source-organization "Stanford Born-Digital Preservation Lab" --internal-sender-identifier "M1234_2025-123" /path/to/parentdirectory /path/to/outputbag``

### Notes on rsync

- Rsync is a built-in utility for Unix, with documentation here:
  [https://linux.die.net/man/1/rsync](https://linux.die.net/man/1/rsync)

- Rsync is run from the Terminal app. The BDPL uses the following standard command:

  ``rsync -avh --progress /path/to/source /path/to/destination``

  - Explanation of flags:

    - ``-a`` archive mode, equal to -rlptgoD (no -H,-A,-X); see
      [documentation](https://linux.die.net/man/1/rsync) for the
      specific flags this encompasses

    - ``-v`` verbose

    - ``-h`` human-readable numbers

    - ``--progress`` show progress during transfer

  - The command can be stopped with ``ctrl+c`` and restarted by re-running
    the command; the transfer will pick up where it was stopped.

- rsync commands should be run twice, in order
  to pick up and fix any errors or changes. Rsync will only try to
  retransfer files that failed or changed the first time around, so the
  second run is usually very quick.

### Alternate tools
In some cases, the BDPL does not have access to a Mac or Linux machine with rsync, and may use the following alternate tools:

- Alternate tool: [TeraCopy for Mac](https://www.codesector.com/teracopy-for-mac) (can also be
  downloaded in the App Store)

  - TeraCopy for Mac is more limited than the Windows version, but it has the benefit of providing a GUI interface.

- Backup option: File extraction through FTK Imager

  - If media can’t be accessed through the Finder, try mounting the
    live media on a Windows machine in FTK Imager (File -&gt; Add
    Evidence Item), right-click on the filesystem, select “Export
    Files,” and direct the files to the appropriate storage location.
    
Once materials are in their storage location, run the BagIt command described above.
