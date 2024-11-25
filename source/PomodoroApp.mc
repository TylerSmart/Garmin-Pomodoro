import Toybox.Application;
import Toybox.Attention;
import Toybox.Lang;
import Toybox.WatchUi;

class PomodoroApp extends Application.AppBase {
    public var pomodoro as Pomodoro = new Pomodoro();

    function initialize() {
        System.println("PomodoroApp.initialize");

        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        System.println("PomodoroApp.onStart");
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
        pomodoro.stop();

        System.println("PomodoroApp.onStop");
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        System.println("PomodoroApp.getInitialView");

        return [ new PomodoroView(), new PomodoroDelegate() ];
    }
}

function getApp() as PomodoroApp {
    return Application.getApp() as PomodoroApp;
}

function vibrate( dutyCycle, length ) {
	if ( Attention has :vibrate && Application.Properties.getValue( "Vibrate" ) ) {
		Attention.vibrate( [ new Attention.VibeProfile( dutyCycle, length ) ] );
	}
}

function playTone( tone ) {
	if ( Attention has :playTone && Application.Properties.getValue( "PlayTone" ) ) {
		Attention.playTone( tone );
	}
}