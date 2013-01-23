// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

// TODO: write your module tests here
var tixpath = require('TiXPath');
Ti.API.info("module is => " + tixpath);

var doc = "<product xmlns:sample='http://www.infoteria.com/jp/sample'>" +
              "<sample:name id='1'>name1</sample:name>" +
              "<sample:name id='2'>name2</sample:name>" +
              "<comment/>" +
          "</product>";

var result = tixpath.findXPath({
    doc: doc,
    xpath: "//sample:name/@ida",
    namespaces: {
        "sample": "http://www.infoteria.com/jp/sample"
    }
});

Ti.API.debug(result);
