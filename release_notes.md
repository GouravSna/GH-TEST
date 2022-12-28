# Release notes

### 2.18.2 (2022-11-22)

This release corresponds to the
[AndroidX Media3 1.0.0-beta03 release](https://github.com/androidx/media/releases/tag/1.0.0-beta03).

*   Core library:
    *   Add `ExoPlayer.isTunnelingEnabled` to check if tunneling is enabled for
        the currently selected tracks
        ([#2518](https://github.com/google/ExoPlayer/issues/2518)).
    *   Add `WrappingMediaSource` to simplify wrapping a single `MediaSource`
        ([#7279](https://github.com/google/ExoPlayer/issues/7279)).
    *   Discard back buffer before playback gets stuck due to insufficient
        available memory.
    *   Close the Tracing "doSomeWork" block when offload is enabled.
    *   Fix session tracking problem with fast seeks in `PlaybackStatsListener`
        ([#180](https://github.com/androidx/media/issues/180)).
    *   Send missing `onMediaItemTransition` callback when calling `seekToNext`
        or `seekToPrevious` in a single-item playlist
        ([#10667](https://github.com/google/ExoPlayer/issues/10667)).
    *   Add `Player.getSurfaceSize` that returns the size of the surface on
        which the video is rendered.
    *   Fix bug where removing listeners during the player release can cause an
        `IllegalStateException`
        ([#10758](https://github.com/google/ExoPlayer/issues/10758)).
*   Build:
    *   Enforce minimum `compileSdkVersion` to avoid compilation errors
        ([#10684](https://github.com/google/ExoPlayer/issues/10684)).
*   Track selection:
    *   Prefer other tracks to Dolby Vision if display does not support it.
        ([#8944](https://github.com/google/ExoPlayer/issues/8944)).
*   Downloads:
    *   Fix potential infinite loop in `ProgressiveDownloader` caused by
        simultaneous download and playback with the same `PriorityTaskManager`
        ([#10570](https://github.com/google/ExoPlayer/pull/10570)).
    *   Make download notification appear immediately
        ([#183](https://github.com/androidx/media/pull/183)).
    *   Limit parallel download removals to 1 to avoid excessive thread creation
        ([#10458](https://github.com/google/ExoPlayer/issues/10458)).
*   Video:
    *   Try alternative decoder for Dolby Vision if display does not support it.
        ([#9794](https://github.com/google/ExoPlayer/issues/9794)).
*   Audio:
    *   Use `SingleThreadExecutor` for releasing `AudioTrack` instances to avoid
        OutOfMemory errors when releasing multiple players at the same time
        ([#10057](https://github.com/google/ExoPlayer/issues/10057)).
    *   Adds `AudioOffloadListener.onExperimentalOffloadedPlayback` for the
        AudioTrack offload state.
        ([#134](https://github.com/androidx/media/issues/134)).
    *   Make `AudioTrackBufferSizeProvider` a public interface.
    *   Add `ExoPlayer.setPreferredAudioDevice` to set the preferred audio
        output device ([#135](https://github.com/androidx/media/issues/135)).
    *   Map 8-channel and 12-channel audio to the 7.1 and 7.1.4 channel masks
        respectively on all Android versions
        ([#10701](https://github.com/google/ExoPlayer/issues/10701)).
*   Metadata:
    *   `MetadataRenderer` can now be configured to render metadata as soon as
        they are available. Create an instance with
        `MetadataRenderer(MetadataOutput, Looper, MetadataDecoderFactory,
        boolean)` to specify whether the renderer will output metadata early or
        in sync with the player position.
*   DRM:
    *   Work around a bug in the Android 13 ClearKey implementation that returns
        a non-empty but invalid license URL.
    *   Fix `setMediaDrmSession failed: session not opened` error when switching
        between DRM schemes in a playlist (e.g. Widevine to ClearKey).
*   Text:
    *   CEA-608: Ensure service switch commands on field 2 are handled correctly
        ([#10666](https://github.com/google/ExoPlayer/issues/10666)).
*   DASH:
    *   Parse `EventStream.presentationTimeOffset` from manifests
        ([#10460](https://github.com/google/ExoPlayer/issues/10460)).
*   UI:
    *   Use current overrides of the player as preset in
        `TrackSelectionDialogBuilder`
        ([#10429](https://github.com/google/ExoPlayer/issues/10429)).
*   RTSP:
    *   Add H263 fragmented packet handling
        ([#119](https://github.com/androidx/media/pull/119)).
    *   Add support for MP4A-LATM
        ([#162](https://github.com/androidx/media/pull/162)).
*   IMA:
    *   Add timeout for loading ad information to handle cases where the IMA SDK
        gets stuck loading an ad
        ([#10510](https://github.com/google/ExoPlayer/issues/10510)).
    *   Prevent skipping mid-roll ads when seeking to the end of the content
        ([#10685](https://github.com/google/ExoPlayer/issues/10685)).
    *   Correctly calculate window duration for live streams with server-side
        inserted ads, for example IMA DAI
        ([#10764](https://github.com/google/ExoPlayer/issues/10764)).
*   FFmpeg extension:
    *   Add newly required flags to link FFmpeg libraries with NDK 23.1.7779620
        and above ([#9933](https://github.com/google/ExoPlayer/issues/9933)).
*   AV1 extension:
    *   Update CMake version to avoid incompatibilities with the latest Android
        Studio releases
        ([#9933](https://github.com/google/ExoPlayer/issues/9933)).
*   Cast extension:
    *   Implement `getDeviceInfo()` to be able to identify `CastPlayer` when
        controlling playback with a `MediaController`
        ([#142](https://github.com/androidx/media/issues/142)).
*   Transformer:
    *   Add muxer watchdog timer to detect when generating an output sample is
        too slow.
*   Remove deprecated symbols:
    *   Remove `Transformer.Builder.setOutputMimeType(String)`. This feature has
        been removed. The MIME type will always be MP4 when the default muxer is
        used.
