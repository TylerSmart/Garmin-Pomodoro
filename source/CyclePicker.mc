import Toybox.Application.Storage;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class CyclePicker extends WatchUi.Picker {
    public function initialize(initCycles) {
        System.println("CyclePicker.initialize");

        var title = new WatchUi.Text({
            :text=>"", 
            :locX=>WatchUi.LAYOUT_HALIGN_LEFT,
            :locY=>WatchUi.LAYOUT_VALIGN_TOP, 
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_SMALL
        });
        var factories = new Array<PickerFactory or Text>[1];
        
        factories[0] = new NumberFactory(0, 9, 1, {});

        var defaults = new Array<Number>[1];
        defaults[0] = initCycles;

        Picker.initialize({:title=>title, :pattern=>factories, :defaults=>defaults});
    }

    public function onUpdate(dc as Dc) as Void {
        System.println("CyclePicker.onUpdate");

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        Picker.onUpdate(dc);
    }
}