import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';

/// 捕获视频帧并保存为图片。
///
/// [sourceFile] - 视频源文件路径。
/// [destFile] - 目标图片文件路径。
/// Returns 一个 Future 对象，表示异步操作的结果。
Future captureVideo(
    {required String sourceFile, required String destFile}) async {
  return FFmpegKit.executeAsync(
      '-i $sourceFile  -ss 00:00:02 -r 1 -vframes 1 -an -vcodec mjpeg $destFile');
}

/// 将视频文件转换为音频文件。
///
/// [sourceFile] - 视频源文件路径。
/// [destFile] - 目标音频文件路径。
/// Returns 一个 Future 对象，表示异步操作的结果。
Future videoToAudio(
    {required String sourceFile, required String destFile}) async {
  return FFmpegKit.executeAsync('-i $sourceFile -vn -codec copy $destFile');
}
