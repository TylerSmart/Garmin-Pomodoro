import Toybox.Application;
import Toybox.WatchUi;

class PomodoroMenuDelegate extends WatchUi.Menu2InputDelegate {
    private var app = Application.getApp();


    function initialize() {
        System.println("PomodoroMenuDelegate.initialize");

        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        System.println("PomodoroMenuDelegate.onMenuItem");
        
        System.println(item.getId());

        switch(item.getId()) {
            case "WorkingTime":
                System.println("WorkingTime");

                WatchUi.pushView(new TimePicker(app.Properties.getValue("WorkingTime")), new TimePickerDelegate("WorkingTime", item), WatchUi.SLIDE_LEFT);

                break;
            case "ShortBreakTime":
                System.println("ShortBreakTime");

                WatchUi.pushView(new TimePicker(app.Properties.getValue("ShortBreakTime")), new TimePickerDelegate("ShortBreakTime", item), WatchUi.SLIDE_LEFT);

                break;
            case "LongBreakTime":
                System.println("LongBreakTime");

                WatchUi.pushView(new TimePicker(app.Properties.getValue("LongBreakTime")), new TimePickerDelegate("LongBreakTime", item), WatchUi.SLIDE_LEFT);

                break;
            case "Cycles":
                System.println("Cycles");

                WatchUi.pushView(new CyclePicker(app.Properties.getValue("Cycles")), new CyclePickerDelegate("Cycles", item), WatchUi.SLIDE_LEFT);                

                break;
            case "LoopInfinitely":
                System.println("LoopInfinitely");

                app.Properties.setValue("LoopInfinitely", !app.Properties.getValue("LoopInfinitely"));

                break;
            case "DisplayTime":
                System.println("DisplayTime");

                app.Properties.setValue("DisplayTime", !app.Properties.getValue("DisplayTime"));

                break;
            case "Vibrate":
                System.println("Vibrate");

                app.Properties.setValue("Vibrate", !app.Properties.getValue("Vibrate"));

                break;
            case "PlayTone":
                System.println("PlayTone");

                app.Properties.setValue("PlayTone", !app.Properties.getValue("PlayTone"));

                break;
        }

    }
}