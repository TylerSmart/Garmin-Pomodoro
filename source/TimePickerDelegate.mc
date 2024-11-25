import Toybox.Application.Storage;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class TimePickerDelegate extends WatchUi.PickerDelegate {
    private var app = Application.getApp();

    private var propertyName as String;
    private var item;

    public function initialize(initPropertyName, initItem) {
        System.println("TimePickerDelegate.initialize");

        propertyName = initPropertyName;
        item = initItem;

        PickerDelegate.initialize();
    }

    public function onCancel() as Boolean {
        System.println("TimePickerDelegate.onCancel");

        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }

    public function onAccept(values as Array) as Boolean {
        System.println("TimePickerDelegate.onAccept");

        var hour = values[0] as Number;
        var minutes = values[2] as Number;
        var seconds = values[4] as Number;

        var time = hour * 3600 + minutes * 60 + seconds;

        app.Properties.setValue(propertyName, time);

        item.setSubLabel(toTimeString(time));

        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        
        return true;
    }

    function toTimeString(time) {
        var hours = Math.floor(time / 3600);
        var minutes = Math.floor((time % 3600) / 60);
        var seconds = time % 60;

        return hours.format("%02d") + ":" + minutes.format("%02d") + ":" + seconds.format("%02d");

    }
}