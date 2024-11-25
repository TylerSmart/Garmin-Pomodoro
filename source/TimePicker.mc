import Toybox.Application.Storage;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class TimePicker extends WatchUi.Picker {
    public function initialize(initTime) {
        System.println("TimePicker.initialize");

        var title = new WatchUi.Text({
            :text=>"", 
            :locX=>WatchUi.LAYOUT_HALIGN_LEFT,
            :locY=>WatchUi.LAYOUT_VALIGN_TOP, 
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_SMALL
        });
        var factories = new Array<PickerFactory or Text>[5];
        
        factories[0] = new NumberFactory(0, 23, 1, {:format=>"%02d"});
        factories[1] = new WatchUi.Text({
            :text=> ":", 
            :font=>Graphics.FONT_MEDIUM,
            :locX=>WatchUi.LAYOUT_HALIGN_CENTER, 
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER, :color=>Graphics.COLOR_WHITE
        });
        factories[2] = new NumberFactory(0, 59, 1, {:format=>"%02d"});
        factories[3] = new WatchUi.Text({
            :text=> ":", 
            :font=>Graphics.FONT_MEDIUM,
            :locX=>WatchUi.LAYOUT_HALIGN_CENTER, 
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER, :color=>Graphics.COLOR_WHITE
        });
        factories[4] = new NumberFactory(0, 59, 1, {:format=>"%02d"});

        var hours = initTime / 3600;
        var minutes = (initTime % 3600) / 60;
        var seconds = initTime % 60;

        var defaults = new Array<Number>[5];
        defaults[0] = hours;
        defaults[2] = minutes;
        defaults[4] = seconds;

        Picker.initialize({:title=>title, :pattern=>factories, :defaults=>defaults});
    }

    public function onUpdate(dc as Dc) as Void {
        System.println("TimePicker.onUpdate");

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        Picker.onUpdate(dc);
    }
}