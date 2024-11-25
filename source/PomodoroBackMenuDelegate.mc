import Toybox.WatchUi;
import Toybox.Lang;

class PomodoroBackMenuDelegate extends WatchUi.Menu2InputDelegate {
    private var app as PomodoroApp = Application.getApp();
    private var pomodoro as Pomodoro = app.pomodoro;

    function initialize() {
        System.println("PomodoroBackMenuDelegate.initialize");

        Menu2InputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        System.println("PomodoroBackMenuDelegate.onMenuItem");

        switch(item) {
            case :Reset:
                System.println("Reset");
                pomodoro.reset();
                break;
            case :Exit:
                System.println("Exit");
                WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
                break;
        }
    }
}