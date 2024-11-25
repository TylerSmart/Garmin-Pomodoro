import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;



class PomodoroDelegate extends WatchUi.BehaviorDelegate {
    private var app as PomodoroApp = Application.getApp();
    private var pomodoro as Pomodoro = app.pomodoro;

    function initialize() {
        System.println("PomodoroDelegate.initialize");

        BehaviorDelegate.initialize();
    }

    function onMenu() {
        System.println("PomodoroDelegate.onMenu");

        WatchUi.pushView(new PomodoroMenu(), new PomodoroMenuDelegate(), WatchUi.SLIDE_LEFT);

        return true;
    }

    function onSelect() {
        System.println("PomodoroDelegate.onSelect");

        if(pomodoro.paused) {
            pomodoro.start();
        } else {
            pomodoro.stop();
        }

        return true;
    }

    function onBack() {
        System.println("PomodoroDelegate.onBack");

        if(!pomodoro.paused) {
            pomodoro.skip();
        } else {
            // open a custom menu to ask about resetting the timer or quitting the app
            WatchUi.pushView(new Rez.Menus.BackMenu(), new PomodoroBackMenuDelegate(), WatchUi.SLIDE_LEFT);
        }

        return true;
    }
}