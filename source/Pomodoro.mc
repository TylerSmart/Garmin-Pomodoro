import Toybox.Application;
import Toybox.WatchUi;

enum {
    READY,
    WORKING,
    BREAK
}

class Pomodoro {
    public var currentCycle = 1;
    public var status = READY;
    public var paused = true;

    private var app = Application.getApp();

    private var timer = new Timer.Timer();
    var time = 0;

    function initialize() {
        System.println("Pomodoro.initialize");
    }

    function reset() {
        System.println("Pomodoro.reset");

        stop();

        currentCycle = 1;
        status = READY;
        time = 0;

        WatchUi.requestUpdate();
    }

    function start() {
        System.println("Pomodoro.start");

        vibrate(100, 1500);
        playTone(1);

        if (status == READY) {
            status = WORKING;
        }

        paused = false;
        timer.start(method(:onTick), 1000, true);
        WatchUi.requestUpdate();
    }

    function onTick() {
        System.println("Pomodoro.onTick");

        time++;

        switch(self.status) {
            case WORKING:
                if(getTimeLeft() <= 0) {
                    finishWork();
                }
                break;
            case BREAK:
                if(getTimeLeft() <= 0) {
                    finishBreak();
                }
                break;
            case READY:
                stop();
                break;
        }
        WatchUi.requestUpdate();
    }

    function isLongBreak() {
        System.println("Pomodoro.isLongBreak");

        return currentCycle % getCycles() == 0;
    }

    function finishWork() {
        System.println("Pomodoro.finishWork");

        vibrate(50, 1000);
        playTone(10);

        time = 0;
        status = BREAK;
        WatchUi.requestUpdate();
    }

    function finishBreak() {
        System.println("Pomodoro.finishBreak");

        vibrate(50, 1000);
        playTone(10);

        currentCycle++;
        time = 0;

        if (currentCycle > getCycles() && !getLoopInfinitely()) {
            reset();
        } else {
            status = WORKING;
        }
        WatchUi.requestUpdate();
    }

    function stop() {
        System.println("Pomodoro.stop");

        vibrate(100, 1500);
        playTone(2);

        paused = true;
        timer.stop();
        WatchUi.requestUpdate();
    }

    function getWorkingTime() {
        System.println("Pomodoro.getWorkingTime");

        return app.Properties.getValue( "WorkingTime" );
    }
    
    function getShortBreakTime() {
        System.println("Pomodoro.getShortBreakTime");

        return app.Properties.getValue( "ShortBreakTime" );
    }
    
    function getLongBreakTime() {
        System.println("Pomodoro.getLongBreakTime");

        return app.Properties.getValue( "LongBreakTime" );
    }
    
    function getCycles() {
        System.println("Pomodoro.getCycles");

        return app.Properties.getValue( "Cycles" );
    }
    
    function getLoopInfinitely() {
        System.println("Pomodoro.getLoopInfinitely");

        return app.Properties.getValue( "LoopInfinitely" );
    }

    function getTimeLeft() {
        System.println("Pomodoro.getTimeLeft");

        switch(self.status) {
            case WORKING:
            case READY:
                return getWorkingTime() - time;
            case BREAK:
                return isLongBreak() ? getLongBreakTime() - time : getShortBreakTime() - time;
            default:
                return 0;
        }
    }

    function skip() {
        System.println("Pomodoro.skip");

        switch(self.status) {
            case WORKING:
                finishWork();
                break;
            case BREAK:
                finishBreak();
                break;
        }
    }
}