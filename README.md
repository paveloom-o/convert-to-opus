# Convert to Opus

The script ([`convert.bash`](./convert.bash)) converts directories with releases (e.g., a music album as a single directory with audio files as tracks inside) from lossless formats ([FLAC](https://en.wikipedia.org/wiki/FLAC), [WAV](https://en.wikipedia.org/wiki/WAV)) to the [Opus](https://en.wikipedia.org/wiki/Opus_(audio_format)) format. The goal is to minimize the size of the audio files while preserving the quality of the music as much as possible.

The only dependency is [FFmpeg](https://ffmpeg.org). Your build should support codecs for the mentioned formats.

Here's an example of downloading a release via [`streamrip`](https://github.com/nathom/streamrip) and running the script on it:

```console
$ tree
.
├── clean.bash
├── convert.bash
├── LICENSE.md
└── README.md

1 directory, 4 files
$ rip --no-db url https://www.qobuz.com/us-en/album/opvs-noir-vol-1-lord-of-the-lost/n05wrgh7q6yla
$ tree
.
├── clean.bash
├── convert.bash
├── LICENSE.md
├── Lord Of The Lost - OPVS NOIR Vol. 1 (2025) [FLAC] [24B-44.1kHz]
│   ├── 01. Lord Of The Lost - Bazaar Bizarre.flac
│   ├── 02. Lord Of The Lost - My Sanctuary.flac
│   ├── 03. Lord Of The Lost - Light Can Only Shine In The Darkness.flac
│   ├── 04. Lord Of The Lost - I Will Die In It.flac
│   ├── 05. Lord Of The Lost - Moonstruck.flac
│   ├── 06. Lord Of The Lost - Damage.flac
│   ├── 07. Lord Of The Lost - Ghosts.flac
│   ├── 08. Lord Of The Lost - Lords Of Fyre.flac
│   ├── 09. Lord Of The Lost - The Things We Do For Love.flac
│   ├── 10. Lord Of The Lost - The Sadness In Everything.flac
│   ├── 11. Lord Of The Lost - Dreams Are Never Alone.flac
│   └── cover.jpg
└── README.md

2 directories, 16 files
$ ./convert.bash
Converting "Lord Of The Lost - OPVS NOIR Vol. 1 (2025) [FLAC] [24B-44.1kHz]"... (11/11)
$ tree
.
├── clean.bash
├── convert.bash
├── LICENSE.md
├── Lord Of The Lost - OPVS NOIR Vol. 1 (2025) [FLAC] [24B-44.1kHz]
│   ├── 01. Lord Of The Lost - Bazaar Bizarre.flac
│   ├── 02. Lord Of The Lost - My Sanctuary.flac
│   ├── 03. Lord Of The Lost - Light Can Only Shine In The Darkness.flac
│   ├── 04. Lord Of The Lost - I Will Die In It.flac
│   ├── 05. Lord Of The Lost - Moonstruck.flac
│   ├── 06. Lord Of The Lost - Damage.flac
│   ├── 07. Lord Of The Lost - Ghosts.flac
│   ├── 08. Lord Of The Lost - Lords Of Fyre.flac
│   ├── 09. Lord Of The Lost - The Things We Do For Love.flac
│   ├── 10. Lord Of The Lost - The Sadness In Everything.flac
│   ├── 11. Lord Of The Lost - Dreams Are Never Alone.flac
│   └── cover.jpg
├── Lord Of The Lost - OPVS NOIR Vol. 1 (2025) [FLAC] [24B-44.1kHz] (Opus)
│   ├── 01. Lord Of The Lost - Bazaar Bizarre.opus
│   ├── 02. Lord Of The Lost - My Sanctuary.opus
│   ├── 03. Lord Of The Lost - Light Can Only Shine In The Darkness.opus
│   ├── 04. Lord Of The Lost - I Will Die In It.opus
│   ├── 05. Lord Of The Lost - Moonstruck.opus
│   ├── 06. Lord Of The Lost - Damage.opus
│   ├── 07. Lord Of The Lost - Ghosts.opus
│   ├── 08. Lord Of The Lost - Lords Of Fyre.opus
│   ├── 09. Lord Of The Lost - The Things We Do For Love.opus
│   ├── 10. Lord Of The Lost - The Sadness In Everything.opus
│   └── 11. Lord Of The Lost - Dreams Are Never Alone.opus
└── README.md

3 directories, 27 files
$ du -h **/
541M    Lord Of The Lost - OPVS NOIR Vol. 1 (2025) [FLAC] [24B-44.1kHz]/
30M     Lord Of The Lost - OPVS NOIR Vol. 1 (2025) [FLAC] [24B-44.1kHz] (Opus)/
```

Running the [`clean.bash`](./clean.bash) script will then remove the two directories.

Git mirrors:

- [Codeberg](https://codeberg.org/paveloom-o/convert-to-opus)
- [GitHub](https://github.com/paveloom-o/convert-to-opus)
- [GitLab](https://gitlab.com/paveloom-g/other/convert-to-opus)
