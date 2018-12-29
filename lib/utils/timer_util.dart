import 'dart:async';

typedef void OnTimerTickCallback(int millisUntilFinished);

class TimerUtil {
  TimerUtil({this.interval: Duration.millisecondsPerSecond, this.totalTime});

  Timer _timer;

  bool _isActive = false;

  int interval;

  int totalTime;

  OnTimerTickCallback _onTimerTickCallback;

  void setOnTimerTickCallback(OnTimerTickCallback callback) {
    _onTimerTickCallback = callback;
  }

  void startCountDown() {
    if (_isActive || totalTime <= 0) return;
    _isActive = true;

    _cb(totalTime);

    _timer = Timer.periodic(Duration(milliseconds: interval), (Timer timer) {
      int time = totalTime - interval;
      totalTime = time;
      if (time >= interval) {
        _cb(time);
      } else if (time == 0) {
        _cb(time);
        cancel();
      } else {
        timer.cancel();
        Future.delayed(Duration(milliseconds: time), () {
          _cb(0);
          cancel();
        });
      }
    });
  }

  void cancel() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    totalTime = 0;
    _isActive = false;
  }

  void _cb(int time) {
    if (_onTimerTickCallback != null) _onTimerTickCallback(time);
  }
}
