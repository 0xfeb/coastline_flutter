import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

Future captureVideo(
    {required String sourceFile, required String destFile}) async {
  return FFmpegKit.executeAsync(
      '-i $sourceFile  -ss 00:00:02 -r 1 -vframes 1 -an -vcodec mjpeg $destFile');
}

Future videoToAudio(
    {required String sourceFile, required String destFile}) async {
  return FFmpegKit.executeAsync('-i $sourceFile -vn -codec copy $destFile');
}
