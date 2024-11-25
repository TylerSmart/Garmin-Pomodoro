import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Application;
import Toybox.System;

class PomodoroMenu extends WatchUi.Menu2 {
    private var app = Application.getApp();

    function initialize() {
        System.println("PomodoroMenu.initialize");


        self.addItem(
            new MenuItem(
                "Working Time",
                toTimeString(app.Properties.getValue("WorkingTime")),
                "WorkingTime",
                {}
            )
        );

        self.addItem(
            new MenuItem(
                "Short Break Time",
                toTimeString(app.Properties.getValue("ShortBreakTime")),
                "ShortBreakTime",
                {}
            )
        );

        self.addItem(
            new MenuItem(
                "Long Break Time",
                toTimeString(app.Properties.getValue("LongBreakTime")),
                "LongBreakTime",
                {}
            )
        );

        self.addItem(
            new MenuItem(
                "Cycles",
                app.Properties.getValue("Cycles").toString(),
                "Cycles",
                {}
            )
        );

        self.addItem(
            new ToggleMenuItem(
                "Loop Infinitely",
                {
                    :enabled => "On",
                    :disabled => "Off",
                },
                "LoopInfinitely",
                app.Properties.getValue("LoopInfinitely"),
                {}
            )
        );

        self.addItem(
            new ToggleMenuItem(
                "Display Time",
                {
                    :enabled => "On",
                    :disabled => "Off",
                },
                "DisplayTime",
                app.Properties.getValue("DisplayTime"),
                {}
            )
        );

        self.addItem(
            new ToggleMenuItem(
                "Vibrate",
                {
                    :enabled => "On",
                    :disabled => "Off",
                },
                "Vibrate",
                app.Properties.getValue("Vibrate"),
                {}
            )
        );

        self.addItem(
            new ToggleMenuItem(
                "Play Tone",
                {
                    :enabled => "On",
                    :disabled => "Off",
                },
                "PlayTone",
                app.Properties.getValue("PlayTone"),
                {}
            )
        );

        var title = new WatchUi.TextArea({
            :text=>"Settings", 
            :locX=>0,
            :locY=>20,
            :width=>85,
            :height=>30, 
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_SMALL,
            :justification=>Graphics.TEXT_JUSTIFY_RIGHT
        });

        Menu2.initialize({
            :title => title
        });
    }

    function toTimeString(time) {
        var hours = Math.floor(time / 3600);
        var minutes = Math.floor((time % 3600) / 60);
        var seconds = time % 60;

        return hours.format("%02d") + ":" + minutes.format("%02d") + ":" + seconds.format("%02d");

    }
}


