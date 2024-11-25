import Toybox.Application;
import Toybox.Graphics;
import Toybox.WatchUi;

class PomodoroView extends WatchUi.View {
    private var app as PomodoroApp = Application.getApp();
    private var pomodoro as Pomodoro = app.pomodoro;

    private var timeDrawable;
    private var cycleDrawable;
    private var timerDrawable;
    private var statusDrawable;

    function initialize() {
        System.println("PomodoroView.initialize");

        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        System.println("PomodoroView.onLayout");

        setLayout(Rez.Layouts.MainLayout(dc));

        timeDrawable = findDrawableById("Time");
        cycleDrawable = findDrawableById("Cycle");
        timerDrawable = findDrawableById("Timer");
        statusDrawable = findDrawableById("Status");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        System.println("PomodoroView.onShow");
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        System.println("PomodoroView.onUpdate");

        setTimeText();
        setCycleText();
        setTimerText();
        setStatusText();

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
        System.println("PomodoroView.onHide");
    }

    function setTimeText() as Void {
        System.println("PomodoroView.setTimeText");
        
        var now = System.getClockTime();

        if (System.getDeviceSettings().is24Hour) {
            timeDrawable.setText(now.hour.format("%02d") + ":" + now.min.format("%02d"));
        } else {
            var hour = now.hour % 12;
            if (hour == 0) {
                hour = 12;
            }
            timeDrawable.setText(hour.format("%02d") + ":" + now.min.format("%02d"));
        }
    }

    function setCycleText() as Void {
        System.println("PomodoroView.setCycleText");

        cycleDrawable.setText((((pomodoro.currentCycle - 1) % pomodoro.getCycles()) + 1) + "/" + pomodoro.getCycles());
    }
    
    function setTimerText() as Void {
        System.println("PomodoroView.setTimerText");

        var timeLeft = pomodoro.getTimeLeft();
        var hours = timeLeft / 3600;
        var minutes = (timeLeft % 3600) / 60;
        var seconds = timeLeft % 60;

        timerDrawable.setText(hours.format("%02d") + ":" + minutes.format("%02d") + ":" + seconds.format("%02d"));
    }
    
    function setStatusText() as Void {
        System.println("PomodoroView.setStatusText");

        if (pomodoro.status != READY && pomodoro.paused) {
            statusDrawable.setText("Paused");
        } else {
            switch(pomodoro.status) {
                case WORKING:
                    statusDrawable.setText("Working");
                    break;
                case BREAK:
                    if (pomodoro.isLongBreak()) {
                        statusDrawable.setText("Long Break");
                    } else {
                        statusDrawable.setText("Short Break");
                    }
                    break;
                case READY:
                    statusDrawable.setText("Ready");
                    break;
            }
        }
    }
}
