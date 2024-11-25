import Toybox.Application.Storage;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class CyclePickerDelegate extends WatchUi.PickerDelegate {
    private var app = Application.getApp();

    private var propertyName as String;
    private var item;

    public function initialize(initPropertyName, initItem) {
        System.println("CyclePickerDelegate.initialize");

        propertyName = initPropertyName;
        item = initItem;

        PickerDelegate.initialize();
    }

    public function onCancel() as Boolean {
        System.println("CyclePickerDelegate.onCancel");

        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }

    public function onAccept(values as Array) as Boolean {
        System.println("CyclePickerDelegate.onAccept");

        var cycles = values[0] as Number;

        app.Properties.setValue(propertyName, cycles);

        item.setSubLabel(cycles.toString());

        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        
        return true;
    }
}